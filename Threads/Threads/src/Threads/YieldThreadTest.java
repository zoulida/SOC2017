package Threads;

public class YieldThreadTest extends Thread{
	
	public static void main(String[] args) {
		
		Thread t1 = new YieldThreadTest("线程-1");
		Thread t2 = new YieldThreadTest("线程-2");
		
		t1.start();
		t2.start();
	}
	
	public YieldThreadTest(String name) {
		super(name);
	}
	
	@Override
	public void run() {
		for(int i = 0; i < 100; i++){
			System.out.println(getName() + ": " + i);
		
			if(i % 5 == 0){//运行到10的分门倍数让出CPU
				yield();
			}
		}
	}
	
}
