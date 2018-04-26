package Threads;

/***
 * 练习:
 * 1. 编写出一个线程安全的示例代码
 * 2. 使用同步代码块解决线程安全的问题. 
 *
 */

public class ShareApple implements Runnable{
	
	private int appleCount = 5;
	
	//拿苹果
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
						+ "拿走了一个苹果. 还剩下 " + appleCount + " 个苹果. ");
				return true;
			}
			
			return false;
//		}
	}
	
	//线程体
	@Override
	public void run() {
		boolean flag = getApple();
		while(flag){
			flag = getApple();
		}
		
		System.out.println(Thread.currentThread().getName() + "线程结束了");
	}
	
	public static void main(String[] args) {
		
		ShareApple shareApple = new ShareApple();
		
		Thread th1 = new Thread(shareApple);
		Thread th2 = new Thread(shareApple);
		
		th1.setName("小明");
		th2.setName("小强");
		
		th2.start();
		th1.start();
		
	}
	
}
