package Threads;

import java.util.concurrent.LinkedBlockingQueue;

public class ProducerConsumerblock {
    // 建立一个阻塞队列
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
                    // 取出一个对象
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
                    // 取出一个对象
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