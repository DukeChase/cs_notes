# Python 虚拟环境

## venv（Python 内置）

```bash
python -m venv .venv          # 创建虚拟环境
source .venv/bin/activate     # 激活（Linux/macOS）
.venv\Scripts\activate        # 激活（Windows）
deactivate                    # 退出虚拟环境
```

## 虚拟环境的作用

- 隔离项目依赖
- 避免版本冲突
- 便于项目迁移
