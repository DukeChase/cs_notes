**学习 Vue 之前需要掌握的 JavaScript 基础知识**

ES6 语法规范

- 解构赋值、模板字符串、箭头函数

ES6 模块化

- 默认暴露、分别暴露、统一暴露、import 、export

包管理器

- npm、yarn 或者是 cnpm

原型、原型链（重点）

数组常用方法

- 过滤数组、加工数组、筛选最值

axios

promise
模版语法

模版语法

数据绑定

el 和 data 的两种写法
理解mvvm

计算属性
监听属性
深度监视
Vue.set

绑定class样式
绑定style样式
条件渲染
列表过滤
key的作用和原理

```html
<li v-for:"(p,index) in persons" :key="p.id">
	{{p.name}} --- {{p.age}}
<li>
```

列表过滤


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


生命周期

挂载

更新

销毁

组件

vue脚手架

render函数
修改默认配置vueconfig.js

ref属性

props

mixin

插件

scoped

todo 案例

组件间通信
全局事件总线

消息订阅与发布pubsub-js