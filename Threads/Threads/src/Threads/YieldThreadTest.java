package Threads;

public class YieldThreadTest extends Thread{
	
	public static void main(String[] args) {
		
		Thread t1 = new YieldThreadTest("�߳�-1");
		Thread t2 = new YieldThreadTest("�߳�-2");
		
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
		
			if(i % 5 == 0){//���е�10�ķ��ű����ó�CPU
				yield();
			}
		}
	}
	
}
