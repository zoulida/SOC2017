package Threads;

class JoinTest implements Runnable {
    public void run() {
        for (int i = 0; i < 3; i++) {
            System.out.println(Thread.currentThread().getName());
        }
    }
 
    public static void main(String[] args) {
        JoinTest he = new JoinTest();
        Thread demo = new Thread(he,"�߳�");
        demo.start();
        for(int i=0;i<50;++i){
            if(i>10){
                try{
                    demo.join();  //ǿ��ִ��demo
                }catch (Exception e) {
                    e.printStackTrace();
                }
            }
            System.out.println("main �߳�ִ��-->"+i);
        }
    }
}