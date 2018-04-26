package Threads;

import java.io.IOException;

public class DaemonThread extends Thread {
    
    public DaemonThread() {
    }
    /** *//**
     * �̵߳�run�����������������߳�ͬʱ����
     * /* 
	 * �ػ��߳���û���û��߳̿ɷ���ʱ�Զ��뿪
	 * ��Java�бȽ�������߳��Ǳ���Ϊ�ػ���Daemon���̵߳ĵͼ����̡߳�
	 * ����߳̾�����͵����ȼ�������Ϊϵͳ�е�����������߳��ṩ����
	 * ��һ���û��߳�����Ϊ�ػ��̵߳ķ�ʽ�����̶߳��󴴽�֮ǰ�����̶߳����setDaemon������
	 * ���͵��ػ��߳�������JVM�е�ϵͳ��Դ�Զ������̣߳�
	 * ��������Ϥ��Java���������߳̾���һ�����͵��ػ��̣߳�
	 * �����ǵĳ����в������κ������е�Thread��
	 * ����Ͳ����ٲ�������������������Ҳ�����¿�����
	 * ���Ե����������߳���Java������Ͻ�ʣ���߳�ʱ��Java��������Զ��뿪�� 
	 * ��ʼ���ڵͼ����״̬�����У�����ʵʱ��غ͹���ϵͳ�еĿɻ�����Դ��
	 * �ػ����̣�Daemon���������ں�̨��һ��������̡��������ڿ����ն˲��������Ե�ִ��ĳ�������ȴ�����ĳЩ�������¼���
	 * Ҳ����˵�ػ��̲߳��������նˣ�����������ϵͳ����ϵͳ��ͬ����������
	 * ��Java���ػ��߳���ʲô���ӵ��ء�
	 * ��JVM�����е��̶߳����ػ��̵߳�ʱ��JVM�Ϳ����˳��ˣ�
	 * �������һ�������ϵķ��ػ��߳���JVM�����˳��� 
	 */
     
    public void run(){
        for(int i = 1; i <= 100; i++){
            try{
                Thread.sleep(100);
                
            } catch (InterruptedException ex){
                ex.printStackTrace();
            }
            System.out.println(i);
        }
    }
    public static void main(String [] args){
     DaemonThread test = new DaemonThread();
        test.setDaemon(true);
        test.start();
        System.out.println("isDaemon = " + test.isDaemon());
        try {
            System.in.read(); // �������룬ʹ�����ڴ�ͣ�٣�һ�����յ��û����룬main�߳̽������ػ��߳��Զ�����
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}