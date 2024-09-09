# 第 6 章 接口、lambda与内部类

静态内部类


# 第 8 章 泛型程序设计
`ArrayList < String > files = new ArrayList<>();`

简单泛型类
```java
public class Pair<T>{
	T first;
	T second;
	public Pair () { first = null ; second = null ; } 
	public Pair (T first , T second ) {  
	this.first = first ; 
	this . second = second ; 
	}

	public T getFirst { return first ; } 
	public T getSecond { return second ; }

	public void setFirst ( T newValue ) { first = newValue ; } 
	public void setSecond ( T newValue ) { second = newValue ; }
}
```

泛型方法
```java
public static < T > T getMiddle ( T { return a [ a length / 2 ] ; }
```
# 第9章 集合
## 集合框架

Queue接口   `LinkedList ` `ArrayDeque`
Collection 接口
迭代器
泛型实用方法
## 具体的集合
链表
数组列表
散列集
树集
队列和双端队列
优先级队列

## 映射

基本映射操作
更新映射项
映射视图
弱散列映射
链接散列集与映射
枚举集与映射
标识散列映射

## 视图与包装器

## 算法

## 遗留的集合


# 第11章 事件处理

java.util.EventObject    事件对象

ActionEvent   WindowEvent