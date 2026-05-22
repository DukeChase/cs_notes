#!/usr/bin/env bash
# ============================================================
# CS Notes - SSL 证书安装脚本
# 功能：使用 Let's Encrypt + Certbot 获取 SSL 证书并配置自动续期
#
# 注意：此脚本需在服务器上以 root 权限运行
#
# 前置条件：
#   1. 域名已解析到服务器 IP
#   2. Nginx 已安装且正在运行
#   3. 80 端口可从外网访问（Let's Encrypt HTTP-01 验证需要）
#   4. 已部署 Nginx 配置文件（至少包含 HTTP 80 端口的 server 块）
#
# 用法：
#   sudo ./setup-ssl.sh                          # 交互式
#   sudo DOMAIN=cs.example.com ./setup-ssl.sh    # 非交互式
#   sudo ./setup-ssl.sh --dry-run                # 测试获取证书，不实际安装
#   sudo ./setup-ssl.sh --renew                  # 手动续期
# ============================================================

set -euo pipefail

# -------------------- 颜色输出 --------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info()  { echo -e "${BLUE}[INFO]${NC} $*"; }
ok()    { echo -e "${GREEN}[OK]${NC} $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*"; exit 1; }

# -------------------- 配置 --------------------
DOMAIN="${DOMAIN:-}"
EMAIL="${EMAIL:-}"         # Let's Encrypt 通知邮箱（可选但推荐）
DRY_RUN=false
RENEW_ONLY=false
NGINX_CONF_DIR="${NGINX_CONF_DIR:-/etc/nginx}"
CERT_DIR="/etc/letsencrypt/live"

# -------------------- 解析参数 --------------------
while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --renew)
            RENEW_ONLY=true
            shift
            ;;
        --domain=*)
            DOMAIN="${1#*=}"
            shift
            ;;
        --email=*)
            EMAIL="${1#*=}"
            shift
            ;;
        --help|-h)
            echo "Usage: sudo $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --dry-run         Test certificate acquisition without installing"
            echo "  --renew           Manually renew existing certificate"
            echo "  --domain=DOMAIN   Domain name (or set DOMAIN env var)"
            echo "  --email=EMAIL     Email for Let's Encrypt notifications"
            echo "  --help            Show this help message"
            echo ""
            echo "Environment variables:"
            echo "  DOMAIN            Domain name (required)"
            echo "  EMAIL             Email for Let's Encrypt (optional but recommended)"
            exit 0
            ;;
        *)
            error "Unknown option: $1. Use --help for usage."
            ;;
    esac
done

# -------------------- 权限检查 --------------------
if [[ "$EUID" -ne 0 ]]; then
    error "This script must be run as root. Use: sudo $0"
fi

# -------------------- 续期模式 --------------------
if [[ "$RENEW_ONLY" == true ]]; then
    info "Renewing existing certificates..."
    certbot renew --quiet
    systemctl reload nginx 2>/dev/null || service nginx reload 2>/dev/null || true
    ok "Certificate renewal completed"
    exit 0
fi

# -------------------- 获取域名 --------------------
if [[ -z "$DOMAIN" ]]; then
    # 尝试从 Nginx 配置中提取
    EXISTING_DOMAIN=$(grep -rh "server_name" "$NGINX_CONF_DIR/sites-enabled/" 2>/dev/null | head -1 | sed 's/server_name//;s/;//;s/ //g' || true)
    if [[ -n "$EXISTING_DOMAIN" && "$EXISTING_DOMAIN" != "_" && "$EXISTING_DOMAIN" != "localhost" ]]; then
        echo -e "${YELLOW}Detected domain from Nginx config: $EXISTING_DOMAIN${NC}"
        read -rp "Use this domain? [Y/n] " CONFIRM
        if [[ "${CONFIRM,,}" != "n" ]]; then
            DOMAIN="$EXISTING_DOMAIN"
        fi
    fi

    if [[ -z "$DOMAIN" ]]; then
        read -rp "Enter your domain name (e.g. cs.example.com): " DOMAIN
        if [[ -z "$DOMAIN" ]]; then
            error "Domain name is required."
        fi
    fi
fi

info "Domain: $DOMAIN"

# -------------------- 获取邮箱 --------------------
if [[ -z "$EMAIL" ]]; then
    read -rp "Enter email for Let's Encrypt notifications (optional, press Enter to skip): " EMAIL
fi

# -------------------- 前置检查 --------------------
info "Running pre-flight checks..."

# 检查域名是否解析到本机
SERVER_IP=$(curl -s ifconfig.me 2>/dev/null || curl -s icanhazip.com 2>/dev/null || echo "")
DOMAIN_IP=$(dig +short "$DOMAIN" 2>/dev/null | tail -1 || echo "")

