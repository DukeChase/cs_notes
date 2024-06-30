
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
`{{msg}}`
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
model
view
model-view
## 数据代理

## 事件处理
1. 使用`v-on:xxx` 或 `@xxx `绑定事件，其中`xxx`是事件名；
2. 事件的回调需要配置在`methods`对象中，最终会在vm上；
3. `methods`中配置的函数，不要用箭头函数！否则this就不是vm了；
4. `methods`中配置的函数，都是被Vue所管理的函数，this的指向是vm 或 组件实例对象；
5. `@click="demo"` 和 `@click="demo($event)"` 效果一致，但后者可以传参；
## 计算属性

计算属性：
1. 定义：要用的属性不存在，要通过已有属性计算得来。
2. 原理：底层借助了`Objcet.defineproperty`方法提供的`getter`和`setter`。
3. get函数什么时候执行？
	1. 初次读取时会执行一次。
	2. 当依赖的数据发生改变时会被再次调用。
4. 优势：与methods实现相比，内部有缓存机制（复用），效率更高，调试方便。
5. 备注：
	1. 计算属性最终会出现在vm上，直接读取使用即可。
	2. 如果计算属性要被修改，那必须写set函数去响应修改，且set中要引起计算时依赖的数据发生改变
	
```js
const vm = new Vue({
	el:'#root',
	data:{
		firstName:'张',
		lastName:'三',
	},

computed:{
	//完整写法
	/* fullName:{
	get(){
	console.log('get被调用了')
	return this.firstName + '-' + this.lastName
	},
	set(value){
	console.log('set',value)
	const arr = value.split('-')
	this.firstName = arr[0]
	this.lastName = arr[1]
	}
	} */
	//简写
	fullName(){
		console.log('get被调用了')
		return this.firstName + '-' + this.lastName
		}
	}
})
```

## 监视属性
监视属性watch：
1. 当被监视的属性变化时, 回调函数自动调用, 进行相关操作
2. 监视的属性必须存在，才能进行监视！！
3. 监视的两种写法：
	1. new Vue时传入watch配置
	2. 通过vm.$watch监视

```js
const vm = new Vue({
	el:'#root',
	data:{
		isHot:true,
	},
	computed:{
	info(){
		return this.isHot ? '炎热' : '凉爽'
	}
	},

	methods: {
		changeWeather(){
		this.isHot = !this.isHot
		}
	},
	/* watch:{
		isHot:{
			immediate:true, //初始化时让handler调用一下
			//handler什么时候调用？当isHot发生改变时。
			handler(newValue,oldValue){
			console.log('isHot被修改了',newValue,oldValue)
			}
		}
	} */
})
vm.$watch('isHot',{
	immediate:true, //初始化时让handler调用一下
	//handler什么时候调用？当isHot发生改变时。
	handler(newValue,oldValue){
	console.log('isHot被修改了',newValue,oldValue)
}

})
```
watch
deep
immediate
深度监视
## 绑定样式

1. class样式
	写法`:class="xxx"` xxx可以是字符串、对象、数组。
	字符串写法适用于：类名不确定，要动态获取。
	对象写法适用于：要绑定多个样式，个数不确定，名字也不确定。
	数组写法适用于：要绑定多个样式，个数确定，名字也确定，但不确定用不用。
2. style样式

`:style="{fontSize: xxx}"` 其中xxx是动态值。

`:style="[a,b]"` 其中a、b是样式对象。

## 条件渲染
`v-if`
`v-show`
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

Vue监视数据的原理：

1. vue会监视data中所有层次的数据。
2. 如何监测对象中的数据？
	1. 通过setter实现监视，且要在new Vue时就传入要监测的数据。
		(1).对象中后追加的属性，Vue默认不做响应式处理
		(2).如需给后添加的属性做响应式，请使用如下API：
		`Vue.set(target，propertyName/index，value)` 或	
		`vm.$set(target，propertyName/index，value)`
3. 如何监测数组中的数据？
	通过包裹数组更新元素的方法实现，本质就是做了两件事：
	(1).调用原生对应的方法对数组进行更新。
	(2).重新解析模板，进而更新页面。
4. 在Vue修改数组中的某个元素一定要用如下方法：
	1. 使用这些API:`push()、pop()、shift()、unshift()、splice()、sort()、reverse()`
	2. `Vue.set() `或 `vm.$set()`

特别注意：Vue.set() 和 vm.$set() 不能给vm 或 vm的根数据对象 添加属性！！！

## 收集表单数据


## 过滤器
定义：对要显示的数据进行特定格式化后再显示（适用于一些简单逻辑的处理）。
语法：
1. 注册过滤器：`Vue.filter(name,callback)` 或 `new Vue{filters:{}}`
2. 使用过滤器：`{{ xxx | 过滤器名}} 或 v-bind:属性 = "xxx | 过滤器名"`
备注：
1. 过滤器也可以接收额外参数、多个过滤器也可以串联
2. 并没有改变原本的数据, 是产生新的对应的数据
## 内置指令
v-text
v-html
v-clock
v-once
v-pre
## 自定义指令

