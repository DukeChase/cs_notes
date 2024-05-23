
**学习 Vue 之前需要掌握的 JavaScript 基础知识**

ES6 语法规范

- `let const`
- 解构赋值
- 模板字符串
- 箭头函数

ES6 模块化

- 默认暴露
- 分别暴露
- 统一暴露
- import 、export

包管理器

- npm、yarn 或者是 cnpm

原型、原型链（重点）

数组常用方法

- 过滤数组、加工数组、筛选最值

axios

promise

# VUE basic

## 模版语法

## 数据绑定

el 和 data 的两种写法
```javascript
const v = new Vue({

//el:'#root', //第一种写法

data:{

name:'尚硅谷'

}

})

v.mount('#root') //第二种写法
```

```javascript
new Vue({
	el:'#root',
	//data的第一种写法：对象式
	/* data:{
	name:'尚硅谷'
	} */
	//data的第二种写法：函数式
	data(){
		console.log('@@@',this) //此处的this是Vue实例对象
		return{
		name:'尚硅谷'
		}
	}
})
```
## 理解mvvm
## 数据代理
## 事件处理
## 计算属性
## 监视属性
深度监视
## 绑定样式
绑定class样式
绑定style样式

## 条件渲染
## 列表渲染
v-for指令:

1. 用于展示列表数据
2. 语法：`v-for="(item, index) in xxx" :key="yyy"`
3. 可遍历：数组、对象、字符串（用的很少）、指定次数（用的很少）

key的作用和原理

```html
<li v-for:"(p,index) in persons" :key="p.id">
	{{p.name}} --- {{p.age}}
<li>
```

列表过滤

Vue.set
## 收集表单数据




## 过滤器
## 内置指令
## 自定义指令
需求1：定义一个v-big指令，和v-text功能类似，但会把绑定的数值放大10倍。

需求2：定义一个v-fbind指令，和v-bind功能类似，但可以让其所绑定的input元素默认获取焦点。

自定义指令总结：

一、定义语法：

(1).局部指令：

new Vue({ new Vue({

directives:{指令名:配置对象} 或 directives{指令名:回调函数}

}) })

(2).全局指令：

Vue.directive(指令名,配置对象) 或 Vue.directive(指令名,回调函数)

  

二、配置对象中常用的3个回调：

(1).bind：指令与元素成功绑定时调用。

(2).inserted：指令所在元素被插入页面时调用。

(3).update：指令所在模板结构被重新解析时调用。

  

三、备注：

1.指令定义时不加v-，但使用时要加v-；

2.指令名如果是多个单词，要使用kebab-case命名方式，不要用camelCase命名。
生命周期

## 生命周期
生命周期：

1.又名：生命周期回调函数、生命周期函数、生命周期钩子。

2.是什么：Vue在关键时刻帮我们调用的一些特殊名称的函数。

3.生命周期函数的名字不可更改，但函数的具体内容是程序员根据需求编写的。

4.生命周期函数中的this指向是vm 或 组件实例对象。

mounted
//Vue完成模板的解析并把初始的真实DOM元素放入页面后（挂载完毕）调用mounted

挂载

更新

销毁

非单文件组件

单文件组件

## Vue
| 指令      | 简写  | 描述         |
| ------- | --- | ---------- |
| v-text  |     | 普通文本       |
| v-model |     | 双向绑定       |
| v-html  |     | 真正的html    |
| v-on    | @   | 绑定事件       |
| v-show  |     |            |
| v-if    |     |            |
| v-for   |     |            |
| v-bind  | :   | 作用在html属性上 |


## 脚手架开发
`main.js` 是项目的入口

`render`函数完成了这个功能：将App组件放入容器中

App.vue

vue.config.js
vue inspect > output.js
npm  类似于`mavne`，是js依赖包的管理工具
`packege.json`  类似与maven 项目中的pom.xml  定义了项目的依赖等信息
```json
{  
  "name": "projectname",  
  "version": "1.0.0",  
  "description": "",  
  "main": "index.js",  
  "scripts": {  
    "test": "echo \"Error: no test specified\" && exit 1"  },  
  "keywords": [],  
  "author": "",  
  "license": "ISC",  
  "dependencies": {  
    "jquery": "^3.6.1"  
  }  
}
```
## ref属性

## props配置

## mixin混入

## 插件
```js
export default {

install(Vue,x,y,z){

console.log(x,y,z)

//全局过滤器

Vue.filter('mySlice',function(value){
return value.slice(0,4)
})

//定义全局指令
Vue.directive('fbind',{
//指令与元素成功绑定时（一上来）
bind(element,binding){
element.value = binding.value
},

//指令所在元素被插入页面时

inserted(element,binding){

element.focus()

},

//指令所在的模板被重新解析时

update(element,binding){

element.value = binding.value

}

})

  

//定义混入

Vue.mixin({

data() {

return {

x:100,

y:200

}

},

})

//给Vue原型上添加一个方法（vm和vc就都能用了）
Vue.prototype.hello = ()=>{alert('你好啊')}

}

}
```

## scpoed

## 本地存储
```js
localStorage.setItem
localStorage.getItem

sessionStorage.setItem
sessionStorage.getItem
```
## 组件自定义事件

## 全局事件总线
```javascript
//创建vm
new Vue({
	el:'#app',
	render: h => h(App),
	beforeCreate() {
		Vue.prototype.$bus = this //安装全局事件总线
	},

})
```

在组件上定义$on 和 $emit方法进行数据传输
## 消息发布与订阅
消息订阅与发布 `pubsub-js`

## 配置代理服务器

### 方法一
```json
// vue.config.js
{	
//开启代理服务器（方式一）
	devServer: {	
	proxy: 'http://localhost:5000'
	}
}
```
### 方法二

```json
// vue.config.js
{
	//开启代理服务器（方式二）
	devServer: {
		proxy: {
			'/atguigu': {	
			target: 'http://localhost:5000',		
			pathRewrite:{'^/atguigu':''},			
		// ws: true, //用于支持websocket		
		// changeOrigin: true //用于控制请求头中的host值		
		},		
		'/demo': {		
		target: 'http://localhost:5001',	
		pathRewrite:{'^/demo':''},		
		// ws: true, //用于支持websocket		
		// changeOrigin: true //用于控制请求头中的host值	
			}
		}
	
	}
}
```

vue-resource   


## 插槽

### 作用

### 分类

### 使用方式

默认插槽
```
<slot>
```
具名插槽

作用域插槽

## Vuex
dispatch
action  用于响应组件中的动作
action中调用commit
mutation  用于操作数据（state）
state  用于存储数据

## 路由
## Axios




