package Threads;

import java.util.concurrent.LinkedBlockingQueue;

public class ProducerConsumerblock {
    // ����һ����������
    private LinkedBlockingQueue<Object> queue = new LinkedBlockingQueue<Object>(10);

    public ProducerConsumerblock() {
    }

    public void start() {
        new Producer().start();
        new Consumer().start();
    }

    public static void main(String[] args) throws Exception {
        ProducerConsumerblock s3 = new ProducerConsumerblock();
        s3.start();
    }

    class Producer extends Thread {
        public void run() {
            while (true) {
                try {
                    Object o = new Object();
                    // ȡ��һ������
                    queue.put(o);
                    System.out.println("Producer: " + o);
                } catch (InterruptedException e) {
                    System.out.println("producer is interrupted!");
                }
                // }
            }
        }
    }

    class Consumer extends Thread {
        public void run() {
            while (true) {
                try {
                    // ȡ��һ������
                    Object o = queue.take();
                    System.out.println("Consumer: " + o);
                } catch (InterruptedException e) {
                    System.out.println("producer is interrupted!");
                }
                // }
            }
        }
    }

}