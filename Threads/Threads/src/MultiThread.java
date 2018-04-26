

import java.io.File;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;

public class MultiThread implements Runnable{
		// ��ű����Ľ��
		BlockingQueue<File> bFile = null;
		File file = null;

		public MultiThread(BlockingQueue<File> bFile, File file) {
			this.bFile = bFile;
			this.file = file;
		}
		
		@Override
		public void run() {
			getFileName(file.listFiles());
		}
		
		private final void getFileName(File[] fileDirectory) {
			for (File file : fileDirectory) {
				if (file.isDirectory()) {
					getFileName(file.listFiles());
				} else {
					System.out.println(file.getName());
					bFile.add(file);
				}
			}
		}

	public static void main(String[] args) throws InterruptedException {
		BlockingQueue<File> bFile = new LinkedBlockingQueue<File>();
		File file = new File("e://");
		// �̳߳�
		ExecutorService es = Executors.newCachedThreadPool();
		
		long start = System.currentTimeMillis();
		for (File f : file.listFiles()) {
			if (f.isDirectory()) {
				es.execute(new MultiThread(bFile, f));
			} else {
				System.out.println(f.getName());
				bFile.add(f);
			}
		}
		// �ر��̳߳�
		es.shutdown();
		
		while(true){
			if(Thread.activeCount()==1)
				break;
		}
		
		long end = System.currentTimeMillis();
		System.out.println("Time:" + (end - start)+ "ms");
	}

}
