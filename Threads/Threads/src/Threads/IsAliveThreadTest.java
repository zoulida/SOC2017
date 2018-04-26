package Threads;

public class IsAliveThreadTest extends Thread{

	public static void main(String[] args) {
		
		Thread thread = new IsAliveThreadTest();
		
		System.out.println(thread.isAlive()); //false;
		
		thread.start();
		System.out.println(thread.isAlive()); //true
		
		try {
			thread.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		System.out.println(thread.isAlive()); //false
		
		//已经结束的线程, 再调用 start() 方法会抛出异常. 
		//thread.start();
		
	}
	
	@Override
	public void run() {
		for(int i = 0; i < 10; i++){
			System.out.println(i);
		}
	}
	
}
