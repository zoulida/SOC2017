package com.atgugu.javase.lesson13;

public class PrintNumber {

	int i = 0;

	public static void main(String[] args) {
		
		PrintNumber printNumber = new PrintNumber();
		
		NumberThread thread1 = new NumberThread("�߳�-1", printNumber);
		NumberThread thread2 = new NumberThread("�߳�-2", printNumber);
		
		thread1.start();
		thread2.start();
		
	}
	
}

class NumberThread extends Thread{
	
	PrintNumber printNumber;
	
	public NumberThread(String threadName, PrintNumber printNumber) {
		super(threadName);
		this.printNumber = printNumber;
	}
	
	@Override
	public void run() {
		for(; printNumber.i < 100; printNumber.i++){
			System.out.println(getName() + ": " + printNumber.i);
		}
	}
	
}
