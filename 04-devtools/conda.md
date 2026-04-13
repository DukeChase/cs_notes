这是一份为您整理的 **Conda 命令行使用指南**。Conda 是一个强大的开源包管理和环境管理系统，广泛应用于数据科学、机器学习和 Python 开发中。

本指南涵盖了从基础安装到高级环境管理的常用命令，助您高效管理项目依赖。

---

### 🚀 一、基础信息与帮助

在开始之前，了解当前 Conda 的状态和获取帮助是最重要的一步。

|命令|说明|
|:--|:--|
|`conda --version`|查看 Conda 版本|
|`conda info`|查看 Conda 详细信息（版本、平台、环境路径、源列表等）|
|`conda info -e`  <br>或 `conda env list`|**列出所有虚拟环境**（`*` 号标记当前激活的环境）|
|`conda COMMAND --help`|查看具体命令的帮助文档（例如：`conda install --help`）|
|`conda config --show`|查看当前的 Conda 配置信息|

---

### 📦 二、环境管理 (Environment Management)

Conda 的核心优势在于隔离环境。建议为每个项目创建独立的环境。

#### 1. 创建环境

```bash
# 创建一个名为 myenv 的新环境，指定 Python 版本为 3.9
conda create --name myenv python=3.9

# 创建环境并直接安装一些包
conda create --name myenv python=3.10 numpy pandas matplotlib

# 从 YAML 文件创建环境（推荐用于复现项目）
conda env create -f environment.yml
```

#### 2. 激活与退出

```bash
# 激活环境 (Windows/macOS/Linux 通用，旧版 Windows 可能需要 conda activate)
conda activate myenv

# 退出当前环境，返回 base 环境
conda deactivate
```

#### 3. 复制、导出与删除

```bash
# 克隆（复制）一个环境
conda create --name myenv_clone --clone myenv

# 导出当前环境配置到 YAML 文件 (包含具体版本号，适合精确复现)
conda env export > environment.yml

# 导出仅包含用户手动安装的包 (适合跨平台分享)
conda env export --from-history > environment.yml

# 删除环境 (先退出该环境才能删除)
conda remove --name myenv --all
```

---

### 🛠️ 三、包管理 (Package Management)

在激活的环境中安装包。

#### 1. 安装与更新

```bash
# 安装包 (自动解决依赖)
conda install package_name

# 安装指定版本的包
conda install package_name=1.2.3

# 同时安装多个包
conda install numpy pandas scipy

# 从特定频道 (channel) 安装 (如 conda-forge)
conda install -c conda-forge package_name

# 更新某个包到最新版本
conda update package_name

# 更新 Conda 本身
conda update -n base -c defaults conda
```

#### 2. 搜索与查看

```bash
# 搜索包
conda search package_name

# 查看已安装的包
conda list

# 查看某个包的详细信息
conda info package_name
```

#### 3. 卸载与清理

```bash
# 卸载包
conda remove package_name

# 清理未使用的包和缓存 (释放磁盘空间，强烈建议定期运行)
conda clean --all
```

---

### ⚙️ 四、配置优化 (Configuration)

国内用户通常建议配置清华或中科大镜像源以加速下载。

#### 1. 配置镜像源 (以清华源为例)

```bash
# 添加清华源
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/

# 显示源地址
conda config --show channels
```

#### 2. 其他配置

```bash
# 设置创建环境时默认不询问确认 (y/n)
conda config --set always_yes true

# 恢复默认配置
conda config --remove-key channels
```

---

### 💡 五、进阶技巧与最佳实践

1. **`environment.yml` 的重要性**： 在团队协作或部署项目时，不要发送 `requirements.txt` (pip 格式)，尽量使用 `conda env export > environment.yml`。这能确保操作系统级别的依赖（如 CUDA 工具包、C++ 库）也被记录。
    
2. **Base 环境保持纯净**： 尽量避免在 `base` 环境中安装过多的项目特定包。保持 `base` 干净，仅在需要时创建新环境，可以减少冲突。
    
3. **Conda 与 Pip 混用**：
    
    - 优先使用 `conda install` 安装包，因为 Conda 处理二进制依赖（如 NumPy, SciPy, TensorFlow）更稳定。
    - 如果 Conda 渠道没有某个包，再使用 `pip install`。
    - **顺序建议**：先创建环境 -> `conda install` 主要科学包 -> `pip install` 剩余包。
4. **常见问题排查**：
    
    - **命令找不到**：如果终端提示 `conda: command not found`，可能需要初始化 shell：`conda init bash` (或 `zsh`, `powershell`)，然后重启终端。
    - **环境冲突**：如果安装报错 `UnsatisfiableError`，尝试创建一个全新的空白环境，或者使用 `conda install --strict-channel-priority`。

---

### 📝 速查备忘单 (Cheat Sheet)

|操作|命令简写|
|:--|:--|
|**看环境**|`conda env list`|
|**建环境**|`conda create -n <name> python=<ver>`|
|**进环境**|`conda activate <name>`|
|**出环境**|`conda deactivate`|
|**安装包**|`conda install <pkg>`|
|**删环境**|`conda env remove -n <name>`|
|**清缓存**|`conda clean -a`|

希望这份指南能帮助您更好地使用 Conda！如果有具体的报错或场景需要解决，欢迎继续提问。