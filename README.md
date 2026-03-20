# 📚 全栈学习笔记

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Markdown](https://img.shields.io/badge/markdown-%E2%9C%93-blue.svg)](.markdownlint.json)
[![Obsidian](https://img.shields.io/badge/Obsidian-Compatible-purple.svg)](https://obsidian.md)
[![Jekyll](https://img.shields.io/badge/Jekyll-Just%20the%20Docs-green.svg)](https://just-the-docs.github.io/just-the-docs/)

> 一个系统化的计算机科学与全栈开发知识库，支持 Obsidian 查看和 GitHub Pages 在线浏览

## 📝 简介

本仓库收录了计算机科学基础、前端开发、后端开发、人工智能等领域的学习笔记。内容来源于优质学习资源，经过系统化整理，适合作为全栈开发学习参考。

**特点：**

- 📖 系统化知识分类，由浅入深
- 🔗 基于 Obsidian 的双向链接，知识点互联
- 🌐 GitHub Pages 在线浏览，无需本地安装
- 💻 丰富的代码示例与实践案例
- ✅ 遵循 Markdown 规范，统一格式

## 📁 目录结构

```text
cs_notes/
├── 01 计算机基础/          # 计算机科学核心基础
│   ├── 数据结构.md
│   ├── 计算机网络.md
│   └── 操作系统.md
├── 02 后端/                # 后端开发技术栈
│   ├── spring/             # Spring 生态
│   ├── SSM/                # Spring + SpringMVC + MyBatis
│   ├── 中间件/             # Redis、MQ、ES 等
│   └── 项目实战/           # 实际项目经验总结
├── 03 前端/                # 前端开发技术栈
├── 04 通用/                # 工具、方法论、软技能
├── 05 读书笔记/            # 技术书籍阅读笔记
├── 06 AI/                  # 人工智能与机器学习
├── copilot/                # Copilot 自定义 Prompts
└── 系统架构师/             # 架构设计相关内容
```

## 🚀 使用方式

### 推荐：Obsidian 查看

1. 克隆仓库到本地

   ```bash
   git clone https://github.com/dukechase/cs_notes.git
   ```

2. 使用 [Obsidian](https://obsidian.md) 打开仓库文件夹

3. 享受完整的双向链接、图谱视图等功能

### 在线浏览：GitHub Pages

本仓库已部署到 GitHub Pages，可直接在线浏览：

👉 **[https://dukechase.github.io/cs_notes/](https://dukechase.github.io/cs_notes/)**

### 本地 Jekyll 预览（推荐使用 Devcontainer）

如果想在本地预览 GitHub Pages 效果：

#### 方法一：VS Code Devcontainer（推荐）

1. 确保已安装 [Docker](https://www.docker.com/) 和 [VS Code](https://code.visualstudio.com/)
2. 在 VS Code 中安装 "Dev Containers" 扩展
3. 克隆仓库并用 VS Code 打开
4. 当提示 "Reopen in Container" 时点击确认，或通过命令面板运行 "Dev Containers: Reopen in Container"
5. 容器启动后会自动安装依赖，然后运行：
   ```bash
   bundle exec jekyll serve --host 0.0.0.0 --livereload
   ```
6. 访问 http://localhost:4000/cs_notes/

#### 方法二：本地 Ruby 环境

```bash
# 安装依赖
bundle install

# 启动本地服务器
bundle exec jekyll serve --livereload

# 访问 http://localhost:4000/cs_notes/
```

### 其他方式

- **VS Code**: 配合 Markdown 插件阅读
- **Typora**: 优秀的 Markdown 编辑器
- **GitHub**: 直接在线浏览

## 📋 内容概览

### 计算机基础

- 数据结构与算法核心概念
- 计算机网络协议详解
- 操作系统原理

### 后端开发

- Spring Boot/Spring Cloud 微服务架构
- SSM 框架整合与最佳实践
- 分布式中间件（Redis、Kafka、Elasticsearch）
- 项目实战经验总结

### 前端开发

- 现代前端技术栈
- 框架与工具链

### 人工智能

- 机器学习基础
- 深度学习应用
- AI 工程化实践

## 🤝 贡献指南

欢迎提交 Issue 或 PR 参与贡献：

1. Fork 本仓库
2. 创建功能分支：`git checkout -b feat/xxx`
3. 提交更改：`git commit -m "docs: add notes on xxx"`
4. 推送分支：`git push origin feat/xxx`
5. 提交 Pull Request

### 提交规范

- `docs:` 新增或更新文档
- `fix:` 修正错误内容
- `refactor:` 重构笔记结构

## 🛠️ 开发工具

- [Obsidian](https://obsidian.md) - 知识管理工具
- [Jekyll](https://jekyllrb.com/) - 静态站点生成器
- [Just the Docs](https://just-the-docs.github.io/just-the-docs/) - Jekyll 主题
- [markdownlint](https://github.com/DavidAnson/markdownlint) - Markdown 格式检查
- [VS Code Devcontainer](https://code.visualstudio.com/docs/devcontainers/containers) - 开发环境容器化

## 📄 许可证

本项目采用 [MIT License](LICENSE) 开源许可。

## 🙏 致谢

- 感谢所有优质的学习资源与教程作者
- 感谢开源社区的知识分享

---

> 💡 **提示**: 本仓库持续更新中，建议 Watch 获取最新动态
