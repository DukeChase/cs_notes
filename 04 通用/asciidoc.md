**AsciiDoc** 是一种轻量级标记语言，用于编写结构化文档，可以转换为多种格式（如HTML、PDF、EPUB等）。它比Markdown更强大，适合编写技术文档、书籍和论文。

---

### **主要特点**
1. **结构化丰富**：支持章节、表格、代码块、数学公式、注释等。
2. **转换灵活**：可通过工具（如Asciidoctor）转换为多种格式。
3. **语法简洁**：类似Markdown，但功能更全面。

---

### **基本用法示例**

#### 1. **标题**
```asciidoc
= 主标题
== 二级标题
=== 三级标题
```

#### 2. **段落与文本格式**
```asciidoc
普通段落，*粗体*，_斜体_，`等宽字体`。

[.underline]#带下划线的文本#。
```

#### 3. **列表**
```asciidoc
* 无序列表项
** 子项

1. 有序列表
2. 第二项
```

#### 4. **代码块**
````asciidoc
[source,java]
----
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello");
    }
}
----
````

#### 5. **表格**
```asciidoc
|===
|列1 |列2 |列3

|A1 |B1 |C1
|A2 |B2 |C2
|===
```

#### 6. **链接与图片**
```asciidoc
https://example.com[示例链接]

image::图片.png[替代文字]
```

#### 7. **数学公式（LaTeX）**
```asciidoc
[latexmath]
++++
E = mc^2
++++
```

---

### **常用工具链**
1. **Asciidoctor**（Ruby实现）：
   ```bash
   # 安装
   gem install asciidoctor

   # 转换为HTML
   asciidoctor document.adoc
   ```
2. **VS Code插件**：安装“AsciiDoc”插件实时预览。
3. **Maven/Gradle集成**：用于项目文档生成。

---

### **与Markdown对比**
| 特性       | AsciiDoc          | Markdown        |
|------------|-------------------|-----------------|
| 表格       | 原生支持          | 扩展语法        |
| 交叉引用   | 自动生成ID        | 需手动维护      |
| 导出PDF    | 原生支持（通过PDF工具链） | 需第三方工具    |
| 扩展性     | 高（支持自定义宏） | 有限            |

---

### **典型工作流**
1. 用AsciiDoc编写文档（`.adoc`后缀）。
2. 使用Asciidoctor转换为目标格式：
   ```bash
   asciidoctor -b html5 document.adoc       # 生成HTML
   asciidoctor-pdf document.adoc            # 生成PDF
   ```
3. 可集成到CI/CD中自动生成文档。

---

### **适用场景**
- API文档（如Spring Boot、Micronaut官方文档）
- 技术书籍（如《Spark快速大数据分析》）
- 项目文档（替代部分Word/LaTeX场景）

---

### **学习建议**
1. 从[AsciiDoc语法指南](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/)开始。
2. 用VS Code插件边写边预览。
3. 尝试为现有项目编写AsciiDoc文档。

如果需要进一步实践，我可以提供完整的示例文档模板！