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
        // 构造一个线程池
        ThreadPoolExecutor threadPool = new ThreadPoolExecutor(2, 4, 3, TimeUnit.SECONDS, new ArrayBlockingQueue<Runnable>(100),
                new ThreadPoolExecutor.DiscardOldestPolicy());

//        ThreadPoolExecutor(int corePoolSize, int maximumPoolSize, 
//        		long keepAliveTime, TimeUnit unit, 
//        		BlockingQueue workQueue, 
//        		RejectedExecutionHandler handler) 
//        		corePoolSize： 线程池维护线程的最少数量 
//        		maximumPoolSize：线程池维护线程的最大数量 
//        		keepAliveTime： 线程池维护线程所允许的空闲时间 
//        		unit： 线程池维护线程所允许的空闲时间的单位 
//        		workQueue： 线程池所使用的缓冲队列 
//        		handler： 线程池对拒绝任务的处理策略 
        
        for (int i = 1; i <= produceTaskMaxNumber; i++)
        {
            try
            {
                // 产生一个任务，并将其加入到线程池
                String task = "task@ " + i;
                System.out.println("put " + task);
                threadPool.execute(new ThreadPoolTask(task));

                // 便于观察，等待一段时间
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
 * 线程池执行的任务
 */
class ThreadPoolTask implements Runnable, Serializable
{
    private static final long serialVersionUID = 0;
    private static int consumeTaskSleepTime = 2000;
    // 保存任务所需要的数据
    private Object threadPoolTaskData;

    ThreadPoolTask(Object tasks)
    {
        this.threadPoolTaskData = tasks;
    }

    public void run()
    {
        // 处理一个任务，这里的处理方式太简单了，仅仅是一个打印语句
        System.out.println(Thread.currentThread().getName());
        System.out.println("start .." + threadPoolTaskData);

        try
        {
            // //便于观察，等待一段时间
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