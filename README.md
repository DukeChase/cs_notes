# 📚 全栈学习笔记

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Markdown](https://img.shields.io/badge/markdown-%E2%9C%93-blue.svg)](.markdownlint.json)
[![Obsidian](https://img.shields.io/badge/Obsidian-Compatible-purple.svg)](https://obsidian.md)
[![Quartz](https://img.shields.io/badge/Quartz-4.0-green.svg)](https://quartz.jzhao.xyz/)

> 一个系统化的计算机科学与全栈开发知识库，支持 Obsidian 查看和 GitHub Pages 在线浏览

## 📝 简介

本仓库收录了计算机科学基础、前端开发、后端开发、人工智能等领域的学习笔记。内容来源于优质学习资源，经过系统化整理，适合作为全栈开发学习参考。

**特点：**

- 📖 系统化知识分类，由浅入深
- 🔗 基于 Obsidian 的双向链接，知识点互联
- 🌐 GitHub Pages 在线浏览，无需本地安装
- 📊 Quartz 4.0 驱动，支持图谱视图、反向链接
- 💻 丰富的代码示例与实践案例
- ✅ 遵循 Markdown 规范，统一格式

## 📁 目录结构

```text
cs_notes/
├── 01-计算机基础/          # 计算机科学核心基础
│   ├── 数据结构.md
│   ├── 计算机网络.md
│   └── 操作系统.md
├── 02-后端/                # 后端开发技术栈
│   ├── 01-Java/            # Java 基础
│   ├── 02-数据库/           # 数据库
│   ├── 06-中间件/           # Redis、MQ、ES 等
│   └── 08-spring/          # Spring 生态
├── 03-前端/                # 前端开发技术栈
├── 04-通用/                # 工具、方法论、软技能
├── 05-读书笔记/            # 技术书籍阅读笔记
├── 06-AI/                  # 人工智能与机器学习
├── 系统架构师/              # 架构设计相关内容
└── quartz/                 # Quartz 4.0 核心组件
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

### 本地 Quartz 预览

如果想在本地预览网站效果：

```bash
# 安装依赖 (需要 Node.js 22+)
npm install

# 构建网站
npm run build

# 本地预览 (http://localhost:8080)
npm run preview
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
- [Quartz 4.0](https://quartz.jzhao.xyz/) - 静态站点生成器
- [Node.js](https://nodejs.org/) - JavaScript 运行时
- [markdownlint](https://github.com/DavidAnson/markdownlint) - Markdown 格式检查

## 📄 许可证

本项目采用 [MIT License](LICENSE) 开源许可。

## 🙏 致谢

- 感谢所有优质的学习资源与教程作者
- 感谢开源社区的知识分享
- 感谢 [Quartz](https://quartz.jzhao.xyz/) 提供优秀的静态站点生成器

---

> 💡 **提示**: 本仓库持续更新中，建议 Watch 获取最新动态