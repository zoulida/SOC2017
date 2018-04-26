package Threads;

public class CopyOfTicketHouse implements Runnable{

	private int fiveCount = 1, tenCount = 0, twentyCount = 0;
	
	public synchronized void buy(){
		
		String name = Thread.currentThread().getName();
		
		//zf: 20 Ԫ
		if("zf".equals(name)){
			if(fiveCount < 3){
				
				try {
					System.out.println("5 Ԫ��ֵ: " + fiveCount + ", �ŷɱ���ȴ�.");
					wait();
					System.out.println("5 Ԫ��ֵ: " + fiveCount + ",��һ��Ʊ���ŷ�, ���� 15");
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				
			}
		}else if("gy".equals(name)){
			fiveCount++;
			System.out.println("��һ��Ʊ������. Ǯ����. 5 Ԫ��ֵ: " + fiveCount);
		}else if("lb".equals(name)){
			fiveCount++;
			System.out.println("��һ��Ʊ������. Ǯ����. 5 Ԫ��ֵ: " + fiveCount);
		}
		
		if(fiveCount == 3){
			notifyAll();			
		}
	}
	
	@Override
	public void run() {
		buy();
	}
	
	public static void main(String[] args) {
		
		Runnable runnable = new CopyOfTicketHouse();
		
		Thread th1 = new Thread(runnable);
		th1.setName("zf");
		
		Thread th2 = new Thread(runnable);
		th2.setName("gy");
		
		Thread th3 = new Thread(runnable);
		th3.setName("lb");
		
		th1.start();
		th2.start();
		th3.start();
		
	}
	
}
