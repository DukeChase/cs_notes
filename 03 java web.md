# HTML CSS

## HTML

```html
<!DOCTYPE html>
<html>
    <head>
        <titel></titel>
        <script> type="text/javascript" src="1.js"</script>
        <script type="text/javascript">
        var i=12;
        var j = 13
        alert(i+j)
        </script>
    </head>
    <body>
    <p>hello world</p>
    <div> ...</div>         
    </body>
</html>
```

标签介绍
1. 标签的格式:
	<标签名>封装的数据</标签名>
2. 标签名大小写不敏感。
3. 标签拥有自己的属性。
	i. 分为基本属性：`bgcolor="red" `            可以修改简单的样式效果  
	ii. 事件属性： `onclick="alert('你好！');" ` 可以直接设置事件响应后的代码。  
4. 标签又分为，单标签和双标签。
	i. 单标签格式： <标签名 />  
		br 换行  
		hr 水平线  
	ii. 双标签格式: <标签名> ...封装的数据...</标签名>  
### 常用标签
- 超链接
```html
<a href="http://localhost:8080">百度</a><br/>

<a href="http://localhost:8080" target="_self">百度_self</a><br/>

<a href="http://localhost:8080" target="_blank">百度_blank</a><br/>
```

- 列表标签
```html
<body>
<!--需求 1：使用无序，列表方式，把东北 F4，赵四，刘能，小沈阳，宋小宝，展示出来
ul 是无序列表
type 属性可以修改列表项前面的符号
li 是列表项
-->
	<ul type="none">
		<li>赵四</li>
		<li>刘能</li>
		<li>小沈阳</li>
		<li>宋小宝</li>
	</ul>

</body>
```
- img标签

- 表格标签
需求1：做一个 带表头的 ，三行，三列的表格，并显示边框  
需求2：修改表格的宽度，高度，表格的对齐方式，单元格间距。  
- table 标签是表格标签
	- border 设置表格标签
	- width 设置表格宽度
	- height 设置表格高度
	- align 设置表格相对于页面的对齐方式
	- cellspacing 设置单元格间距

| 标签  | 意义        | 
|----|--------|
|tr  |  是行标签|
|th|  是表头标签|
|td|  是单元格标签|
|	|align 设置单元格文本对齐方式|
|   |b 是加粗标签|

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>表格标签</title>
</head>
<body>
<!--
    
    -->
<table align="center" border="1" width="300" height="300" cellspacing="0">
    <tr>
        <th>1.1</th>
        <th>1.2</th>
        <th>1.3</th>
    </tr>
    <tr>
        <td>2.1</td>
        <td>2.2</td>
        <td>2.3</td>
    </tr>
    <tr>
        <td>3.1</td>
        <td>3.2</td>
        <td>3.3</td>
    </tr>
</table>
</body>
</html>
```

- 跨行跨列表格
需求1：
新建一个五行，五列的表格，  
第一行，第一列的单元格要跨两列，  
第二行第一列的单元格跨两行，  
第四行第四列的单元格跨两行两列。  
- `colspan` 属性设置跨列
- `rowspan` 属性设置跨行
            
```html
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>7.表格的跨行跨列</title>
    </head>
    <body>
        <table width="500" height="500" cellspacing="0" border="1">
            <tr>
                <td colspan="2">1.1</td>
                <td>1.3</td>
                <td>1.4</td>
                <td>1.5</td>
            </tr>
            <tr>
                <td rowspan="2">2.1</td>
                <td>2.2</td>
                <td>2.3</td>
                <td>2.4</td>
                <td>2.5</td>
            </tr>
            <tr>
                <td>3.2</td>
                <td>3.3</td>
                <td>3.4</td>
                <td>3.5</td>
            </tr>
            <tr>
                <td>4.1</td>
                <td>4.2</td>
                <td>4.3</td>
                <td colspan="2" rowspan="2">4.4</td>
            </tr>
            <tr>
                <td>5.1</td>
                <td>5.2</td>
                <td>5.3</td>
            </tr>
        </table>
    </body>
</html>
```

- 表单标签
表单就是 html 页面中,用来收集用户信息的所有元素集合.然后把这些信息发送给服务器。  
form标签就是表单
- `input type=text`     是文件输入框  value设置默认显示内容
- `input type=password` 是密码输入框  value设置默认显示内容
- `input type=radio`    是单选框    name属性可以对其进行分组
- `checked="checked"`表示默认选中
- `input type=checkbox` 是复选框   checked="checked"表示默认选中
- `input type=reset`    是重置按钮      value属性修改按钮上的文本
- `input type=submit `  是提交按钮      value属性修改按钮上的文本
- `input type=button`   是按钮          value属性修改按钮上的文本
- `input type=file `    是文件上传域
- `input type=hidden`   是隐藏域    当我们要发送某些信息，而这些信息，不需要用户参与，就可以使用隐藏域（提交的时候同时发送给服务器）
- `select` 标签是下拉列表框
- `option` 标签是下拉列表框中的选项 selected="selected"设置默认选中
- `textarea` 表示多行文本输入框 （起始标签和结束标签中的内容是默认值）
	- `rows` 属性设置可以显示几行的高度
	- `cols` 属性设置每行可以显示几个字符宽度
```html
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>表单的显示</title>
</head>
<body>
    <form action="http://localhost:8080" method="post">
        <input type="hidden" name="action" value="login" />
        <h1 align="center">用户注册</h1>
        <table align="center">
            <tr>
                <td> 用户名称：</td>
                <td>
                    <input type="text" name="username" value="默认值"/>
                </td>
            </tr>
            <tr>
                <td> 用户密码：</td>
                <td><input type="password" name="password" value="abc"/></td>
            </tr>
             <tr>
                <td>性别：</td>
                <td>
                    <input type="radio" name="sex" value="boy"/>男
                    <input type="radio" name="sex" checked="checked" value="girl" />女
                </td>
            </tr>
             <tr>
                <td> 兴趣爱好：</td>
                <td>
                    <input name="hobby" type="checkbox" checked="checked" value="java"/>Java
                    <input name="hobby" type="checkbox" value="js"/>JavaScript
                    <input name="hobby" type="checkbox" value="cpp"/>C++
                </td>
            </tr>
             <tr>
                <td>国籍：</td>
                <td>
                    <select name="country">
                        <option value="none">--请选择国籍--</option>
                        <option value="cn" selected="selected">中国</option>
                        <option value="usa">美国</option>
                        <option value="jp">小日本</option>
                    </select>
                </td>
            </tr>
             <tr>
                <td>自我评价：</td>
                <td><textarea name="desc" rows="10" cols="20">我才是默认值</textarea></td>
            </tr>
             <tr>
                <td><input type="reset" /></td>
                <td align="center"><input type="submit"/></td>
            </tr>
        </table>
    </form>
