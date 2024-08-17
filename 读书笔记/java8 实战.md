

reference 《java8实战》

# 第三章 lambda表达式
## 3.2 在哪里以及如何使用lambda表达式
## 3.2.1 函数式接口

## 3.4 使用函数式接口

### 3.4.1 Predicate
```java
@FunctionalInterface
public interface Predicate<T>{
	boolean test(T t);
}
```
### 3.4.2 Consumer
```java
@FunctionalInterface

public interface Consumer<T>{

void accept(T t);

}
```

### 3.4.3 Function
```java
@FunctionalInterface

public interface Function<T, R>{

R apply(T t);

}
```

## 3.6 方法引用

### 3.6.1 
1. 指向静态方法的方法引用`Integer::parseInt`
2. 指 向 任意类型实例方法 的方法引用`String::length`
3. 指向现有对象的实例方法的方法引用`expensiveTransaction::getValue`

#### 3.6.2 构造函数引用
`Apple::new`

# 第4章 引入流

## 4.1 流是什么
```java
List<Dish> menu = Arrays.asList(

new Dish("pork", false, 800, Dish.Type.MEAT),

new Dish("beef", false, 700, Dish.Type.MEAT),

new Dish("chicken", false, 400, Dish.Type.MEAT),

new Dish("french fries", true, 530, Dish.Type.OTHER),

new Dish("rice", true, 350, Dish.Type.OTHER),

new Dish("season fruit", true, 120, Dish.Type.OTHER),

new Dish("pizza", true, 550, Dish.Type.OTHER),

new Dish("prawns", false, 300, Dish.Type.FISH),

new Dish("salmon", false, 450, Dish.Type.FISH) );
```

```java
public class Dish {

private final String name;

private final boolean vegetarian;

private final int calories;

private final Type type;

public Dish(String name, boolean vegetarian, int calories, Type type) {

this.name = name;

this.vegetarian = vegetarian;

this.calories = calories;

this.type = type;

}

public String getName() {

return name;

}

public boolean isVegetarian() {

return vegetarian;

}

public int getCalories() {

return calories;

}

public Type getType() {

return type;

}

@Override

public String toString() {

return name;

}
public enum Type { MEAT, FISH, OTHER }

}
```


## 4.4 流操作

中间操作



终端操作


# 第5章 使用流


streamAPI

## 5.1 筛选和切片
| 名字 | 方法名 | 作用 |
| ---- | ---- | ---- |
|  | filter | 筛选 |
|  | distinct | 筛选各异的元素 |
|  | limint | 截短流 |
|  | skip | 跳过元素 |
## 5.2 映射
| 名字 | 方法名 | 作用 |
| ---- | ---- | ---- |
|  | map | 对流中每一个元素应用函数 |
|  | flatMap | 流的扁平化 |
## 5.3查找和匹配
### 5.3.2 检查谓词是否匹配所有元素

| 名字 | 方法名 | 作用 |
| ---- | ---- | ---- |
|  | anyMatch | 检查谓词是否至少匹配一个元素 |
|  | allMatch |  |
|  | noneMath |  |
### 查找元素
| 名字 | 方法 | 作用 |
| ---- | ---- | ---- |
|  | findAny |  |
|  | findFirst |  |
## 5.4 规约
| 名字 | 方法 | 作用 |
| ---- | ---- | ---- |
|  | reduce |  |
`Optional<Integer> max = numbers.stream().reduce(Integer::max);`

# 第6章 用流搜集数据

## 6.5 收集器接口
`Collector`
```java
public interface Collector<T, A, R> {

	Supplier<A> supplier();
	
	BiConsumer<A, T> accumulator();
	
	Function<A, R> finisher();
	
	BinaryOperator<A> combiner();
	
	Set<Characteristics> characteristics();

}
```
- T是流中要收集的项目的泛型。 
- A是累加器的类型，累加器是在收集过程中用于累积部分结果的对象。
-  R是收集操作得到的对象（通常但并不一定是集合）的类型。
# 第9章 默认方法

接口中可以定义默认方法和静态方法。


# 第12章 新的日期和时间API

## 12.1 LocalDate、LocalTime、Instant、Duration 以及 Period

```java
LocalDate

LocalTime

LocalDateTime
```

## 12.2 操纵、解析和格式化日期

`Temporal`接口

`TemporalAdjuster`接口



格式化以及解析日期时间对象

`DateTimeFormatter`
```java
LocalDate.now();

LocalDate.parse();

localDate.format();
```

## 12.3 处理不同的时区和历法

