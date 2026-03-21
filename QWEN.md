# QWEN.md - Project Context for cs_notes

## Project Overview

This is an **Obsidian knowledge base** containing computer science study notes in Chinese. It is built with **Quartz 4.0** for static site generation and GitHub Pages publishing. The repository serves as a comprehensive learning resource covering computer science fundamentals, full-stack development, and artificial intelligence.

**Primary Language:** Chinese (中文)

**Key Technologies:**

- **Obsidian** - Knowledge management with bidirectional linking
- **Quartz 4.0** - Static site generator for GitHub Pages
- **Node.js 22+** - Runtime environment
- **Markdown** - Content format with linting

**Key Features:**

- Systematic knowledge categorization from fundamentals to advanced topics
- Obsidian-compatible with wiki-links (`[[filename]]`) and tags (`#tagname`)
- GitHub Pages deployment via GitHub Actions
- Rich code examples and practical case studies
- Graph view, backlinks, search, and file tree navigation
- Markdown linting for consistent formatting

## Directory Structure

```
cs_notes/
├── 01-计算机基础/              # Computer Science Fundamentals
│   ├── 数据结构.md             # Data Structures
│   ├── 计算机网络.md           # Computer Networks
│   └── 操作系统.md             # Operating Systems
├── 02-后端/                    # Backend Development
│   ├── 01-Java/                # Java fundamentals (SE, Web, Concurrency, JDK)
│   ├── 02-数据库/               # Databases (MySQL, ClickHouse, MyBatis-Plus)
│   ├── 03-Web-服务器/           # Web servers & frameworks (Spring WebFlux, OAuth2, Tomcat)
│   ├── 04-云原生/               # Cloud native & build tools (Maven, Cloud concepts)
│   ├── 05-其他/                 # Other backend topics
│   ├── 06-中间件/               # Middleware (Redis, MinIO)
│   ├── 07-项目实战/             # Real-world project experiences
│   ├── 08-spring/              # Spring ecosystem (Spring 5, MVC, Boot, Cloud)
│   └── 09-SSM/                 # Spring + SpringMVC + MyBatis integration
├── 03-前端/                    # Frontend Development
│   ├── HTML, CSS, JavaScript notes
│   ├── Vue2, Vue3 frameworks
│   └── NPM, JSON utilities
├── 04-通用/                    # General Tools & Methodologies
├── 05-读书笔记/                # Technical Book Reading Notes
├── 06-AI/                      # Artificial Intelligence
│   ├── Agent/                  # AI Agents
│   ├── LLM/                    # Large Language Models
│   ├── LVLM/                   # Large Vision-Language Models
│   ├── Pytorch/                # Deep Learning Framework
│   ├── 机器学习/                # Machine Learning
│   └── 深度学习/                # Deep Learning
├── 系统架构师/                  # System Architecture Design
├── copilot/                    # VS Code Copilot Custom Prompts
│   └── copilot-custom-prompts/
├── Clippings/                  # Web clippings and saved articles
├── prompt/                     # AI prompt templates
├── todo.md                     # Pending topics and reference links
└── readlist.md                 # Reading list
```

## Key Files

| File | Purpose |
|------|---------|
| `README.md` | Project introduction and usage guide |
| `AGENTS.md` | Agent guidelines for AI assistants |
| `QWEN.md` | This file - project context |
| `index.md` | Homepage content for Quartz site |
| `todo.md` | Pending topics to study and reference links |
| `quartz.config.ts` | Quartz 4.0 configuration |
| `quartz.layout.ts` | Page layout configuration |
| `package.json` | Node.js dependencies and scripts |
| `.markdownlint.json` | Markdown linting configuration |
| `.github/workflows/deploy.yml` | GitHub Actions deployment workflow |

## Development Environment

### Prerequisites

- **Node.js 22+** (required by Quartz 4.0)
- **npm 10.9.2+**

### Installation

```bash
# Install dependencies
npm install
```

### Building and Running

```bash
# Build the site
npm run build

# Preview locally at http://localhost:8080
npm run preview

# Type check
npm run check

# Run Quartz CLI directly
npm run quartz [command]
```

### Deployment

The site auto-deploys to GitHub Pages on push to `master` branch via GitHub Actions.

**Production URL:** https://dukechase.github.io/cs_notes/

## Quartz Configuration

### Configuration Files

- **`quartz.config.ts`** - Main configuration including:
  - Site title: "CS Notes"
  - Base URL: `/cs_notes/`
  - Locale: `zh-CN`
  - Theme colors (light/dark modes)
  - Plugin configuration
  - Ignore patterns for build

