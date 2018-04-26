package Threads;

class JoinTest implements Runnable {
    public void run() {
        for (int i = 0; i < 3; i++) {
            System.out.println(Thread.currentThread().getName());
        }
    }
 
    public static void main(String[] args) {
        JoinTest he = new JoinTest();
        Thread demo = new Thread(he,"线程");
        demo.start();
        for(int i=0;i<50;++i){
            if(i>10){
                try{
                    demo.join();  //强制执行demo
                }catch (Exception e) {
                    e.printStackTrace();
                }
            }
            System.out.println("main 线程执行-->"+i);
        }
    }
}