需求1：定义一个v-big指令，和v-text功能类似，但会把绑定的数值放大10倍。
需求2：定义一个v-fbind指令，和v-bind功能类似，但可以让其所绑定的input元素默认获取焦点。

自定义指令总结：
一、定义语法：
(1).局部指令：
```js
new Vue({ new Vue({

directives:{指令名:配置对象} 或 directives{指令名:回调函数}

}) })
```
(2).全局指令：
```js
Vue.directive(指令名,配置对象) 或 Vue.directive(指令名,回调函数)
```

二、配置对象中常用的3个回调：

(1).bind：指令与元素成功绑定时调用。
(2).inserted：指令所在元素被插入页面时调用。
(3).update：指令所在模板结构被重新解析时调用。

三、备注：
1. 指令定义时不加v-，但使用时要加v-；
2. 指令名如果是多个单词，要使用kebab-case命名方式，不要用camelCase命名。
生命周期

## 生命周期
生命周期：
1. 又名：生命周期回调函数、生命周期函数、生命周期钩子。
2. 是什么：Vue在关键时刻帮我们调用的一些特殊名称的函数。
3. 生命周期函数的名字不可更改，但函数的具体内容是程序员根据需求编写的。
4. 生命周期函数中的`this`指向是`vm` 或 组件实例对象`vc`。

- 初始化显示
	- beforeCreate
	- created
	- beforeCreated
	- mounted
- 更新状态
	- beforeUpdate
	- updated
- 销毁
	- beforeDestroy
	- destroyed
`mounted` //Vue完成模板的解析并把初始的真实DOM元素放入页面后（挂载完毕）调用mounted

```js
new Vue({
            el:'#root',
            // template:`
            //  <div>
            //      <h2>当前的n值是：{{n}}</h2>
            //      <button @click="add">点我n+1</button>
            //  </div>
            // `,
            data:{
                n:1
            },
            methods: {
                add(){
                    console.log('add')
                    this.n++
                },
                bye(){
                    console.log('bye')
                    this.$destroy()
                }
            },
            watch:{
                n(){
                    console.log('n变了')
                }
            },
            beforeCreate() {
                console.log('beforeCreate')
            },

            created() {
                console.log('created')
            },
            beforeMount() {
                console.log('beforeMount')
            },
            mounted() {
                console.log('mounted')
            },
            beforeUpdate() {
                console.log('beforeUpdate')
            },
            updated() {
                console.log('updated')
            },
            beforeDestroy() {
                console.log('beforeDestroy')
            },
            destroyed() {
                console.log('destroyed')
            },
        })
```
常用的生命周期钩子：
1. `mounted:` 发送ajax请求、启动定时器、绑定自定义事件、订阅消息等【初始化操作】。
2. `beforeDestroy`: 清除定时器、解绑自定义事件、取消订阅消息等【收尾工作】。

关于销毁Vue实例
1. 销毁后借助Vue开发者工具看不到任何信息。
2. 销毁后自定义事件会失效，但原生DOM事件依然有效。
3. 一般不会在`beforeDestroy`操作数据，因为即便操作数据，也不会再触发更新流程了。

# 第2章 组件化编程
## 非单文件组件

## 单文件组件
- 组成
	- 模版 template
	- js
	- 样式css

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
|         |     |            |


# 第3章 使用Vue脚手架
## 脚手架开发
初始化脚手架
`npm install -g @vue/cli`
`vue create projectname`
`npm run serve`
`npm inspect -> output.js
`
模版项目结构
![](https://duke-1258882975.cos.ap-guangzhou.myqcloud.com/picture/202406291050014.png)
`main.js` 是项目的入口

`render`函数完成了这个功能：将App组件放入容器中

App.vue

vue.config.js
vue inspect > output.js
npm  类似于`maven`，是js依赖包的管理工具
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
在模版标签内 添加`ref`属性   给节点打标签
在vm实例内部可以通过`this.$refs.name`获得真实的dom对象或组件实例对象。
## props配置
子组件接收props的几种方式
```js
		//简单声明接收
        // props:['name','age','sex']
        //接收的同时对数据进行类型限制
        /* props:{
            name:String,
            age:Number,
            sex:String
        } */
        //接收的同时对数据：进行类型限制+默认值的指定+必要性的限制
        props:{
            name:{
                type:String, //name的类型是字符串
                required:true, //name是必要的
            },
            age:{
                type:Number,
                default:99 //默认值
            },
            sex:{
                type:String,
                required:true
            }
        }
