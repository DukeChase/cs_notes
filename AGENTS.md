# Agent Guidelines for cs_notes

This is an **Obsidian knowledge base** containing computer science study notes in Chinese. This repository contains documentation only - no build system or test suite.

## Repository Structure

```
.
├── 01 计算机基础/          # Computer Science Fundamentals
│   ├── 数据结构.md
│   ├── 计算机网络.md
│   └── 操作系统.md
├── 02 后端/                # Backend Development
│   ├── spring/
│   ├── SSM/
│   ├── 中间件/
│   └── 项目实战/
├── 03 前端/                # Frontend Development
├── 04 通用/                # General Tools & Concepts
├── 05 读书笔记/            # Book Notes
├── 06 AI/                  # Artificial Intelligence
├── copilot/                # Copilot custom prompts
│   └── copilot-custom-prompts/
├── .obsidian/              # Obsidian config (gitignored)
└── .markdownlint.json      # Markdown linting rules
```

## Lint Commands

### Markdown Linting

```bash
# Lint all markdown files
markdownlint **/*.md

# Lint specific file
markdownlint "path/to/file.md"

# Fix auto-fixable issues
markdownlint --fix **/*.md
```

### Configuration

Lint rules are defined in `.markdownlint.json`:
- `MD013: false` - No line length limit (disabled for Chinese content)
- `MD025: false` - Allow multiple top-level headings (for note organization)

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
4. **Links**: Use `[text](url)` format
5. **Images**: Use `![alt](path)` format

### File Organization

1. **Naming**: Use Chinese names with `.md` extension
2. **Location**: Place files in appropriate category folder
3. **Tags**: Use Obsidian tags for cross-referencing: `#tagname`
4. **Links**: Use Obsidian wiki-links for internal references: `[[filename]]`

### Content Guidelines

1. **Language**: Primary language is Chinese (中文)
2. **Structure**: Start with overview, then detailed sections
3. **Code examples**: Include practical, runnable examples
4. **References**: Link to official documentation when possible
5. **Updates**: Mark outdated content with `> **注意**: 内容已过时`

### Naming Conventions

- **Files**: `主题名称.md` (e.g., `spring boot2.md`)
- **Folders**: `NN 类别名称/` (e.g., `02 后端/`)
- **Images**: Store in `attachments/` subfolder if needed

### Error Handling in Code Examples

When including code examples:
1. Show error cases and how to handle them
2. Include comments explaining "why" not just "what"
3. Use realistic examples, not `foo`/`bar`

## Available Copilot Prompts

Custom prompts located in `copilot/copilot-custom-prompts/`:

- `Translate to Chinese.md` - Translate content to Chinese
- `Summarize.md` - Generate summaries
- `Generate table of contents.md` - Create TOC
- `Explain like I am 5.md` - Simplify explanations
- `Fix grammar and spelling.md` - Correct text
- `Clip Web Page.md` - Format web clippings
- And 10+ more...

## Git Workflow

```bash
# Add new notes
git add "02 后端/spring/新笔记.md"
git commit -m "docs: add notes on [topic]"

# Update existing notes
git commit -m "docs: update [topic] with [specific change]"
```

## Common Tasks

### Adding a New Note

1. Create file in appropriate folder: `02 后端/spring/新主题.md`
2. Add header: `# 新主题`
3. Run linter: `markdownlint "02 后端/spring/新主题.md"`
4. Commit with message: `docs: add notes on 新主题`

### Updating Existing Note

1. Edit file
2. Run linter to check
3. Commit with descriptive message

## Notes

- No package.json, Makefile, or build system present
- This is a pure documentation repository
- Optimized for Obsidian vault usage
- All markdown files should pass markdownlint checks
