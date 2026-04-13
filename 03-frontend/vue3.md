---
title: Vue 3
description: Vue 3 核心概念、组合式 API、响应式原理、组件系统等
tags:
  - vue3
  - frontend
  - javascript
date: 2024-03-21
---

# Vue 3

Vue 3 是 Vue.js 的最新主要版本，带来了全新的 Composition API、更好的性能和 TypeScript 支持。

## 为什么选择 Vue 3

- **更小的体积** — 运行时体积比 Vue 2 减少约 30%
- **更好的性能** — 虚拟 DOM 重写，编译时优化
- **Composition API** — 更好的逻辑复用和代码组织
- **更好的 TypeScript 支持** — 源码使用 TypeScript 重写
- **更灵活的架构** — 拆分了更多独立模块

## 核心概念

### 响应式系统

Vue 3 使用 Proxy 替代了 Vue 2 的 Object.defineProperty：

```javascript
import { reactive, ref, computed, watch } from 'vue'

// ref 用于基本类型
const count = ref(0)
console.log(count.value) // 0
count.value++
console.log(count.value) // 1

// reactive 用于对象
const state = reactive({
  name: 'Vue 3',
  version: '3.4+'
})

// computed 计算属性
const doubleCount = computed(() => count.value * 2)

// watch 监听
watch(count, (newVal, oldVal) => {
  console.log(`count changed from ${oldVal} to ${newVal}`)
})
```

### 组合式 API (Composition API)

组合式 API 允许我们将相关逻辑组织在一起：

```javascript
import { ref, onMounted, onUnmounted } from 'vue'

// 鼠标位置示例
export default {
  setup() {
    const x = ref(0)
    const y = ref(0)

    function updatePosition(e) {
      x.value = e.clientX
      y.value = e.clientY
    }

    onMounted(() => {
      window.addEventListener('mousemove', updatePosition)
    })

    onUnmounted(() => {
      window.removeEventListener('mousemove', updatePosition)
    })

    // 返回的值可以在模板中使用
    return { x, y }
  }
}
```

### Script Setup

`<script setup>` 是使用组合式 API 的简化语法：

```vue
<script setup>
import { ref, computed } from 'vue'

const props = defineProps({
  title: String
})

const emit = defineEmits(['update', 'delete'])

// 响应式状态
const count = ref(0)

// 计算属性
const doubled = computed(() => count.value * 2)

// 方法
function increment() {
  count.value++
  emit('update', count.value)
}

// 可以直接返回函数
defineExpose({ count, increment })
</script>

<template>
  <div>
    <h1>{{ props.title }}</h1>
    <p>Count: {{ count }}</p>
    <p>Doubled: {{ doubled }}</p>
    <button @click="increment">Increment</button>
  </div>
</template>
```

## 生命周期钩子

| Vue 2 | Vue 3 Composition API |
|-------|----------------------|
| `created` | `setup()` |
| `mounted` | `onMounted` |
| `updated` | `onUpdated` |
| `destroyed` | `onUnmounted` |
| `beforeCreate` | - |
| `beforeMount` | `onBeforeMount` |
| `beforeUpdate` | `onBeforeUpdate` |
| `beforeUnmount` | `onBeforeUnmount` |

## 依赖注入

使用 `provide` 和 `inject` 实现跨组件通信：

```javascript
// 父组件
import { provide, ref } from 'vue'

export default {
  setup() {
    const theme = ref('dark')
    provide('theme', theme)
  }
}

// 子组件
import { inject } from 'vue'

export default {
  setup() {
    const theme = inject('theme')
    return { theme }
  }
}
```

## Teleport

Teleport 可以将组件渲染到 DOM 树的任意位置：

```vue
<teleport to="body">
  <div v-if="isModalOpen" class="modal">
    <h2>Modal Content</h2>
    <button @click="$emit('close')">Close</button>
  </div>
</teleport>
```

## Suspense

Suspense 用于处理异步组件加载状态：

```vue
<template>
  <Suspense>
    <template #default>
      <AsyncComponent />
    </template>
    <template #fallback>
      <div>Loading...</div>
    </template>
  </Suspense>
</template>
```

## 与 Vue 2 的主要区别

| 特性 | Vue 2 | Vue 3 |
|------|-------|-------|
| 响应式原理 | Object.defineProperty | Proxy |
| 组件类型 | 单文件组件 | 单文件组件 + Fragments |
| API 风格 | Options API | Composition API + Options API |
| 全局 API | Vue.set/delete | 需要使用 ES 模块 |
| 过滤器 | 支持 | 不推荐，使用 methods 替代 |
| 异步组件 | callback 方式 | Promise + Suspense |

## 常见问题

### 如何迁移 Vue 2 项目？

推荐使用 `vue-migration-helper` 工具辅助迁移：

```bash
npm install -g vue-migration-helper
vue-migration-helper src/
```

### ref 和 reactive 如何选择？

- **ref**：用于基本类型和需要 `.value` 访问的值
- **reactive**：用于对象和数组，更直观的响应式

### watch 和 watchEffect 的区别？

- `watch`：显式指定要监听的数据，只有数据变化时才执行
- `watchEffect`：自动收集依赖，依赖变化时立即执行

## 相关资源

- [Vue 3 官方文档](https://vuejs.org/)
- [[vue2|Vue 2]] — Vue 2 对比学习
- [[javascript|JavaScript 基础]]
- [[es6|ES6 新特性]]