```

## mixin混入
1. 功能：可以把多个组件共用的配置提取成一个混入对象
2. 使用方式：
    - 第一步定义mixin混合：
    ```
    {
        data(){....},
        methods:{....}
        ....
    }
    ```
    - 第二步使用混入：    
	    ​ 全局混入：`Vue.mixin(xxx)`​ 局部混入：`mixins:['xxx']`

## 插件
1. Vue 插件是一个包含 install 方法的对象
2. 通过 install 方法给 Vue 或 Vue 实例添加方法, 定义全局指令等
plugin.js
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

```js
import plugins from './plugins'
Vue.use(plug)
```

todo案例


组件化编码流程（通用）
1. 实现静态组件：抽取组件，使用组件实现静态页面效果
2. 展示动态数据
	1. 数据的类型、名称是什么
	2. 数据存储在哪个组件
3. 交互--从绑定事件监听开始
## scpoed

## 本地存储
```js
localStorage.setItem
localStorage.getItem

sessionStorage.setItem
sessionStorage.getItem
```
## 组件自定义事件
绑定事件监听
```js
<Header @addTodo="addTodo"/>

或者

<Header ref="header"/> 
this.$refs.header.$on('addTodo', this.addTodo)
```
触发事件
`this.$emit('addTodo', todo)`
## 全局事件总线
1. Vue 原型对象上包含事件处理的方法
	1.  $on(eventName, listener): 绑定自定义事件监听
	2. $emit(eventName, data): 分发自定义事件
	3. $off(eventName): 解绑自定义事件监听
	4. $once(eventName, listener): 绑定事件监听, 但只能处理一次
2. 所有组件实例对象的原型对象的原型对象就是 Vue 的原型对象
	1. 所有组件对象都能看到 Vue 原型对象上的属性和方法
	2. `Vue.prototype.$bus = new Vue()`, 所有的组件对象都能看到`$bus` 这个属性 对象
3. 全局事件总线
	1. 包含事件处理相关方法的对象(只有一个)
	2. 所有的组件都可以得到

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

在组件上定义`$on` 和 `$emit`方法进行数据传输
指定事件总线对象
```js
new Vue({
	beforeCreate () { // 尽量早的执行挂载全局事件总线对象的操作 
	Vue.prototype.$globalEventBus = this 
	}, 
}).$mount('#root')
```
绑定事件
```js
this.$globalEventBus.$on('deleteTodo', this.deleteTodo)
```
分发时间
```js
this.$globalEventBus.$emit('deleteTodo', this.index)
```
解绑事件
```js
this.$globalEventBus.$off('deleteTodo')
```
## 消息发布与订阅
消息订阅与发布 `pubsub-js`

# 第4章 Vue中的ajax
## 配置代理服务器
解决浏览器 跨域问题

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
父组件向子组件传递带数据的标签，当一个组件有不确定的结构时, 就需要使用 slot 技术，注意：插槽内容是在父组件中编译后, 再传递给子组件的。
### 分类

### 使用方式

默认插槽
```
<slot>
```
具名插槽

作用域插槽

# 第5章 Vuex

概念：专门在 Vue 中实现集中式状态（数据）管理的一个 Vue 插件，对 vue 应 用中多个组件的共享状态进行集中式的管理（读/写），也是一种组件间通信的方 式，且适用于任意组件间通信。

什么时候用Vuex
1. 多个组件依赖于同一状态
2. 来自不同组件的行为需要变更同一状态

Vuex工作原理图
![](https://duke-1258882975.cos.ap-guangzhou.myqcloud.com/picture/202406291119772.png)

1. `state`  用于存储数据
2. `action`中调用`commit`
3. `mutation`  用于操作数据（state）

`dispatch`
`action`  用于响应组件中的动作

getters
mapState
mapGettes
mapActions
mapMutations


模块化+命名空间


# 第 6 章：vue-router
## 6.1 相关理解
### 6.1.1 vue-router 的理解

vue 的一个插件库，专门用来实现 SPA 应用
### 6.1.2 对 SPA 应用的理解

1. 单页 Web 应用（single page web application，SPA）。
2. 整个应用只有一个完整的页面。
3. 点击页面中的导航链接不会刷新页面，只会做页面的局部更新。
4. 数据需要通过 ajax 请求获取。
### 6.1.3 路由的理解
1. 什么是路由?
	1. 一个路由就是一组映射关系（key - value）
	2. key 为路径, value 可能是 function 或 component
2. 路由分类
	1. 后端路由：
		1.  理解：value 是 function, 用于处理客户端提交的请求。
		2. 工作过程：服务器接收到一个请求时, 根据请求路径找到匹配的函数 来处理请求, 返回响应数据。
	2. 前端路由：
		1. 理解：value 是 component，用于展示页面内容。
		2. 工作过程：当浏览器的路径改变时, 对应的组件就会显示。

## 基本路由
总结：编写使用路由的3步
1. 定义路由组件
2. 注册路由
3. 使用路由


相关 API：
1. `this.$router.push(path)`: 相当于点击路由链接(可以返回到当前路由界面)
2. `this.$router.replace(path)`: 用新路由替换当前路由(不可以返回到当前路由界面)
3. `this.$router.back()`: 请求(返回)上一个记录路由
4. `this.$router.go(-1)`: 请求(返回)上一个记录路由
5. `this.$router.go(1)`: 请求下一个记录路由
## Axios