</body>
</html>
```
form 标签是表单标签
`action` 属性设置提交的服务器地址
`method` 属性设置提交的方式 GET(默认值)或 POST
表单提交的时候，数据没有发送给服务器的三种情况：  
1. 表单项没有 `name` 属性值
2. 单选、复选（下拉列表中的 option 标签）都需要添加 `value` 属性，以便发送给服务器
3. 表单项不在提交的 `form`标签中

- `GET` 请求的特点是：
1. 浏览器地址栏中的地址是：`action` 属性[+?+请求参数]
请求参数的格式是：`name=value&name=value`
2. 不安全
3. 它有数据长度的限制

- `POST` 请求的特点是：
1. 浏览器地址栏中只有 `action` 属性值
2. 相对于 `GET` 请求要安全
3. 理论上没有数据长度的限制

- 其他标签

|标签|  说明  |
|----|-------|
|div | 默认独占一行|
|span |它的长度是封装数据的长度|
|p |段落标签 默认会在段落的上方或下方各空出一行来（如果已有就不再空）|
## CSS层叠样式表
选择器：浏览器根据“选择器”决定受 CSS 样式影响的 HTML 元素（标签）。  
属性 (property) 是你要改变的样式名，并且每个属性都有一个值。  
属性和值被冒号分开，并由花括号包围，这样就组成了一个完整的样式声明（declaration），例如：
`p {color: blue}`

CSS 和 HTML 的结合方式
1. 在标签的`style`属性上设置 `key:value`修改标签样式。
2. 在 head 标签中，使用 `style` 标签来定义各种自己需要的 css 样式。
	`xxx {key: value value}`
	
	```html
	<style type="text/css">
		/* 需求 1：分别定义两个 div、span 标签，分别修改每个 div 标签的样式为：边框 1 个像素，实线，红色。*/
		div{
		border: 1px solid red;
		}
		span{
		border: 1px solid red;
		}
	</style>
	```
3. 把 css 样式写成一个单独的 css 文件，再通过 link 标签引入即可复用。
	`<link rel="stylesheet" type="text/css" href="./styles.css" /> `
	css文件内容
	```css
	div{
		border: 1px solid yellow;
	}
	span{
		border: 1px solid red;
	}
	```

- 选择器
	1. 标签名选择器`div{key:value;}`
	2. id选择器  `#id{ key：value;}`
	3. class选择器  `.class{key value;}`
	4. 组合选择器  `选择器1，选择器2，选择器3{key:value;}`
		-  组合选择器可以让多个选择器共用一个css样式代码

- 常用样式  
`color:red`
`width:19px`
`height:20px`

## JavaScript
### 基本语法

1. 与html结合方式
	1. 内部JS：
		- 定义`<script>` 标签体内容就是js代码
	2. 外部JS：
		* 定义`<script>`，通过src属性引入外部的js文件
		* 注意：
			1. `<script>`可以定义在html页面的任何地方。但是定义的位置会影响执行顺序。
			2. `<script>`可以定义多个。
2. 注释
	1. 单行注释：`//注释内容`
	2. 多行注释：`/*注释内容*/`
3. 数据类型：
	1. 原始数据类型(基本数据类型)：
		1. `number`：数字。 整数/小数/NaN(not a number 一个不是数字的数字类型)
		2. `string`：字符串。 字符串  "abc" "a" 'abc'
		3. `boolean`: true和false
		4. `null`：一个对象为空的占位符
		5. `undefined`：未定义。如果一个变量没有给初始化值，则会被默认赋值为`undefined`
	2. 引用数据类型：对象
4. 变量
	* 变量：一小块存储数据的内存空间
	* Java语言是强类型语言，而JavaScript是弱类型语言。
		* 强类型：在开辟变量存储空间时，定义了空间将来存储的数据的数据类型。只能存储固定类型的数据
		* 弱类型：在开辟变量存储空间时，不定义空间将来的存储数据类型，可以存放任意类型的数据。
	* 语法：
		* `var 变量名 = 初始化值;`
	* `typeof`运算符：获取变量的类型。
		* 注：null运算后得到的是object
