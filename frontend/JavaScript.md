来源：[`w3cschool js教程`](https://www.w3school.com.cn/js/index.asp)
# js注释

```javascript
// 单行注释
/* 多行注释*/
```

# js变量
```js
var x = 7;
var y = 8;
var z = x + y;
```

# js let
作用域问题

# js const

# JS运算符

[JS运算符](https://www.w3school.com.cn/js/js_operators.asp)


# [JavaScript数据类型](https://www.w3school.com.cn/js/js_datatypes.asp)

字符串，数值，布尔值，数组，对象

* JavaScript 拥有动态类型

* JavaScript 从左向右计算表达式。不同的次序会产生不同的结果：

```javascript
var x = 911 + 7 +'Porsche'   // 918Prosche
```

* js数组

```javascript
var cars = ["Porsche", "Volvo", "BMW"]
```

* js对象

```javascript
var person = {firstName:"Bill", lastName:"Gates", age:62, eyeColor:"blue"};
```

##  `typeof`  运算符

```js
typeof ""                  // 返回 "string"
typeof "Bill"              // 返回 "string"
typeof "Bill Gates"          // 返回 "string"
```

## `undefined`
在 JavaScript 中，没有值的变量，其值是 `undefined`。typeof 也返回 `undefined`。
```js
var person;                  // 值是 undefined，类型是 undefined。
```
任何变量均可通过设置值为 `undefined` 进行清空。其类型也将是 `undefined`
```js
person = undefined;          // 值是 undefined，类型是 undefined。
```
## 空值

```js
var car = "";                // 值是 ""，类型是 "string"
```

## `null`
在 JavaScript 中，`null` 是 "nothing"。它被看做不存在的事物。

不幸的是，在 JavaScript 中，`null` 的数据类型是对象。

您可以把 `null` 在 JavaScript 中是对象理解为一个 bug。它本应是 `null`。

您可以通过设置值为 `null` 清空对象

```js
var person = null;           // 值是 null，但是类型仍然是对象
```

## Undefined 与 Null 的区别
`Undefined` 与 `null` 的值相等，但类型不相等：

```js
typeof undefined              // undefined
typeof null                   // object
null === undefined            // false
null == undefined             // true
```

* 对象
* 

# JS函数

## 函数声明

```javascript
function functionName (arg1, arg2){
   // code
    return 0;
}
```

```javascript
var x = function (a, b) {return a * b};
var z = x(4, 3);
```

函数表达式
```javascript
var x = function(){ return a*b}
```
## 函数提升

## 函数调用

* 当事件发生时
* 当JavasScript代码调用时
* 自动的（自调用）

访问没有 () 的函数将返回函数定义

函数是对象
```javascript
function myFunction(a, b) {
    return arguments.length;
}
```

```javascript
function myFunction(a, b) {
    return a * b;
}

var txt = myFunction.toString();
```
## 箭头函数

```javascript
// ES5
var x = function(x, y) {
  return x * y;
}

// ES6
const x = (x, y) => x * y;
```
箭头函数没有自己的 this。它们不适合定义对象方法。

箭头函数未被提升。它们必须在使用前进行定义。

使用 const 比使用 var 更安全，因为函数表达式始终是常量值。

如果函数是单个语句，则只能省略 return 关键字和大括号。因此，保留它们可能是一个好习惯：
```js
const x = (x, y) =>{return x * Y };
```

## 函数参数

arguments对象

# JS对象
```javascript
var car = {type = "porsche", model = "911", color:"red"};

var person = {
  firstName: "Bill",
  lastName : "Gates",
  id       : 678,
  fullName : function() {
    return this.firstName + " " + this.lastName;
  }
};
```

## 对象属性


## 对象方法

## 对象构造器


### this关键词
在函数定义中，`this` 引用该函数的“拥有者”。
### 对象定义

## JS对象原型




# JS事件
```html
<!DOCTYPE html>
<html>
<body>

<h1 onclick="this.innerHTML = 'Hello!'">点击此文本！</h1>

</body>
</html>
```

```javascript
<element event = 'some JavaScript code'>
```

* 常见的HTML事件

| 事件 | 描述 |
| ---- | ---- |
| onchange | HTML元素被改变 |
| onclick | 用户点击了HTML元素 |
| onmouseover | 用户把鼠标移动到 HTML 元素上 |
| onmouseout | 用户把鼠标移开 HTML 元素 |
| onkeydown | 用户按下键盘按键 |
| onload | 浏览器已经完成页面加载 |
|  |  |

## onload 和 onunload 事件

当用户进入后及离开页面时，会触发 `onload` 和 `onunload` 事件。

`onload` 事件可用于检测访问者的浏览器类型和浏览器版本，然后基于该信息加载网页的恰当版本。

`onload` 和 `onunload` 事件可用于处理 cookie。

## onchange 事件

`onchange` 事件经常与输入字段验证结合使用。

下面是一个如何使用 `onchange` 的例子。当用户改变输入字段内容时，会调用 upperCase() 函数。

## onmouseover 和 onmouseout 事件

`onmouseover` 和 `onmouseout` 事件可用于当用户将鼠标移至 HTML 元素上或移出时触发某个函数：

## HTML DOM Event 对象参考手册

如需所有 HTML DOM 事件的列表，请访问我们完整的 [HTML DOM 事件对象参考手册](https://www.w3school.com.cn/jsref/dom_obj_event.asp "HTML DOM Event 对象")。

# [JS字符串](https://www.w3school.com.cn/js/js_string_methods.asp)

* 字符串长度 length

```javascript
var txt = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
vat sln = txt.length
```

* 查找字符串中的字符串  

indexOF()    lastIndexOf()

* 检索字符串中的字符串

search()

* slice()
* substring()
* substr()
* replace()
* toUpperCase()
* toLowerCase()
* concat()
* trim()
* charAt()   charCodeAt()
* split()

# JS数字

JavaScript数值始终是64位的浮点数

## JS数字方法

* toString()
* toExponential()
* toFixed()
* toPrecision()
* valueOf()

# JS数组

## 数组方法

## 数组排序

## 数组迭代


## 数组和对象的区别

在 JavaScript 中，_数组_使用_数字索引_。

在 JavaScript 中，_对象_使用_命名索引_。

数组是特殊类型的对象，具有数字索引。
# JS日期


# JS 类

# JS Async
# JavaScript HTML DOM
**通过 HTML DOM，JavaScript 能够访问和改变 HTML 文档的所有元素。**


# JS Browser BOM
**浏览器对象模型（==B==rowser ==O==bject ==M==odel (BOM)）允许 JavaScript 与浏览器对话。**


## window

## screen

## Lccation

## History

## Navigator

## 弹出框

## Timing

## Cookies


# WEB API

# AJAX

# jQuery
jQuery 由 John Resig 于 2006 年创建。它旨在处理浏览器不兼容性并简化 HTML DOM 操作、事件处理、动画和 Ajax。

十多年来，jQuery 一直是世界上最受欢迎的 JavaScript 库。

但是，在 JavaScript Version 5（2009）之后，大多数 jQuery 实用程序都可以通过几行标准 JavaScript 来解决

## jQuery选择器

### 通过id来查找HTML元素

### 通过标签名来查找 HTML 元素

### 通过类名来查找 HTML 元素

### 通过 CSS 选择器查找 HTML 元素

## jQuery HTML

### 设置HTML内容

### 获取 HTML 内容

## jQuery CSS样式
### 隐藏HTML元素

### 显示HTML元素

### 样式化HTML元素

## jQuery HTML DOM

### 删除元素

### 获取父元素


# vue

每个 Vue 应用都需要通过实例化 Vue 来实现。

```javascript
 var vm = new Vue({
        el: '#vue_det',  // 
        data: {
            site: "菜鸟教程",
            url: "www.runoob.com",
            alexa: "10000"
        },
        methods: {
            details: function() {
                return  this.site + " - 学的不仅是技术，更是梦想！";
            }
        }
     	filters:{   // 过滤器
 		}
        computed:{
              site:{
                  // getter
                  get:function(){
     					return  this.xxx
 					}
				  // setter
				  set:function(){                      
                  	}
                  }    
 		}
    })
```



## 缩写 

```html
<!-- 完整语法 -->
<a v-bind:href="url"></a>
<!-- 缩写 -->
<a :href="url"></a>

<!-- 完整语法 -->
<a v-on:click="doSomething"></a>
<!-- 缩写 -->
<a @click="doSomething"></a>
```

## 指令

指令是带有 v- 前缀的特殊属性。

* 使用 v-html 指令用于输出 html 代码
* v-if
* v-else
* v-else-if
* v-show
* v-for

循环使用 v-for 指令。

v-for 指令需要以 **site in sites** 形式的特殊语法， sites 是源数据数组并且 site 是数组元素迭代的别名。

