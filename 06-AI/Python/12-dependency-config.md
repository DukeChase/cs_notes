# Python 依赖管理配置文件

## requirements.txt

### 格式

```text
requests==2.28.0
flask>=2.0.0
numpy>=1.20,<2.0
pandas  # 不指定版本
```

### 版本说明符

| 符号 | 含义 |
|------|------|
| `==` | 精确版本 |
| `>=` | 大于等于 |
| `<=` | 小于等于 |
| `>` | 大于 |
| `<` | 小于 |
| `~=` | 兼容版本（如 `~=1.4.2` 等价于 `>=1.4.2,<1.5.0`） |

---

## pyproject.toml

现代 Python 项目的配置文件（PEP 517/518）：

```toml
[project]
name = "myproject"
version = "0.1.0"
dependencies = [
    "requests>=2.28.0",
]

[project.optional-dependencies]
dev = [
    "pytest>=7.0.0",
    "black>=22.0.0",
]

[build-system]
requires = ["setuptools>=45"]
build-backend = "setuptools.build_meta"
```