5. 运算符
	1. 一元运算符：只有一个运算数的运算符
		- ++，-- ， +(正号)  
		* ++ --: 自增(自减)
			* ++(--) 在前，先自增(自减)，再运算
			* ++(--) 在后，先运算，再自增(自减)
		* +(-)：正负号
		* 注意：在JS中，如果运算数不是运算符所要求的类型，那么js引擎会自动的将运算数进行类型转换
            * 其他类型转number：
                * string转number：按照字面值转换。如果字面值不是数字，则转为NaN（不是数字的数字）
                * boolean转number：true转为1，false转为0
	2. 算数运算符
			+ - * / % ...
	3. 赋值运算符
			`= += -+....`
	4. 比较运算符
		- `> < >= <= == ===(全等于)`
		* 比较方式
            1. 类型相同：直接比较
                * 字符串：按照字典顺序比较。按位逐一比较，直到得出大小为止。
            2. 类型不同：先进行类型转换，再比较
                * `===`：全等于。在比较之前，先判断类型，如果类型不一样，则直接返回false
	5. 逻辑运算符
		- `&&  ||  !`
		- 其他类型转`boolean`：
			1. `number`：0或NaN为假，其他为真
			2. `string`：除了空字符串("")，其他都是true
			3. `null`&`undefined`:都是false
			4. 对象：所有对象都为true	
	6. 三元运算符
		? : 表达式
		`var a = 3;`
		`var b = 4;`
		`var c = a > b ? 1:0;`
		* 语法：
			* 表达式? 值1:值2;
			* 判断表达式的值，如果是true则取值1，如果是false则取值2；
6. 流程控制语句：
	1.  `if...else...`
	2.  `switch:`
		* 在`java`中，`switch`语句可以接受的数据类型：byte int short char,Enum(1.5) ,String(1.7)
		* switch(变量):
			case 值:
		* 在JS中,switch语句可以接受任意的原始数据类型
	3.  `while`
	4.  `do...while`
	5.  `for`

### 基本对象

1. Function 函数（方法）对象
	1. 创建方式
		1. `var fun = new Function(形式列表参数，方法体)`   不重要
		2. `function 方法名称(形式参数列表){方法体}`
		3. `var 方法名 = function(){}`
	2. 方法
	3. 属性
	4. 特点
	5. 调用
2. `Array`数组对象
	```
	var arr = new Array();
	arr.push("apple");
	arr.push("orange");

	var arr1 = ["car","dog","tiger"];
    ```
3. `Boolean`对象
4. `Date` 日期对象
5. `Math` 数学对象
6. `Number`对象
7. `String`对象
8. `RegEXP` 正则表达式对象
9. `Global`对象
### 自定义对象
1. 对象的定义：
```javascript
var 变量名 = new Object();
// 对象实例（空对象）
变量名.属性名 = 值;
// 定义一个属性
变量名.函数名 = function(){} // 定义一个函数
对象的访问：
变量名.属性 / 函数名()
```

2. {}花括号形式的自定义对象
<<<<<<< HEAD
```javascript
=======
```js
>>>>>>> db12fac (update java web)
对象的定义：
var 变量名 = {
// 空对象
属性名：值,
// 定义一个属性
属性名：值,
// 定义一个属性
函数名：function(){} // 定义一个函数
};

