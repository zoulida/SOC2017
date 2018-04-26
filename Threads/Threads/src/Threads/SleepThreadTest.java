package Threads;

public class SleepThreadTest extends Thread{

	public static void main(String[] args) {
		new SleepThreadTest().start();
	}
	
	@Override
	public void run() {
		for(int i = 0; i < 100; i++){
			
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			System.out.println("每隔1秒打印一次。");
			System.out.println(getName() 
					+ ": " + i);
		}
	}
	
}
