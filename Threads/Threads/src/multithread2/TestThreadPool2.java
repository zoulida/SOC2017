package multithread2;

import java.io.Serializable;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class TestThreadPool2
{
    private static int produceTaskSleepTime = 2;
    private static int produceTaskMaxNumber = 100;

    public static void main(String[] args)
    {
        // ����һ���̳߳�
        ThreadPoolExecutor threadPool = new ThreadPoolExecutor(2, 4, 3, TimeUnit.SECONDS, new ArrayBlockingQueue<Runnable>(100),
                new ThreadPoolExecutor.DiscardOldestPolicy());

//        ThreadPoolExecutor(int corePoolSize, int maximumPoolSize, 
//        		long keepAliveTime, TimeUnit unit, 
//        		BlockingQueue workQueue, 
//        		RejectedExecutionHandler handler) 
//        		corePoolSize�� �̳߳�ά���̵߳��������� 
//        		maximumPoolSize���̳߳�ά���̵߳�������� 
//        		keepAliveTime�� �̳߳�ά���߳�������Ŀ���ʱ�� 
//        		unit�� �̳߳�ά���߳�������Ŀ���ʱ��ĵ�λ 
//        		workQueue�� �̳߳���ʹ�õĻ������ 
//        		handler�� �̳߳ضԾܾ�����Ĵ������ 
        
        for (int i = 1; i <= produceTaskMaxNumber; i++)
        {
            try
            {
                // ����һ�����񣬲�������뵽�̳߳�
                String task = "task@ " + i;
                System.out.println("put " + task);
                threadPool.execute(new ThreadPoolTask(task));

                // ���ڹ۲죬�ȴ�һ��ʱ��
                Thread.sleep(produceTaskSleepTime);
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
        threadPool.shutdown();
    }
}

/**
 * �̳߳�ִ�е�����
 */
class ThreadPoolTask implements Runnable, Serializable
{
    private static final long serialVersionUID = 0;
    private static int consumeTaskSleepTime = 2000;
    // ������������Ҫ������
    private Object threadPoolTaskData;

    ThreadPoolTask(Object tasks)
    {
        this.threadPoolTaskData = tasks;
    }

    public void run()
    {
        // ����һ����������Ĵ���ʽ̫���ˣ�������һ����ӡ���
        System.out.println(Thread.currentThread().getName());
        System.out.println("start .." + threadPoolTaskData);

        try
        {
            // //���ڹ۲죬�ȴ�һ��ʱ��
            Thread.sleep(consumeTaskSleepTime);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        threadPoolTaskData = null;
    }

    public Object getTask()
    {
        return this.threadPoolTaskData;
    }
}