对象的访问：
变量名.属性 / 函数名();
```

### BOM
1. 概念：`Browser Object Model `浏览器对象模型
	* 将浏览器的各个组成部分封装成对象。
2. 组成：
	* `Window`：	窗口对象
	* `Navigator`：浏览器对象       not importtan
	* `Screen`：   显示器屏幕对象   not importtan
	* `History`：  历史记录对象
	* `Location`： 地址栏对象
3. `Window`：窗口对象
    1. 创建  
	    * `Window`对象不需要创建可以直接使用 `window.方法名()`;
	    * `window`引用可以省略。  `方法名()`;
    2. 方法
         1. 与弹出框有关的方法：
            - `alert()`	显示带有一段消息和一个确认按钮的警告框。
            - `confirm()`	显示带有一段消息以及确认按钮和取消按钮的对话框。
                - 如果用户点击确定按钮，则方法返回true
                - 如果用户点击取消按钮，则方法返回false
            - `prompt()`	显示可提示用户输入的对话框。
                - 返回值：获取用户输入的值
         2. 与打开关闭有关的方法：
            - `close()`	关闭浏览器窗口
                * 谁调用我 ，我关谁
            - `open()`	打开一个新的浏览器窗口
                * 返回新的Window对象
         3. 与定时器有关的方法
            - `setTimeout()`	在指定的毫秒数后调用函数或计算表达式。
                * 参数：
                    1. js代码或者方法对象
                    2. 毫秒值
                * 返回值：唯一标识，用于取消定时器
            - `clearTimeout()`	取消由 setTimeout() 方法设置的 timeout。
            - `setInterval()`	按照指定的周期（以毫秒计）来调用函数或计算表达式。
            - `clearInterval()`	取消由 setInterval() 设置的 timeout。
    3. 属性：
        1. 获取其他BOM对象：
            `history`
            `location`
            `Navigator`
            `Screen`
        2. 获取DOM对象
            `document`
    4. 特点
        * Window对象不需要创建可以直接使用 window使用。 window.方法名();
        * window引用可以省略。 方法名();
4. `Location`：地址栏对象
	1. 创建(获取)：
		 1. `window.location`
		 2.`location`
	2. 方法：
		* `reload()`	重新加载当前文档。刷新
	3. 属性
		* `href`	设置或返回完整的 URL。
5. `History`：历史记录对象
    1. 创建(获取)：
        1. `window.history`
        2. `history`
    2. 方法：
        * `back()`	加载 history 列表中的前一个 URL。
        * `forward()`	加载 history 列表中的下一个 URL。
        * `go(参数)`	加载 history 列表中的某个具体页面。
            * 参数：
                * 正数：前进几个历史记录
                * 负数：后退几个历史记录
    3. 属性：
        * length	返回当前窗口历史列表中的 URL 数量。
### DOM
* 概念： `Document Object Model`文档对象模型
	* 将标记语言文档的各个组成部分，封装为对象。可以使用这些对象，对标记语言文档进行**CRUD**的动态操作

* W3C DOM 标准被分为 3 个不同的部分：
	* 核心 DOM - 针对任何结构化文档的标准模型
		* `Document`：  文档对象
		* `Element`：   元素对象
		* `Attribute`： 属性对象
		* `Text`：     文本对象
		* `Comment`:   注释对象
		* `Node`：     节点对象，其他5个的父对象
	* XML DOM - 针对 XML 文档的标准模型
	* HTML DOM - 针对 HTML 文档的标准模型

* 核心DOM模型：
	* `Document`：文档对象
		1. 创建(获取)：在HTML dom 模型中可以使用window对象来获取
			1. `window.document`
			2. `document`
		2. 方法：
			1. 获取Element对象：
				1.`getElementById(elementId)`	： 根据id属性值获取元素对象。id属性值一般唯一
				2.`getElementsByTagName(tagname)`：根据元素名称获取元素对象们。返回值是一个数组
				3.`getElementsByClassName(className)`:根据Class属性值获取元素对象们。返回值是一个数组
				4.`getElementsByName(elementName)`: 根据name属性值获取元素对象们。返回值是一个数组
			2. 创建其他DOM对象：
				 - `createAttribute(name)`
				 - `createComment()`
            	- `createElement()`
            	- `createTextNode()`
		3. 属性
	* `Element`：元素对象
		1. 获取/创建：通过`document`来获取和创建
		2. 方法：
			1. `removeAttribute()`：删除属性
			2. `setAttribute()`：设置属性
	* `Node`：节点对象，其他5个的父对象
		* 特点：所有dom对象都可以被认为是一个节点
		* 方法：
			* CRUD dom树：
				* `appendChild()`：向节点的子节点列表的结尾添加新的子节点。
				* `removeChild()`：删除（并返回）当前节点的指定子节点。
				* `replaceChild()`：用新节点替换一个子节点。
		* 属性：
			* `parentNode` 返回节点的父节点。
* HTML DOM
	1. 标签体的设置和获取：`innerHTML`   `innertext`
	2. 使用html元素对象的属性
	3. 控制元素样式
		1. 使用元素的style属性来设置  
			如：
			```javascript
			//修改样式方式1
		        div1.style.border = "1px solid red";
		        div1.style.width = "200px";
		        //font-size--> fontSize
		        div1.style.fontSize = "20px";
			``` 
		2. 提前定义好类选择器的样式，通过元素的className属性来设置其class属性值。

DOM模型

### 事件监听机制
* 概念：某些组件被执行了某些操作后，触发某些代码的执行。	
	* 事件：某些操作。如： 单击，双击，键盘按下了，鼠标移动了
	* 事件源：组件。如： 按钮 文本输入框...
	* 监听器：代码。
	* 注册监听：将事件，事件源，监听器结合在一起。 当事件源上发生了某个事件，则触发执行某个监听器代码。
	* 常见的事件：
		1. 点击事件：
			1. `onclick`：单击事件
			2. `ondblclick`：双击事件
		2. 焦点事件
			1. `onblur`：失去焦点
			2. `onfocus`:元素获得焦点。
		3. 加载事件：
			1. `onload`：一张页面或一幅图像完成加载。
		4. 鼠标事件：
			1. `onmousedown`	鼠标按钮被按下。
			2. `onmouseup`	鼠标按键被松开。
			3. `onmousemove`	鼠标被移动。
			4. `onmouseover`	鼠标移到某元素之上。
			5. `onmouseout`	鼠标从某元素移开。
		5. 键盘事件：
			1. `onkeydown`	某个键盘按键被按下。	
			2. `onkeyup`		某个键盘按键被松开。
			3. `onkeypress`	某个键盘按键被按下并松开。
	
		6. 选择和改变
			1. `onchange`	域的内容被改变。
			2. `onselect`	文本被选中。
	
		7. 表单事件：
			1. `onsubmit`	确认按钮被点击。
			2. `onreset`	重置按钮被点击。

## JQuery
概念
`$`是jQuery的核心函数，能完成jQuery的很多功能。` $()`就是调用`$`这个函数
1. 传入参数为函数时
	表示页面加载完成之后。相当于`window.onload = function(){}`
2. 传入参数为 HTML 字符串时
	会对我们创建这个HTML标签对象
3. 传入参数为 **选择器字符串时**：
	`$(“#id 属性值”);`    id 选择器，根据 id 查询标签对象
    `$(“标签名”); `      标签名选择器，根据指定的标签名查询标签对象
    `$(“.class 属性值”);` 类型选择器，可以根据 class 属性查询标签对象
4. 传入参数为DOM对象时：
	会把这个 `dom` 对象转换为 `jQuery`对象

jQuery对象和dom对象区分
jQuery对象的本质是dom对象的数组+jQuery提供的一些列功能函数。

dom 对象转化为 jQuery 对象（重点）
- 先有 DOM 对象
- `$( DOM 对象 )` 就可以转换成为 jQuery 对象
jQuery 对象转为 dom 对象（重点）
- 先有 jQuery 对象
- `jQuery 对象[下标]`取出相应的 DOM 对象(重点）

`jQuery`选择器
- 基本选择器
- 层级选择器
- 过滤选择器

`jQuery`属性操作

|属性|说明|  备注|
|-----|----|----|
|html()|它可以设置和获取起始标签和结束标签中的内容。|跟 dom 属性 innerHTML 一样。|
|text()|它可以设置和获取起始标签和结束标签中的文本。|跟 dom 属性 innerText 一样。|
|val()|它可以设置和获取表单项的 value 属性值。|跟 dom 属性 value 一样|
|attr()| 设置和获取属性的值    |   |
|prop()|    可以设置和获取属性的值                |                      |

## Tomcat

java web 概念
JavaWeb 是指，所有通过 Java 语言编写可以通过浏览器访问的程序的总称，叫 JavaWeb。

JavaWeb 是基于请求和响应来开发的。
请求`Request`
响应`Response`
web服务器
- 由 Apache 组织提供的一种 Web 服务器，提供对 jsp 和 Servlet 的支持。它是一种轻量级的 javaWeb 容器（服务器），也是当前应用最广的 JavaWeb 服务器（免费）。
- Jboss：是一个遵从 JavaEE 规范的、开放源代码的、纯 Java 的 EJB 服务器，它支持所有的 JavaEE 规范（免费）。
## XML
语法
1. 文档声明
2. 元素
3. xml属性
4. xml注释
5. 文本区域（CDATA区）

XML解析技术介绍
DOM 和 sax
第三方解析：
- `jdom`
- `dom4j`
- `pull`

## Servlet1
1. 什么是Servlet
	1. Servlet 是 JavaEE 规范之一。规范就是接口
	2. Servlet 就 JavaWeb 三大组件之一。JavaWeb***三大组件***分别是：**Servlet程序、Filter 过滤器、Listener监听器**。 
	3. Servlet 是运行在服务器上的一个java小程序，它可以接收客户端发送过来的请求，并响应数据给客户端。

手动实现Servlet程序
1、编写一个类去实现 `Servlet` 接口
2、实现 `service` 方法，处理请求，并响应数据
3、到 web.xml 中去配置 servlet 程序的访问地址

- web.xml配置
```xml
<!--context-param是上下文参数(它属于整个web工程)-->
    <context-param>
        <param-name>username</param-name>
        <param-value>context</param-value>
    </context-param>
      <!--context-param是上下文参数(它属于整个web工程)-->
    <context-param>
        <param-name>password</param-name>
        <param-value>root</param-value>
    </context-param>
    <!-- servlet标签给Tomcat配置Servlet程序 -->
    <servlet>
        <!--servlet-name标签 Servlet程序起一个别名（一般是类名） -->
        <servlet-name>HelloServlet</servlet-name>
        <!--servlet-class是Servlet程序的全类名-->
        <servlet-class>com.atguigu.servlet.HelloServlet</servlet-class>
        <!--init-param是初始化参数-->
        <init-param>
            <!--是参数名-->
            <param-name>username</param-name>
            <!--是参数值-->
            <param-value>root</param-value>
        </init-param>
        <!--init-param是初始化参数-->
        <init-param>
            <!--是参数名-->
            <param-name>url</param-name>
            <!--是参数值-->
            <param-value>jdbc:mysql://localhost:3306/test</param-value>
        </init-param>
    </servlet>
    <!--servlet-mapping标签给servlet程序配置访问地址-->
    <servlet-mapping>
        <!--servlet-name标签的作用是告诉服务器，我当前配置的地址给哪个Servlet程序使用-->
        <servlet-name>HelloServlet</servlet-name>
        <!--
           url-pattern标签配置访问地址                             
           / 斜杠在服务器解析的时候，表示地址为：http://ip:port/工程路径
           /hello 表示地址为：http://ip:port/工程路径/hello 
        -->
        <url-pattern>/hello</url-pattern>
    </servlet-mapping>
```

- Servlet的生命周期
1. 执行Servlet构造器方法
2. 执行init初始化方法
	第一二步，是在第一次访问的时候创建`Servlet`程序会调用
3. 执行`service`方法
	第三步，每次访问都会调用
4. 执行destroy销毁方法
	第四步，在web工程停止的时候调用

- 通过继承`HttpServlet`实现`Servlet`程序
	1. 编写一个类去继承 `HttpServlet` 类
	2. 根据业务需要重写 `doGet()` 或 `doPost()` 方法
	3. 到 web.xml 中的配置`Servlet`程序的访问地址

- [HttpServlet源码分析](https://blog.csdn.net/molu1991/article/details/123943821)

### ServletConfig类
`ServletConfig` 类从类名上来看，就知道是 `Servlet` 程序的配置信息类。
`Servlet` 程序和 `ServletConfig` 对象都是由 Tomcat 负责创建，我们负责使用。

Servlet 程序默认是第一次访问的时候创建，`ServletConfig`是每个 `Servlet` 程序创建时，就创建一个对应的 `ServletConfig` 对象。

ServletConfig 类的三大作用
1. 可以获取 `Servlet` 程序的别名 `servlet-name` 的值
2. 获取初始化参数 `init-param`
3. 获取 `ServletContext` 对象

```java
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        System.out.println("重写了init初始化方法,做了一些工作");
    }
```

`ServletConfig Servlet.getServletConfig()`

### ServletContext类
1、`ServletContext` 是一个接口，它表示 `Servlet` 上下文对象
2、一个 web 工程，只有一个 `ServletContext` 对象实例。
3、`ServletContext` 对象是一个域对象。
4、`ServletContext` 是在 web 工程部署启动的时候创建。在 web 工程停止的时候销毁。

什么是域对象?
域对象，是可以像 Map 一样存取数据的对象，叫域对象。
这里的域指的是存取数据的操作范围，整个 web 工程。

|  |存数据|取数据|删除数据|
|---|----|----|-------|
|Map|put()|get()|remove()|
|域对象|setAttribute()|getAttribute()|removeAttribute()|

- ServeltContext类的四个作用
	1. 获取 web.xml 中配置的上下文参数 `context-param`
	2. 获取当前的工程路径，格式: /工程路径
	3. 获取工程部署后在服务器硬盘上的绝对路径
	4. 像 Map 一样存取数据

- `ServletConetx getServletContext()`

## HTTP协议
什么是协议?

- 协议是指双方，或多方，相互约定好，大家都需要遵守的规则，叫协议。
- 所谓 HTTP 协议，就是指，客户端和服务器之间通信时，发送的数据，需要遵守的规则，叫 HTTP 协议。
HTTP 协议中的数据又叫报文。
客户端给服务器发送数据叫**请求**。
服务器给客户端回传数据叫**响应**。

### HTTP请求协议

- GET请求
	1. 请求行  
		1. 请求方式                   `GET`
		2. 请求资源路径               `[+?+请求参数]`
		3. 请求的协议版本号            `HTTP/1.1`
	2. 请求头
	   1. key:value
- POST请求
	1. 请求行  
	   1. 请求方式                     POST  
	   2. 请求的资源路径               `[+?+请求参数]`
	   3. 请求的协议的版本号            HTTP/1.1
	2. 请求头
	   1. key:value
	3. 空行
	4. 请求体  就是发生给服务器的数据

- 常用请求头的说明
`Accept`: 表示客户端可以接收的数据类型
`Accpet-Languege`: 表示客户端可以接收的语言类型
`User-Agent`: 表示客户端浏览器的信息
`Host`：表示请求时的服务器 ip 和端口号

- 哪些是GET请求，哪些是POST请求（html中）
	- GET 请求有哪些：
		1. form 标签 `method=get`
		2. a 标签
		3. link 标签引入 css
		4. Script 标签引入 js 文件
		5. img 标签引入图片
		6. iframe 引入 html 页面
		7. 在浏览器地址栏中输入地址后敲回车
	- POST 请求有哪些：
		1. form 标签 `method=post`
### HTTP响应协议
- 响应的HTTP协议
	1. 响应行
	   1. 响应协议和版本号
	   2. 响应状态码
	   3. 响应状态描述符
	2. 响应头
	   - key:value
	3. 空行
	4. 响应体  

- 常用响应码说明

|响应码|说明|
|---|-----|
|200|表示请求成功|
|302|表示请求重定向|
|404|表示请求服务器已经收到了，但是你要的数据不存在（请求地址错误）|
|500|表示服务器已经收到请求，但是服务器内部错误（代码错误）|

## HttpServletRequest & HttpServletResponse
### HttpServletRequest
a) HttpServletRequest类的作用
每次只要有请求进入 Tomcat 服务器，Tomcat 服务器就会把请求过来的 HTTP 协议信息解析好封装到`Request`对象中。然后传递到service方法（`doGet()`和`doPost()`）中给我们使用。我们可以通过HttpServletRequest对象，获取到所有请求的信息
b) HttpServletRequest类的常用方法
1. `getRequestURI()`      获取请求的资源路径
2. `getRequestURL()`      获取请求的统一资源定位符（绝对路径）
3. `getRemoteHost()`      获取客户端的 ip 地址
4. `String getHeader(String s)`         获取请求头
5. `String gerParamerter(String s)`      获取请求的参数
6. `String[] getParameterValues(String s)`  获取请求的参数（多个值的时候使用）
7. `String getMethod()`          获取请求的方式 GET 或 POST
8. `setAttribute()`       设置域数据
9. `getAttribute()`       获取域数据
10. `getRequestDispacher()`获取请求转发对象
c) 如何获取请求参数
	上述5和6  
