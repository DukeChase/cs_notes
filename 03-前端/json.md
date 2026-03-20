# json

## json schema

JSON Schema 是一种用于描述和验证 JSON 数据结构的规范。以下是编写 JSON Schema 的基本步骤和一个示例：

---

### **1. 基本结构**

一个 JSON Schema 通常包含以下关键字：

- `$schema`: 指定使用的 JSON Schema 版本（如 Draft-07、Draft-2020-12 等）
- `$id`: 模式的唯一标识符（可选）
- `title` 和 `description`: 描述模式的作用
- `type`: 定义数据类型（如 `object`, `string`, `number`, `array` 等）
- `properties`: 定义对象属性及其子模式
- `required`: 列出必须存在的属性
- 其他验证关键字（如 `minimum`, `maxLength`, `pattern` 等）

---

### **2. 示例**

假设要验证一个表示用户信息的 JSON 数据：

```json
{
  "id": 1,
  "name": "Alice",
  "email": "alice@example.com",
  "age": 30,
  "is_active": true,
  "roles": ["user", "admin"]
}
```

对应的 JSON Schema 可以是：

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "https://example.com/user.schema.json",
  "title": "User Profile",
  "description": "A user profile schema",
  "type": "object",
  "properties": {
    "id": {
      "type": "integer",
      "minimum": 1,
      "description": "Unique identifier"
    },
    "name": {
      "type": "string",
      "minLength": 2,
      "maxLength": 50
    },
    "email": {
      "type": "string",
      "format": "email"
    },
    "age": {
      "type": "number",
      "minimum": 0,
      "maximum": 150
    },
    "is_active": {
      "type": "boolean"
    },
    "roles": {
      "type": "array",
      "items": {
        "type": "string",
        "enum": ["user", "admin", "guest"]
      },
      "minItems": 1
    }
  },
  "required": ["id", "name", "email"]
}
```

---

### **3. 关键字段解释**

1. **类型验证**:
   - `type`: 定义数据类型（如 `string`, `number`, `object`, `array` 等）
   - `format`: 验证特定格式（如 `email`, `date-time`, `uri` 等）

2. **数值验证**:
   - `minimum`, `maximum`: 数值范围
   - `exclusiveMinimum`, `exclusiveMaximum`: 开区间范围

3. **字符串验证**:
   - `minLength`, `maxLength`: 字符串长度
   - `pattern`: 正则表达式匹配（例如 `"pattern": "^\\d{3}-\\d{2}-\\d{4}$"` 匹配社保号）

4. **数组验证**:
   - `items`: 定义数组元素的模式
   - `minItems`, `maxItems`: 数组长度限制
   - `uniqueItems`: 元素是否唯一（如 `true`）

5. **对象验证**:
   - `properties`: 定义对象的属性及其模式
   - `required`: 必须存在的属性列表
   - `additionalProperties`: 是否允许未定义的属性（如 `false` 表示禁止）

---

### **4. 嵌套对象和数组**

对于复杂结构，可以嵌套使用 `properties` 和 `items`：

```json
{
  "type": "object",
  "properties": {
    "address": {
      "type": "object",
      "properties": {
        "street": { "type": "string" },
        "city": { "type": "string" }
      },
      "required": ["street", "city"]
    }
  }
}
```

---

### **5. 验证工具**

使用以下工具验证 Schema 和 JSON 数据：

- 在线验证器：[https://www.jsonschemavalidator.net/](https://www.jsonschemavalidator.net/)
- 编程库：
  - JavaScript: `ajv`
  - Python: `jsonschema`
  - Java: `everit-json-schema`

---

通过以上步骤，你可以根据实际需求定义详细的 JSON Schema，确保数据符合预期格式。