if [[ -n "$SERVER_IP" && -n "$DOMAIN_IP" ]]; then
    if [[ "$SERVER_IP" != "$DOMAIN_IP" ]]; then
        warn "Domain $DOMAIN resolves to $DOMAIN_IP, but this server's IP is $SERVER_IP"
        warn "Let's Encrypt verification may fail if DNS is not pointing to this server"
        read -rp "Continue anyway? [y/N] " CONFIRM
        if [[ "${CONFIRM,,}" != "y" ]]; then
            exit 0
        fi
    else
        ok "DNS resolution correct: $DOMAIN -> $DOMAIN_IP"
    fi
else
    warn "Could not verify DNS resolution. Proceeding anyway..."
fi

# 检查 80 端口是否可达
if ! ss -tlnp | grep -q ":80 "; then
    warn "Port 80 is not listening. Let's Encrypt HTTP-01 challenge requires port 80."
fi

ok "Pre-flight checks completed"

# -------------------- 检测操作系统并安装 Certbot --------------------
install_certbot() {
    if command -v certbot &>/dev/null; then
        ok "Certbot is already installed: $(certbot --version 2>&1)"
        return 0
    fi

    info "Installing Certbot..."

    # 检测 Linux 发行版
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
    else
        error "Cannot detect OS. Please install certbot manually."
    fi

    case "$ID" in
        ubuntu|debian)
            apt-get update -y
            apt-get install -y certbot python3-certbot-nginx
            ;;
        centos|rhel|rocky|almalinux)
            yum install -y epel-release
            yum install -y certbot python3-certbot-nginx
            ;;
        amazon|amzn)
            yum install -y certbot python3-certbot-nginx
            ;;
        arch|manjaro)
            pacman -Sy --noconfirm certbot certbot-nginx
            ;;
        *)
            warn "Unsupported OS: $ID. Trying snap installation..."
            if command -v snap &>/dev/null; then
                snap install --classic certbot
                ln -sf /snap/bin/certbot /usr/bin/certbot
            else
                error "Cannot install certbot automatically on $ID. Please install it manually: https://certbot.eff.org/"
            fi
            ;;
    esac

    ok "Certbot installed: $(certbot --version 2>&1)"
}

install_certbot

# -------------------- 准备 Nginx 临时配置 --------------------
# Certbot 需要通过 Nginx 插件自动完成验证
# 确保 Nginx 配置中有对应域名的 server 块

NGINX_SITE_CONF="$NGINX_CONF_DIR/sites-available/cs-notes"
NGINX_ENABLED_CONF="$NGINX_CONF_DIR/sites-enabled/cs-notes"

# 检查是否已有配置
if [[ ! -f "$NGINX_SITE_CONF" ]]; then
    warn "Nginx site config not found at $NGINX_SITE_CONF"
    info "Creating a temporary Nginx config for certificate validation..."

    mkdir -p "$NGINX_CONF_DIR/sites-available"
    mkdir -p "$NGINX_CONF_DIR/sites-enabled"

    cat > "$NGINX_SITE_CONF" <<EOF
# Temporary config for Let's Encrypt certificate validation
# Replace with the full config from deploy/nginx.conf after certificate is obtained
server {
    listen 80;
    listen [::]:80;
    server_name $DOMAIN;

    root /var/www/cs-notes;
    index index.html;

    location / {
        try_files \$uri \$uri/ /index.html;
    }

    # Allow Certbot validation
    location ^~ /.well-known/acme-challenge/ {
        default_type "text/plain";
        root /var/www/cs-notes;
    }
}
EOF

    # 创建符号链接
    if [[ ! -L "$NGINX_ENABLED_CONF" ]]; then
        ln -s "$NGINX_SITE_CONF" "$NGINX_ENABLED_CONF"
    fi

    # 测试并重载 Nginx
    nginx -t && systemctl reload nginx
    ok "Temporary Nginx config created"
fi

# -------------------- 获取 SSL 证书 --------------------
info "Obtaining SSL certificate for $DOMAIN..."

CERTBOT_ARGS=(
    --nginx                    # 使用 Nginx 插件自动配置
    --domain "$DOMAIN"
    --non-interactive
    --agree-tos
)

# 添加邮箱（可选）
if [[ -n "$EMAIL" ]]; then
    CERTBOT_ARGS+=(--email "$EMAIL")
else
    CERTBOT_ARGS+=(--register-unsafely-without-email)
    warn "No email provided. You will NOT receive expiration notifications."
fi

# Dry run 模式
if [[ "$DRY_RUN" == true ]]; then
    CERTBOT_ARGS+=(--dry-run)
    warn "DRY RUN - certificate will NOT be actually issued"
fi

certbot "${CERTBOT_ARGS[@]}"