d) doGet请求中的中文乱码
e) doPost请求中的中文乱码

e) 请求的转发
请求转发是指，服务器收到请求后，从一次资源跳转到另一个资源的操作叫请求转发。
```java
RequestDispatcher requestDispatcher = req.getRequestDispatcher("/servlet2");
// 走向 Sevlet2（柜台 2）
requestDispatcher.forward(req,resp);
```

### HttpServletResponse
a) `HttpServletResponse` 类的作用
`HttpServletResponse` 类和 `HttpServletRequest` 类一样。每次请求进来，Tomcat 服务器都会创建一个 `Response` 对象传递给 `Servlet` 程序去使用。`HttpServletRequest` 表示请求过来的信息，`HttpServletResponse` 表示所有响应的信息，我们如果需要设置返回给客户端的信息，都可以通过 `HttpServletResponse` 对象来进行设置

b) 两个输出流的说明。  
- `ServletOutputStream getOutputStream()` 常用于下载
- `PrintWriter getWriter()`  常用于回传数据（常用）
两个流同时只能使用一个。
使用了字节流，就不能再使用字符流，反之亦然，否则就会报错。
c) 如何往客户端回传数据
```java
	// 向客户端回传数据
    PrintWriter writer = resp.getWriter();
    writer.wrire("response's content");
```
d) 响应的乱码解决
- 方案一  不推荐
```java
// 设置服务器字符集为 UTF-8
resp.setCharacterEncoding("UTF-8");
// 通过响应头，设置浏览器也使用 UTF-8 字符集
resp.setHeader("Content-Type", "text/html; charset=UTF-8");
```
- 方案二  推荐
```java
// 它会同时设置服务器和客户端都使用 UTF-8 字符集，还设置了响应头
// 此方法一定要在获取流对象之前调用才有效
resp.setContentType("text/html; charset=UTF-8");
```

