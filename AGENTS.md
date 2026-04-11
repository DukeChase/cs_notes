# Agent Guidelines for cs_notes

This is an **Obsidian knowledge base** containing computer science study notes in Chinese. 
This repository supports both Obsidian viewing and GitHub Pages publishing via Quartz 4.0.

## Repository Structure

```
.
├── 01-计算机基础/            # Computer Science Fundamentals
│   ├── 数据结构.md
│   ├── 计算机网络.md
│   └── 操作系统.md
├── 02-后端/                  # Backend Development
│   ├── 01-Java/              # Java fundamentals
│   ├── 02-数据库/             # Databases
│   ├── 03-Web-服务器/         # Web servers & frameworks
│   ├── 04-云原生/             # Cloud native & build tools
│   ├── 05-其他/               # Other backend topics
│   ├── 06-中间件/             # Middleware
│   ├── 07-项目实战/           # Project experiences
│   ├── 08-spring/            # Spring ecosystem
│   └── 09-SSM/               # SSM integration
├── 03-前端/                  # Frontend Development
├── 04-通用/                  # General Tools & Concepts
├── 05-读书笔记/              # Book Notes
├── 06-AI/                    # Artificial Intelligence
├── 系统架构师/                # System Architecture
├── .obsidian/                # Obsidian config (gitignored)
├── quartz/                   # Quartz 4.0 core components
├── quartz.config.ts          # Quartz configuration
├── quartz.layout.ts          # Layout configuration
├── package.json              # Node.js dependencies
├── index.md                  # Homepage
└── .markdownlint.json        # Markdown linting rules
```

## Development Environment

### Local Quartz Development

1. Install Node.js 22+ (required by Quartz 4.0)
2. Install dependencies:
   ```bash
   nvm use 22 && npm install
   ```
3. Build the site:
   ```bash
   npm run build
   ```
4. Preview locally at http://localhost:8080:
   ```bash
   npm run preview
   ```

### Quartz Configuration

- **Config file**: `quartz.config.ts`
- **Layout file**: `quartz.layout.ts`
- **Content directory**: Root folder (`.`)
- **Output directory**: `public/`
- **Base URL**: `/cs_notes/` (for GitHub Pages)

### Key Features Enabled

- **Graph view**: Visual representation of note connections
- **Backlinks**: Automatic backlink detection
- **Wiki-links**: Native `[[filename]]` support
- **Search**: Full-text search
- **Explorer**: File tree navigation
- **Dark mode**: Theme toggle

## Code Style Guidelines

### Markdown Formatting

1. **Headers**: Use `#` for title, `##` for sections, `###` for subsections
2. **Lists**: Use `-` for unordered lists, `1.` for ordered lists
3. **Code blocks**: Use triple backticks with language identifier

   ```markdown
   ```java
   public class Example {
       // code here
   }
   ```
   ```

4. **Links**: Use Obsidian wiki-links for internal references: `[[filename]]`
5. **External links**: Use `[text](url)` format

### File Organization

1. **Naming**: Use Chinese names with `.md` extension
2. **Location**: Place files in appropriate category folder
3. **Tags**: Use Obsidian tags for cross-referencing: `#tagname`
4. **Links**: Use Obsidian wiki-links for internal references: `[[filename]]`

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

### Content Guidelines

1. **Language**: Primary language is Chinese (中文)
2. **Structure**: Start with overview, then detailed sections
3. **Code examples**: Include practical, runnable examples
4. **References**: Link to official documentation when possible
5. **Updates**: Mark outdated content with `> **注意**: 内容已过时`

### Naming Conventions

- **Files**: Use hyphens for separation: `主题名称.md` (e.g., `spring-boot-2.md`, `java-se.md`)
- **Folders**: Use hyphens: `NN-类别名称/` (e.g., `02-后端/`, `01-Java/`)
- **Images**: Store in `attachments/` subfolder if needed

### Error Handling in Code Examples

When including code examples:

1. Show error cases and how to handle them
2. Include comments explaining "why" not just "what"
3. Use realistic examples, not `foo`/`bar`

## Git Workflow

```bash
# Add new notes
git add "02-后端/08-spring/新笔记.md"
git commit -m "docs: add notes on [topic]"

# Update existing notes
git commit -m "docs: update [topic] with [specific change]"
```

## Common Tasks

### Adding a New Note

1. Create file in appropriate folder: `02-后端/08-spring/新主题.md`
2. Add front matter and content
3. Run linter: `markdownlint "02-后端/08-spring/新主题.md"`
4. Commit with message: `docs: add notes on 新主题`

### Updating Existing Note

1. Edit file
2. Run linter to check
3. Commit with descriptive message

### Building and Deploying

```bash
# Build for production
npm run build

# Preview locally
npm run preview

# Deploy: push to master branch, GitHub Actions will auto-deploy
git push origin master
```

## Notes

- Quartz 4.0 for GitHub Pages publishing
- Optimized for Obsidian vault usage
- All markdown files should pass markdownlint checks
- Wiki-links are automatically resolved by Quartz

## Quartz Publishing Notes

### Front Matter

For proper rendering, markdown files can include:

```yaml
---
title: 页面标题
date: 2024-01-01
tags: [tag1, tag2]
---
```

### Ignored Files

The following are excluded from Quartz build (see `quartz.config.ts`):
- `.obsidian/` - Obsidian config
- `.github/` - GitHub workflows
- `node_modules/` - NPM packages
- `quartz/` - Quartz core
- `copilot/` - Custom prompts
- `prompt/` - Prompt templates
- `*.json`, `*.ts`, `*.js` - Config files

### Navigation Structure

Navigation is provided by the Explorer component, which displays a file tree sorted alphabetically with Chinese locale support.