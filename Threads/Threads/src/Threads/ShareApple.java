package Threads;

/***
 * ��ϰ:
 * 1. ��д��һ���̰߳�ȫ��ʾ������
 * 2. ʹ��ͬ����������̰߳�ȫ������. 
 *
 */

public class ShareApple implements Runnable{
	
	private int appleCount = 5;
	
	//��ƻ��
	 boolean getApple(){
		
		//String str = new String("abc");
		
//		synchronized (this) {
		
			if(appleCount > 0){
				
				appleCount--;
				
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				
				System.out.println(Thread.currentThread().getName() 
						+ "������һ��ƻ��. ��ʣ�� " + appleCount + " ��ƻ��. ");
				return true;
			}
			
			return false;
//		}
	}
	
	//�߳���
	@Override
	public void run() {
		boolean flag = getApple();
		while(flag){
			flag = getApple();
		}
		
		System.out.println(Thread.currentThread().getName() + "�߳̽�����");
	}
	
	public static void main(String[] args) {
		
		ShareApple shareApple = new ShareApple();
		
		Thread th1 = new Thread(shareApple);
		Thread th2 = new Thread(shareApple);
		
		th1.setName("С��");
		th2.setName("Сǿ");
		
		th2.start();
		th1.start();
		
	}
	
}