e) 请求重定向
- 第一种方案(不推荐)：
```java
// 设置响应状态码 302 ，表示重定向，（已搬迁）
resp.setStatus(302);
// 设置响应头，说明 新的地址在哪里
resp.setHeader("Location", "http://localhost:8080");
```

- 第二种方案（推荐使用）：
```java
resp.sendRedirect("http://localhost:8080");
```

## JSP
`JSP`的全称是`java server pages`。java的服务器页面。
JSP的主要作用是代替Servlet程序回传html页面的数据。
jsp本质是一个Servlet程序。
`HttpJspServlet`继承了`HttpServlet`类。
其底层实现，就是通过输出流，把 html 页面数据回传给客户端
### JSP的三种语法
jsp文件头部声明介绍
`<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>`
这是jsp文件的头声明。表示这是jsp页面。
`language` 属性      值只能是 java。 表示翻译的得到的是 java 语言的
`contentType`属性   设置响应头 contentType 的内容
`pageEncoding`属性  设置当前 jsp 页面的编码
`import` 属性       给当前 jsp 页面导入需要使用的类包
`autoFlush` 属性    设置是否自动刷新 out 的缓冲区，默认为 true
`buffer` 属性       设置 out 的缓冲区大小。默认为 8KB
`errorPage` 属性    设置当前 jsp 发生错误后，需要跳转到哪个页面去显示错误信息
`isErrorPage` 属性   设置当前 jsp 页面是否是错误页面。是的话，就可以使用 exception 异常对象
`session` 属性     设置当前 jsp 页面是否获取 `session` 对象,默认为 `true`
`extends` 属性     给服务器厂商预留的 jsp 默认翻译的 servlet 继承于什么类

