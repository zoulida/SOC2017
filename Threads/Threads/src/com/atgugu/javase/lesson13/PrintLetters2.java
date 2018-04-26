package com.atgugu.javase.lesson13;


public class PrintLetters2 implements Runnable{

	private char c = 'a';
	
	@Override
	public void run() {
		while(c <= 'z'){
			print();
		}
	}

	public synchronized void print(){
		if(c <= 'z'){
			System.out.println(Thread.currentThread().getName() 
					+ ": " + c);
			c++;
			
			notify();
			
			try {
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		
		Runnable runnable = new PrintLetters2();
		
		Thread th1 = new Thread(runnable);
		th1.setName("线程-1");
		
		Thread th2 = new Thread(runnable);
		th2.setName("线程-2");
		
		th1.start();
		th2.start();
		
	}

}
