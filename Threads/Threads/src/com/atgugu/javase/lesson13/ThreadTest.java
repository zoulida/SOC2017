package com.atgugu.javase.lesson13;

/**
 * �����߳�:
 * 1. �� Java ��, Thread �����һ���߳�. 
 * 
 * 2. ʵ���߳��� 2 �ַ�ʽ:
 * 2.1 �̳� Thread ��
 * 2.2 ʵ�� Runnable �ӿ�.
 * 
 * 3. �̳� Thread ��:
 * 3.1 ������д run() ����: ��߷��õ���ʵ�ʵ��߳��塣
 * 
 * 4. �����߳�:
 * 4.1 ���� Thread ����
 * 4.2 ���� Thread ����� start() ���������߳�. ������ run() ����.
 * 
 * 5. ʵ�� Runnable �ӿڵķ�ʽ:
 * 5.1 ����ʵ�� Runnable �ӿڵ�ʵ����: ����ʵ�� run() ����
 * 5.2 ���� 5.1 ��Ӧ�� Runnable �ӿڵ�ʵ�������
 * 5.3 ���� Thread ����, ���� Thread(Runnable target)
 * 5.4 ���� Thread �� start() ���������߳�. 
 * 
 * 7. �̰߳�ȫ������:
 * 7.1 ��Ⲣ��д���̲߳���ȫ��ʾ������: ����̷߳���һ���������Դ. 
 * 7.2 ʹ�� synchronized ��������̰߳�ȫ������: ��Ҫ�� synchronized �������
 * ���չ�ͬ��һ������.
 * 
 * 6. �߳�����������صļ�������(�˽�):
 * 6.1 yeild(): ����ǰ�̵߳��ø÷���, ����ִ��״̬��Ϊ������״̬. 
 * 6.2 sleep(int mills): ʹ��ǰ�߳�����һ��ʱ��. �Ժ���Ϊ��λ
 * 6.3 join: ��һ���߳��е���������̵߳� join() ����, ��ʹ��ǰ�߳�����, 
 *           �ȴ���һ���߳�ִ������ٽ����ִ��״̬.  
 * 6.4 interrupt(): ������̵߳�����״̬. 
 * 6.5 isAlive(): �����жϵ�ǰ�߳��Ƿ��ڿ�����״̬������״̬.           
 * 
 * 8. �����߳�ͨ��(�˽�):
 * 8.1 ��ط���: wait(), notify(), notifyAll()
 * 8.2 ��Щ������ ͬ�������� ����. 
 * 
 */
public class ThreadTest {
	
	public static void main(String[] args) {
		
		System.out.println("��ʼִ��");
		//1. �����̶߳���
		Thread thread = new FirstThread();
		
		//2. �����̶߳���� start() ���������߳�
		thread.start();
		
		String threadName = 
				Thread.currentThread().getName();
		for(int i = 0; i < 100; i++){
			System.out.println(threadName + "���ڴ�ӡ: " + i); 
		}
		System.out.println("ִ�����");
		
		
		
	}
	
}

class FirstThread extends Thread{
	
//	public FirstThread(String name) {
//		super(name);
//	}
	
	/**
	 * �߳����� run() ������
	 */
	@Override
	public void run() {
		String threadName = 
				Thread.currentThread().getName();
		for(int i = 0; i < 100; i++){
			System.out.println(threadName + "���ڴ�ӡ:: " + i); 
		}
	}
	
}
