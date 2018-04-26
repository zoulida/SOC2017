

import java.io.File;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
public class SingleThread {

	BlockingQueue<File> bFile = new LinkedBlockingQueue<File>();

	public void getFileName(File[] fileDirectory) {
		for (File file : fileDirectory) {
			if (file.isDirectory()) {
				// 继续迭代处理
				getFileName(file.listFiles());
			} else {
				// 输出文件的名称
				System.out.println(file.getName());
				bFile.add(file);
			}
		}
	}

	public static void main(String[] args) throws Exception {
		SingleThread st = new SingleThread();
		File file = new File("e://");

		long start = System.currentTimeMillis();
		try {
			st.getFileName(file.listFiles());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		long end = System.currentTimeMillis();
		System.out.println("Time:" + (end - start)+ "ms");
	}
}
