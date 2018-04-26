package com.atgugu.javase.lesson13;

public class JoinThreadTest extends Thread{
	
	public static void main(String[] args) {
		
		Thread thread1 = new JoinThreadTest();
		thread1.start();
		
		for(int i = 0; i < 100; i++){
			System.out.println(Thread.currentThread().getName()
					+ ": " + i);
			
			if(i == 10){//main执行到10就等待
				try {
					thread1.join();//
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	@Override
	public void run() {
		for(int i = 0; i < 100; i++){
			System.out.println(getName() 
					+ ": " + i);
		}
	}
	
	
}
