package Threads;

public class PriorityThreadTest extends Thread{

	public static void main(String[] args) {
		
		Thread th1 = new PriorityThreadTest("线程-1");
		Thread th2 = new PriorityThreadTest("线程-2");
		
		th1.setPriority(MIN_PRIORITY);
		th2.setPriority(MAX_PRIORITY);
		
		System.out.println("th1.getPriority() " + th1.getPriority());
		System.out.println("th2.getPriority() " + th2.getPriority()); 
		System.out.println("main.getPriority() " + Thread.currentThread().getPriority());
	
		
		
		th1.start();
		th2.start();
		
		for(int i = 0; i < 100; i++){
			System.out.println("main: " + i);
		}
	}
	
	public PriorityThreadTest(String name) {
		super(name);
	}
	
	@Override
	public void run() {
		for(int i = 0; i < 100; i++){
			System.out.println(getName() + ": " + i);
		}
	}
	
}
 