# QWEN.md - Project Context for cs_notes

## Project Overview

This is an **Obsidian knowledge base** containing computer science study notes in Chinese. It is a pure documentation repository with no build system, test suite, or executable code. The repository is designed for knowledge management and learning reference using Obsidian's bidirectional linking capabilities.

**Primary Language:** Chinese (中文)

**Key Features:**
- Systematic knowledge categorization from fundamentals to advanced topics
- Obsidian-compatible with wiki-links (`[[filename]]`) and tags (`#tagname`)
- Rich code examples and practical case studies
- Markdown linting for consistent formatting

## Directory Structure

```
cs_notes/
├── 01 计算机基础/          # Computer Science Fundamentals
│   ├── 数据结构.md         # Data Structures
│   ├── 计算机网络.md       # Computer Networks
│   └── 操作系统.md         # Operating Systems
├── 02 后端/                # Backend Development
│   ├── spring/             # Spring ecosystem (Boot, Cloud, etc.)
│   ├── SSM/                 # Spring + SpringMVC + MyBatis
│   ├── 中间件/             # Middleware (Redis, MQ, Elasticsearch)
│   ├── 项目实战/           # Real-world project experiences
│   └── [Java/MySQL notes]  # Various Java and database notes
├── 03 前端/                # Frontend Development
│   ├── HTML, CSS, JavaScript notes
│   ├── Vue2, Vue3 frameworks
│   └── NPM, JSON utilities
├── 04 通用/                # General Tools & Methodologies
├── 05 读书笔记/            # Technical Book Reading Notes
├── 06 AI/                  # Artificial Intelligence
│   ├── Agent/              # AI Agents
│   ├── LLM/                # Large Language Models
│   ├── Pytorch/            # Deep Learning Framework
│   ├── 机器学习/           # Machine Learning
│   └── 深度学习/           # Deep Learning
├── 系统架构师/             # System Architecture Design
├── copilot/                # VS Code Copilot Custom Prompts
│   └── copilot-custom-prompts/
├── Clippings/              # Web clippings and saved articles
├── prompt/                 # AI prompt templates
├── todo.md                 # Pending topics and reference links
└── readlist.md             # Reading list
```

## Key Files

| File | Purpose |
|------|---------|
| `README.md` | Project introduction and usage guide |
| `AGENTS.md` | Agent guidelines (for AI assistants) |
| `todo.md` | Pending topics to study and reference links |
| `.markdownlint.json` | Markdown linting configuration |
| `obsidian-cli.skill` | Obsidian CLI integration |

## Markdown Linting

This project uses `markdownlint` for consistent formatting.

**Configuration (`.markdownlint.json`):**
- `MD013: false` - No line length limit (disabled for Chinese content)
- `MD025: false` - Allow multiple top-level headings

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
- Use Chinese names: `主题名称.md` (e.g., `spring boot2.md`)
- Folder naming: `NN 类别名称/` (e.g., `02 后端/`)
- Store images in `attachments/` subfolder if needed

### Markdown Formatting
- **Headers:** `#` for title, `##` for sections, `###` for subsections
- **Lists:** `-` for unordered, `1.` for ordered
- **Code blocks:** Use triple backticks with language identifier
- **Internal links:** Use Obsidian wiki-links `[[filename]]`
- **Tags:** Use `#tagname` for cross-referencing

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
git add "02 后端/spring/新主题.md"
git commit -m "docs: add notes on 新主题"

# Update existing note
git add -u
git commit -m "docs: update Spring Boot with DevTools section"
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
- And more...

## Common Tasks

### Adding a New Note
1. Create file in appropriate category folder
2. Add header: `# 主题名称`
3. Run linter: `markdownlint "path/to/file.md"`
4. Commit: `git commit -m "docs: add notes on [topic]"`

### Updating Existing Note
1. Edit the file
2. Run linter to verify formatting
3. Commit with descriptive message

## Notes

- No `package.json`, `Makefile`, or build system present
- This is a **pure documentation repository**
- Optimized for Obsidian vault usage
- All markdown files should pass markdownlint checks