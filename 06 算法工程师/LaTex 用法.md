# LaTeX 中求和符号的上下标写法

## 基本语法

在 LaTeX 中，求和符号 `\sum`的上下标可以通过以下方式书写：

```latex
% 行内公式 - 上下标在右侧
$\sum_{i=1}^{n} a_i$

% 显示公式 - 上下标在上方和下方
\[
\sum_{i=1}^{n} a_i
\]

% 强制行内公式上下标在上方和下方
$\sum\limits_{i=1}^{n} a_i$

% 强制显示公式上下标在右侧
\[
\sum\nolimits_{i=1}^{n} a_i
\]
```

## 示例和效果

| 类型           | LaTeX 代码                          | 渲染效果      |
| ------------ | --------------------------------- | --------- |
| 行内默认         | `$\sum_{i=1}^{n} a_i$`            | ∑i=1n​ai​ |
| 显示默认         | `\[\sum_{i=1}^{n} a_i\]`          | ∑i=1n​ai​ |
| 行内带 limits   | `$\sum\limits_{i=1}^{n} a_i$`     | i=1∑n​ai​ |
| 显示带 nolimits | `\[\sum\nolimits_{i=1}^{n} a_i\]` | ∑i=1n​ai​ |

## 多行上下标

当下标或上标内容较多时，可以使用 `\substack`或 `\begin{subarray}`：

```latex
% 使用 substack
\[
\sum_{\substack{1 \le i \le n \\ i \text{ 是偶数}}} a_i
\]

% 使用 subarray 环境
\[
\sum_{\begin{subarray}{c} 
    1 \le i \le n \\ 
    i \text{ 是偶数}
    \end{subarray}} a_i
\]

% 多行上标同理
\[
\sum_{i=1}^{n} a_i^{\substack{\text{上标1} \\ \text{上标2}}}
\]
```

渲染效果：

1≤i≤ni 是偶数​∑​ai​

## 多重求和

对于多重求和，可以嵌套使用：

```latex
% 双重求和
\[
\sum_{i=1}^{m} \sum_{j=1}^{n} a_{ij}
\]

% 三重求和
\[
\sum_{i=1}^{m} \sum_{j=1}^{n} \sum_{k=1}^{p} a_{ijk}
\]

% 紧凑写法
\[
\sum_{i,j,k} a_{ijk} \quad \text{或} \quad \sum_{i,j,k=1}^{n} a_{ijk}
\]
```

## 复杂上下标示例

```latex
% 上下标包含表达式
\[
\sum_{i=0, i\neq k}^{n} f(i) 
\quad \text{或} \quad 
\sum_{\substack{i=0 \\ i\neq k}}^{n} f(i)
\]

% 条件求和
\[
\sum_{x \in S, x > 0} f(x)
\]

% 带括号的上下标
\[
\sum_{\left( i,j \right) \in E} w_{ij}
\]
```

## 注意事项

1. **自动调整**：在显示环境（`\[ \]`, `equation`, `align`等）中，`\sum`默认上下标位于符号的正上方和正下方；在行内公式中，默认在右侧。
    
2. **强制位置**：
    
    - `\limits`：强制上下标在正上方/下方
        
    - `\nolimits`：强制上下标在右侧
        
    
3. **字体大小**：在行内公式中使用 `\limits`时，上下标可能显得过大，可以使用 `\scriptstyle`调整：
    
    ```
    $\sum\limits_{\scriptstyle i=1 \atop \scriptstyle i\neq k}^{n} a_i$
    ```
    
4. **间距调整**：使用 `\!`减小间距，`\,`增加间距：
    
    ```
    $\sum_{i=1}^{n} a_i$  % 默认
    $\sum_{\,i=1}^{\,n} a_i$  % 增加下标和上标的间距
    ```
    

## 完整示例

```latex
\documentclass{article}
\usepackage{amsmath}

\begin{document}

行内求和: $\sum_{i=1}^{n} x_i = 1 + 2 + \cdots + n$

显示模式求和:
\[
S_n = \sum_{i=1}^{n} a_i = a_1 + a_2 + \cdots + a_n
\]

多重求和:
\[
\sum_{i=1}^{m} \sum_{j=1}^{n} A_{ij} = \text{矩阵所有元素之和}
\]

多条件求和:
\[
\sum_{\substack{1 \le i \le n \\ 1 \le j \le m \\ i+j \text{ 是偶数}}} P(i,j)
\]

\end{document}
```

这些写法应该覆盖了大多数求和符号的使用场景。需要根据具体需求选择合适的形式。