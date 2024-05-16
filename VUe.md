
**学习 Vue 之前需要掌握的 JavaScript 基础知识**

ES6 语法规范

- ·`let const`
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

# VUE

模版语法

数据绑定

el 和 data 的两种写法
理解mvvm
数据代理
事件处理
计算属性
监听属性
绑定样式
绑定class样式
绑定style样式
生命周期

挂载

更新

销毁
条件渲染
列表渲染
深度监视
Vue.set
收集表单数据

条件渲染
列表过滤
key的作用和原理

```html
<li v-for:"(p,index) in persons" :key="p.id">
	{{p.name}} --- {{p.age}}
<li>
```

列表过滤

过滤器
内置指令
自定义指令
生命周期

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
main.js 是项目的入口

render函数完成了这个功能：将App组件放入容器中

App.vue

vue.config.js
npm
packege.json

## ref属性

## props配置

## mixin混入

## 插件

## scpoed

## 组件自定义事件

## 全局事件总线

## 消息发布与订阅
消息订阅与发布 `pubsub-js`

## 配置代理服务器
```json
// vue.config.js
{
	//开启代理服务器（方式一）
	
	/* devServer: {
	
	proxy: 'http://localhost:5000'
	
	}, */

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

## 插槽

## 路由
## axios