- **`quartz.layout.ts`** - Page layout including:
  - Shared components (header, footer)
  - Content page layout (breadcrumbs, TOC, backlinks, graph view)
  - List page layout
  - Explorer navigation with Chinese locale support

### Enabled Features

- **Graph view** - Visual representation of note connections
- **Backlinks** - Automatic backlink detection
- **Wiki-links** - Native `[[filename]]` support
- **Search** - Full-text search functionality
- **Explorer** - File tree navigation
- **Dark mode** - Theme toggle
- **Table of Contents** - Auto-generated per page
- **Syntax highlighting** - GitHub light/dark themes
- **LaTeX support** - KaTeX rendering
- **RSS feed & Sitemap** - Auto-generated

### Ignored Files (Build)

The following are excluded from Quartz build:

- `.obsidian/` - Obsidian config
- `.github/` - GitHub workflows
- `node_modules/` - NPM packages
- `quartz/` - Quartz core components
- `copilot/` - Custom prompts
- `prompt/` - Prompt templates
- `Clippings/` - Web clippings
- `*.json`, `*.ts`, `*.js`, `*.mjs` - Config files
- `*.svg`, `LICENSE*`, `Dockerfile`

## Markdown Linting

This project uses `markdownlint` for consistent formatting.

**Configuration (`.markdownlint.json`):**

```json
{
  "MD013": false,
  "MD025": false,
  "MD024": false
}
```

- `MD013: false` - No line length limit (disabled for Chinese content)
- `MD025: false` - Allow multiple top-level headings
- `MD024: false` - Allow duplicate headings

**Commands:**

```bash
# Lint all markdown files
markdownlint **/*.md

# Lint specific file
markdownlint "path/to/file.md"

# Fix auto-fixable issues
markdownlint --fix **/*.md
```

## Content Conventions

### File Naming

- **Use hyphens for separation** (preferred): `主题名称.md` (e.g., `spring-boot-2.md`, `java-se.md`)
- **Avoid spaces in filenames**: Use `-` instead of spaces for better CLI compatibility
- **Folder naming**: `NN-类别名称/` (e.g., `02-后端/`, `01-Java/`)
- **File naming**: `NN-描述性名称.md` (e.g., `01-java-se.md`, `02-spring-mvc.md`)
- **Images**: Store in `attachments/` subfolder if needed

### Markdown Formatting

- **Headers:** `#` for title, `##` for sections, `###` for subsections
- **Lists:** `-` for unordered, `1.` for ordered
- **Code blocks:** Use triple backticks with language identifier
- **Internal links:** Use Obsidian wiki-links `[[filename]]`
- **Tags:** Use `#tagname` for cross-referencing

### Front Matter

Quartz supports the following front matter fields:

```yaml
---
title: 页面标题
date: 2024-01-01
tags:
  - tag1
  - tag2
aliases:
  - 别名
draft: false
---
```

### Content Structure

1. Start with overview/introduction
2. Follow with detailed sections
3. Include practical, runnable code examples
4. Link to official documentation when possible
5. Mark outdated content with: `> **注意**: 内容已过时`

## Git Workflow

### Commit Message Convention

- `docs:` - Adding or updating documentation
- `fix:` - Correcting errors
- `refactor:` - Restructuring notes

### Example Workflow

```bash
# Add new note
git add "02-后端/spring/新主题.md"
git commit -m "docs: add notes on 新主题"

# Update existing note
git add -u
git commit -m "docs: update Spring Boot with DevTools section"

# Push to trigger deployment
git push origin master
```

## Available Copilot Prompts

Custom prompts in `copilot/copilot-custom-prompts/`:

- `Translate to Chinese.md` - Translate content to Chinese
- `Summarize.md` - Generate summaries
- `Generate table of contents.md` - Create TOC
- `Explain like I am 5.md` - Simplify explanations
- `Fix grammar and spelling.md` - Correct text
- `Clip Web Page.md` - Format web clippings
- `Simplify.md`, `Make longer.md`, `Make shorter.md` - Content adjustment

## Common Tasks

### Adding a New Note

1. Create file in appropriate category folder
2. Add front matter and content with wiki-links
3. Run linter: `markdownlint "path/to/file.md"`
4. Commit: `git commit -m "docs: add notes on [topic]"`

### Updating Existing Note

1. Edit the file
2. Run linter to verify formatting
3. Commit with descriptive message

### Building for Production

```bash
# Clean build
npm run build

# Preview before deploy
npm run preview

# Deploy
git push origin master
```

## Notes

- This is a **pure documentation repository** with no backend code
- Optimized for Obsidian vault usage with Quartz publishing
- All markdown files should pass markdownlint checks
- Wiki-links are automatically resolved by Quartz
- Content is primarily in Chinese for learning purposes
- Repository is continuously updated with new topics
