package Threads;

class interruptTEST implements Runnable {
    public void run() {
        System.out.println("ִ��run����");
        try {
            Thread.sleep(10000);
            System.out.println("�߳��������");
        } catch (Exception e) {
            System.out.println("���߱����");
            return;  //���ص�����ĵ��ô�
        }
        System.out.println("�߳�������ֹ");
    }
 
    public static void main(String[] args) {
        interruptTEST he = new interruptTEST();
        Thread demo = new Thread(he, "�߳�");
        demo.start();
        try{
            Thread.sleep(2000);
        }catch (Exception e) {
            e.printStackTrace();
        }
        demo.interrupt(); //2s���ж��߳�
    }
}