jsp中的三种脚本介绍
1. 声明脚本（声明脚本）
	`<%! java code %>`
	在声明脚本块中，我们可以干 4 件事情
	1. 我们可以定义全局变量。
	2. 定义 static 静态代码块
	3. 定义方法
	4. 定义内部类
	几乎可以写在类的内部写的代码，都可以通过声明脚本来实现
2. 表达式脚本(重点，常用)
	`<%= expression here %>`
	表达式脚本 用于向页面输出内容。
	表达式脚本 翻译到 Servlet 程序的 service 方法中 以 out.print() 打印输出
	out 是 jsp 的一个内置对象，用于生成 html 的源代码
	注意：表达式不要以分号结尾，否则会报错
	表达式脚本可以输出任意类型。
	比如：
	1.输出整型
	2.输出浮点型
	3.输出字符串
	4.输出对象
3. 代码脚本(重点，常用)
	`<% java code here %>`
	代码脚本里可以书写任意的 java 语句。
	代码脚本的内容都会被翻译到 `service` 方法中。
	所以 service 方法中可以写的 java 代码，都可以书写到代码脚本中
jsp中有三种注释：
	1、html注释 
		<!--  html注释  -->
		html注释翻译之后会在_jspService()方法以out.write输出到页面
	2、java注释 
		// 单行注释
		/*  多行注释 */
		java的多行注释在翻译之后在翻译到servlet程序的源代码中
	3、jsp注释 
		<%-- jsp注释 --%>
		jsp注释可以注掉jsp中所有内容，在jsp翻译的时候会被完全忽略掉

### jsp九大内置对象

| 对象|作用|
| --------|--------|
|`request`|请求对象，可以获取请求信息|
|`response` |    响应对象。可以设置响应信息|
|`pageContext` | 当前页面上下文对象。可以在当前上下文保存属性信息|
|`session`      |会话对象。可以获取会话信息。|
|`exception` |   异常对象只有在 jsp 页面的 page 指令中设置 `isErrorPage="true"` 的时候才会存在|
|`application`  |`ServletContext` 对象实例，可以获取整个工程的一些信息。|
|`config` |  `ServletConfig` 对象实例，可以获取 `Servlet` 的配置信息|
|`out`  |输出流|
|`page`|  表示当前 `Servlet` 对象实例（无用，用它不如使用 this 对象）。|

九大内置对象，都是我们可以在【代码脚本】中或【表达式脚本】中直接使用的对象。
### jsp四大域对象
| 对象|作用|
|-----| ----|
|`pageContex(PageContextImpl类)` |    当前jsp页面范围内有效|
|`request(HttpServletRequest类)`   |  一次请求内有效|
|`session(HttpSession类)` |           一次会话范围内有效（打开浏览器访问服务器，知道关闭浏览器）|
|`application(ServletContext类)` |    整个web工程范围内都有效（只要web工程不停止，数据都在）|

### JSP常用标签
- jsp 静态包含
```jsp
<%--
<%@ include file=""%> 就是静态包含
file 属性指定你要包含的 jsp 页面的路径
地址中第一个斜杠 / 表示为 http://ip:port/工程路径/ 映射到代码的 web 目录
静态包含的特点：
1、静态包含不会翻译被包含的 jsp 页面。
2、静态包含其实是把被包含的 jsp 页面的代码拷贝到包含的位置执行输出
--%>
<%@ include file="/include/footer.jsp"%>
```

