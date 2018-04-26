package com.atgugu.javase.lesson13;

/**
 * 关于线程:
 * 1. 在 Java 中, Thread 类代表一个线程. 
 * 
 * 2. 实现线程有 2 种方式:
 * 2.1 继承 Thread 类
 * 2.2 实现 Runnable 接口.
 * 
 * 3. 继承 Thread 类:
 * 3.1 必须重写 run() 方法: 里边放置的是实际的线程体。
 * 
 * 4. 启动线程:
 * 4.1 创建 Thread 对象
 * 4.2 调用 Thread 对象的 start() 方法启动线程. 而不是 run() 方法.
 * 
 * 5. 实现 Runnable 接口的方式:
 * 5.1 创建实现 Runnable 接口的实现类: 必须实现 run() 方法
 * 5.2 创建 5.1 对应的 Runnable 接口的实现类对象
 * 5.3 创建 Thread 对象, 利用 Thread(Runnable target)
 * 5.4 调用 Thread 类 start() 方法启动线程. 
 * 
 * 7. 线程安全的问题:
 * 7.1 理解并编写出线程不安全的示例代码: 多个线程访问一个共享的资源. 
 * 7.2 使用 synchronized 代码块解决线程安全的问题: 需要在 synchronized 代码块中
 * 参照共同的一个对象.
 * 
 * 6. 线程生命周期相关的几个方法(了解):
 * 6.1 yeild(): 若当前线程调用该方法, 则由执行状态变为可运行状态. 
 * 6.2 sleep(int mills): 使当前线程休眠一段时间. 以毫秒为单位
 * 6.3 join: 在一个线程中调用另外的线程的 join() 方法, 将使当前线程阻塞, 
 *           等待另一个线程执行完后再进入可执行状态.  
 * 6.4 interrupt(): 将解除线程的阻塞状态. 
 * 6.5 isAlive(): 可以判断当前线程是否处于可运行状态或运行状态.           
 * 
 * 8. 关于线程通信(了解):
 * 8.1 相关方法: wait(), notify(), notifyAll()
 * 8.2 这些方法在 同步方法中 调用. 
 * 
 */
public class ThreadTest {
	
	public static void main(String[] args) {
		
		System.out.println("开始执行");
		//1. 创建线程对象
		Thread thread = new FirstThread();
		
		//2. 调用线程对象的 start() 方法启动线程
		thread.start();
		
		String threadName = 
				Thread.currentThread().getName();
		for(int i = 0; i < 100; i++){
			System.out.println(threadName + "正在打印: " + i); 
		}
		System.out.println("执行完毕");
		
		
		
	}
	
}

class FirstThread extends Thread{
	
//	public FirstThread(String name) {
//		super(name);
//	}
	
	/**
	 * 线程体在 run() 方法中
	 */
	@Override
	public void run() {
		String threadName = 
				Thread.currentThread().getName();
		for(int i = 0; i < 100; i++){
			System.out.println(threadName + "正在打印:: " + i); 
		}
	}
	
}
