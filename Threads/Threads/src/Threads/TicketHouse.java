package Threads;

public class TicketHouse implements Runnable {
	   int fiveAmount=1,tenAmount=0,twentyAmount=0; 
	   public void run() {
	      if(Thread.currentThread().getName().equals("�ŷ�")) {
	          saleTicket(20);
	      }
	      else if(Thread.currentThread().getName().equals("����")) {
	          saleTicket(5);
	      }
	      if(Thread.currentThread().getName().equals("����")) {
	          saleTicket(5);
	      }
	   }
	   private synchronized void saleTicket(int money) {
	       if(money==5) {  //���ʹ�ø÷������̴߳��ݵĲ�����5,�Ͳ��õȴ�
	        fiveAmount=fiveAmount+1; 
	        System.out.println( "��"+Thread.currentThread().getName()+"�볡��,"+
	                            Thread.currentThread().getName()+"��Ǯ����");
	       }
	       else if(money==20) {           
	         while(fiveAmount<3) {
	            try { System.out.println("\n"+Thread.currentThread().getName()+"���ߵ�...");
	                  wait();       //���ʹ�ø÷������̴߳��ݵĲ�����20��ȴ�
	                  System.out.println("\n"+Thread.currentThread().getName()+"������Ʊ");
	            }
	            catch(InterruptedException e){}
	         }
	         fiveAmount=fiveAmount-3;
	         twentyAmount=twentyAmount+1;
	         System.out.println("��"+Thread.currentThread().getName()+"�볡��,"+
	                            Thread.currentThread().getName()+"��20������15Ԫ");
	       }
	       notifyAll();
	   } 
	   
	   public static void main(String args[ ]) {
		      TicketHouse officer = new TicketHouse();
		      Thread zhangfei,likui,liubei;
		      zhangfei = new Thread(officer); 
		      zhangfei.setName("�ŷ�");
		      likui = new Thread(officer);  
		      likui.setName("����");
		      liubei = new Thread(officer);  
		      liubei.setName("����");
		      zhangfei.start();
		      likui.start();
		      liubei.start();
		   }
}