- jsp动态包含
```jsp
<%--
<jsp:include page=""></jsp:include>
这是动态包含
page 属性是指定你要包含的 jsp 页面的路径
动态包含也可以像静态包含一样。把被包含的内容执行输出到包含位置
动态包含的特点：
1、动态包含会把包含的 jsp 页面也翻译成为 java 代码
2、动态包含底层代码使用如下代码去调用被包含的 jsp 页面执行输出。
JspRuntimeLibrary.include(request, response, "/include/footer.jsp", out, false);
3、动态包含，还可以传递参数
--%>
<jsp:include page="/include/footer.jsp">

<jsp:param name="username" value="bbj"/>

<jsp:param name="password" value="root"/>

</jsp:include>
```

jsp标签-转发
```jsp
<%--

<jsp:forward page=""></jsp:forward> 是请求转发标签，它的功能就是请求转发

page 属性设置请求转发的路径

--%>
<jsp:forward page="/scope2.jsp"></jsp:forward>
```

### Listener

## EL表达式JSTL表达式
### EL表达式

EL 表达式主要是代替 jsp 页面中的表达式脚本在 jsp 页面中进行数据的输出。

因为 EL 表达式在输出数据的时候，要比 jsp 的表达式脚本要简洁很多。
格式：`${expression}`

### JSTL表达式

## Cookie and Session
`resp.addCookie()`

`request.getCookie()`

`cookie.setMacage()`    秒


```java

req.getSession().setAttribute("key1", "value1");

resp.getWriter().write("已经往 Session 中保存了数据");
```
## Filter
`Filter` 的生命周期包含几个方法

1. 构造器方法
2. init 初始化方法
	第 1，2 步，在 web 工程启动的时候执行（Filter 已经创建）
3. doFilter 过滤方法
	第 3 步，每次拦截到请求，就会执行
4. destroy 销毁
	第 4 步，停止 web 工程的时候，就会执行（停止 web 工程，也会销毁 Filter 过滤器）

`FilterConfig`类

Filter的拦截路径
- 精确匹配
- 目录匹配
- 后缀名匹配

## JSON AJAX
### JSON
JSON(JavaScripr Object Notation)

- json的定义
```javascript
var varname = {
	"key1":value,
	"key2":"value",
	"key3":[],
	"key4",{},
	"key5",[{},{}]
}

var jsonObj = {
	"key1":12,
	"key2":"abc",
	"key3":true,
	"key4":[11,"arr",false],
	"key5":{"key5_1" : 551,"key5_2" : "key5_2_value"},
	"key6":[{"key6_1_1":6611,"key6_1_2":"key6_1_2_value"},
		    {"key6_2_1":6621,"key6_2_2":"key6_2_2_value"}]
			  };
```

- json的访问
```javascript
alert(typeof(jsonObj));// object json 就是一个对象
alert(jsonObj.key1); //12
alert(jsonObj.key2); // abc
alert(jsonObj.key3); // true
alert(jsonObj.key4);// 得到数组[11,"arr",false]
// json 中 数组值的遍历
for(var i = 0; i < jsonObj.key4.length; i++) {
alert(jsonObj.key4[i]);
}
alert(jsonObj.key5.key5_1);//551
alert(jsonObj.key5.key5_2);//key5_2_value
alert( jsonObj.key6 );// 得到 json 数组
// 取出来每一个元素都是 json 对象
var jsonItem = jsonObj.key6[0];
// alert( jsonItem.key6_1_1 ); //6611
alert( jsonItem.key6_1_2 ); //key6_1_2_value
```

json的两个常用方法
json 的存在有两种形式。
一种是：对象的形式存在，我们叫它 json 对象。
一种是：字符串的形式存在，我们叫它 json 字符串。

一般我们要操作 json 中的数据的时候，需要 json 对象的格式。
一般我们要在客户端和服务器之间进行数据交换的时候，使用 json 字符串。

`JSON.stringify()`   把 json 对象转换成为 json 字符串
`JSON.parse()`      把 json 字符串转换成为 json 对象

- json在java中的使用
`gson.jar`
json在java中的操作。常见的有三种情况
1、java 对象和 json 的转换
2、java 对象 list 集合和 json 的转换
3、map 对象和 json 的转换

### AJAX
[尚硅谷ajax](https://www.bilibili.com/video/BV1Y7411K7zz?p=311)

什么是AJAX
AJAX即“Asynchronous Javascript And XML”（异步 JavaScript 和 XML），是**指一种创建交互式网页应用的网页开发技术**。

ajax 是一种浏览器通过 js 异步发起请求，局部更新页面的技术。

Ajax 请求的局部更新，***浏览器地址栏不会发生变化***

局部更新不会舍弃原来页面的内容

jQuery 中的AJAX
- `$.ajax(url,type,data,success,dataType)`

|参数|意义|备注|
|----|----|---|
|url|表示请求的地址||
|type|表示请求的类型 GET 或 POST 请求||
|data|表示发送给服务器的数据|格式有两种：1. name=value&name=value  2. {key:value}|
|success|请求成功，响应的回调函数||
|dataType|响应的数据类型|常用的数据类型有：text 表示纯文本xml 表示 xml 数据json 表示 json 对象|
- `$.get(url,data,callback,type)`
- `$.post(url,data,callback,type)`
url    请求的 url 地址
data   发送的数据
callback   成功的回调函数
type   返回的数据类型
- `$.getJSON(url,data,callback)`
url       请求的 url 地址
data      发送给服务器的数据
callback  成功的回调函数
## Vue
|指令|简写|描述|
|---|----|----|
|v-text|  |普通文本|
|v-model|    | 双向绑定 |
|v-html|    |真正的html|
|v-on|   @  |  绑定事件|
|v-show|    |    |
|v-if|      |    |
|v-for|      |    |
|v-bind|  :  | 作用在html属性上|

axios

## Redis

数据类型
字符串String
散列表hash map
列表List
集合Set
有序集合

