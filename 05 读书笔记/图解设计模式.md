
# 第2部分 交给子类

## 第3章 Template Method模式

```java
public abstract class AbstractDisplay{
	public abstract void open();
	public abstract void print();
	public abstract void close();
	public final void display(){
		open();
		for(int i=0;i<5;i++){
			print();
		}
		close();
	}
}
```


## 第 4 章  Factory Method 模式
```java

```
# 第3部分
## 第5章 singleton模式-只有一个示例
```java
public class Singleton{
	private static Singletom singleton = new Singleton();
	private Singleton(){
		Systom.out.println("genarate a new instance")
	}

	public static Singleton getInstacne(){
		return singleton;
	}
}
```

```java
public class Singleton {
    // Private constructor prevents instantiation from other classes
    private Singleton() {
        System.out.println("生成了一个实例。");
    }

    // Inner static class responsible for holding the Singleton instance
    private static class SingletonHelper {
        // The INSTANCE is created only when the SingletonHelper class is loaded
        private static final Singleton INSTANCE = new Singleton();
    }

    // Provides the global point of access to the Singleton instance
    public static Singleton getInstance() {
        return SingletonHelper.INSTANCE;
    }
}

```

# 第6部分 访问数据结构

## 第14章 责任链模式

```java
public class Trouble{
	private number;
	public Trouble(int number){
		this.number=number;
	}

	public getNumber(){
		return this.number;
	}

	public toString(){
		return "[Trouble " + number + "]";
	}

}
```

```java
public abstract class Support{
	private Stirng name;
	private Support next;
	public Support(String name){
		this.name = name;
	}
	public setNext(Support next){
		this.next=next;
		return next;
	}
	public final void support(Trouble trouble){
		if(resove(troule)){
			done(trouble)
		} else if (next!=null){
			next.support(trouble)
		} else{
			fail(trouble);
		}
	}

	public String toString(){
		retrun "[" + name + "]";
	}

	protected abstract boolean resolve(Trouble trouble){
	}

	protected done(Trouble trouble){
		System.out.println(trouble + " is resolved by " + this + ".")
	}

	protected fail(Trouble trouble){
		System.out.println(trouble + "cannot be resolved");
	}
}
```
