package Threads;

public class TicketHouse implements Runnable {
	   int fiveAmount=1,tenAmount=0,twentyAmount=0; 
	   public void run() {
	      if(Thread.currentThread().getName().equals("张飞")) {
	          saleTicket(20);
	      }
	      else if(Thread.currentThread().getName().equals("李逵")) {
	          saleTicket(5);
	      }
	      if(Thread.currentThread().getName().equals("刘备")) {
	          saleTicket(5);
	      }
	   }
	   private synchronized void saleTicket(int money) {
	       if(money==5) {  //如果使用该方法的线程传递的参数是5,就不用等待
	        fiveAmount=fiveAmount+1; 
	        System.out.println( "给"+Thread.currentThread().getName()+"入场卷,"+
	                            Thread.currentThread().getName()+"的钱正好");
	       }
	       else if(money==20) {           
	         while(fiveAmount<3) {
	            try { System.out.println("\n"+Thread.currentThread().getName()+"靠边等...");
	                  wait();       //如果使用该方法的线程传递的参数是20须等待
	                  System.out.println("\n"+Thread.currentThread().getName()+"继续买票");
	            }
	            catch(InterruptedException e){}
	         }
	         fiveAmount=fiveAmount-3;
	         twentyAmount=twentyAmount+1;
	         System.out.println("给"+Thread.currentThread().getName()+"入场卷,"+
	                            Thread.currentThread().getName()+"给20，找赎15元");
	       }
	       notifyAll();
	   } 
	   
	   public static void main(String args[ ]) {
		      TicketHouse officer = new TicketHouse();
		      Thread zhangfei,likui,liubei;
		      zhangfei = new Thread(officer); 
		      zhangfei.setName("张飞");
		      likui = new Thread(officer);  
		      likui.setName("李逵");
		      liubei = new Thread(officer);  
		      liubei.setName("刘备");
		      zhangfei.start();
		      likui.start();
		      liubei.start();
		   }
}