if [[ "$DRY_RUN" == true ]]; then
    ok "Dry run successful! Certificate can be obtained."
    exit 0
fi

# -------------------- 验证证书 --------------------
info "Verifying certificate..."

CERT_PATH="$CERT_DIR/$DOMAIN/fullchain.pem"
KEY_PATH="$CERT_DIR/$DOMAIN/privkey.pem"

if [[ -f "$CERT_PATH" && -f "$KEY_PATH" ]]; then
    ok "Certificate files found:"
    ok "  Certificate: $CERT_PATH"
    ok "  Private Key: $KEY_PATH"

    # 显示证书信息
    CERT_INFO=$(openssl x509 -in "$CERT_PATH" -noout -subject -dates 2>/dev/null || echo "Could not read certificate")
    info "Certificate info: $CERT_INFO"
else
    error "Certificate files not found at expected paths. Check certbot output above."
fi

# -------------------- 更新 Nginx 配置 --------------------
info "Updating Nginx configuration with SSL..."

# 检查当前配置是否已被 certbot 修改（certbot --nginx 会自动添加 SSL）
if grep -q "ssl_certificate" "$NGINX_SITE_CONF" 2>/dev/null; then
    ok "Certbot has already added SSL configuration to $NGINX_SITE_CONF"
    info "You may want to replace it with the full config from deploy/nginx.conf"
else
    warn "Certbot did not modify the Nginx config."
    info "Please manually update the Nginx config with the certificate paths:"
    info "  ssl_certificate     $CERT_PATH;"
    info "  ssl_certificate_key $KEY_PATH;"
fi

# 测试并重载 Nginx
if nginx -t 2>&1; then
    systemctl reload nginx
    ok "Nginx reloaded with SSL configuration"
else
    error "Nginx configuration test failed. Fix the config and run: systemctl reload nginx"
fi

# -------------------- 配置自动续期 --------------------
info "Setting up automatic certificate renewal..."

# Certbot 安装时通常会自动创建 systemd timer 或 cron job
# 检查是否已配置

RENEWAL_CONFIGURED=false

# 检查 systemd timer
if systemctl list-timers | grep -q certbot 2>/dev/null; then
    ok "Certbot systemd timer is already configured"
    RENEWAL_CONFIGURED=true
fi

# 检查 cron job
if crontab -l 2>/dev/null | grep -q certbot; then
    ok "Certbot cron job is already configured"
    RENEWAL_CONFIGURED=true
fi

# 检查 /etc/cron.d/certbot
if [[ -f /etc/cron.d/certbot ]]; then
    ok "Certbot cron file exists at /etc/cron.d/certbot"
    RENEWAL_CONFIGURED=true
fi

# 如果都没有，手动创建 cron job
if [[ "$RENEWAL_CONFIGURED" == false ]]; then
    info "No automatic renewal found. Creating cron job..."

    # 每天凌晨 3:30 尝试续期，续期成功后重载 Nginx
    cat > /etc/cron.d/certbot-renew <<CRON
# Certbot auto-renewal for CS Notes
# Runs daily at 3:30 AM. Certbot will only actually renew when the certificate
# is within 30 days of expiration.
30 3 * * * root certbot renew --quiet --deploy-hook "systemctl reload nginx" >> /var/log/certbot-renew.log 2>&1
CRON

    chmod 644 /etc/cron.d/certbot-renew
    ok "Cron job created: /etc/cron.d/certbot-renew"
fi

# -------------------- 测试续期 --------------------
info "Testing certificate renewal (dry run)..."
if certbot renew --dry-run 2>&1; then
    ok "Renewal dry run successful! Automatic renewal is properly configured."
else
    warn "Renewal dry run failed. Check the output above for issues."
fi

# -------------------- 完成 --------------------
echo ""
echo "========================================="
ok "SSL setup completed!"
echo "========================================="
echo ""
echo "  Domain:         $DOMAIN"
echo "  Certificate:    $CERT_PATH"
echo "  Private Key:    $KEY_PATH"
echo "  Auto-renewal:   Configured"
echo ""
echo "  Next steps:"
echo "  1. Replace the temporary Nginx config with the full security-hardened version:"
echo "     cp deploy/nginx.conf $NGINX_SITE_CONF"
echo "     # Then update server_name and paths in the config"
echo ""
echo "  2. Verify HTTPS is working:"
echo "     curl -I https://$DOMAIN"
echo ""
echo "  3. Test SSL rating:"
echo "     https://www.ssllabs.com/ssltest/analyze.html?d=$DOMAIN"
echo ""
echo "  4. Certificates auto-renew. To manually renew:"
echo "     sudo certbot renew"
echo "     sudo systemctl reload nginx"
echo ""
