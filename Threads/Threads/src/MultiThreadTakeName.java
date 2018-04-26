
import java.io.File;    
  
/**  
 * @author yinxm  
 * @version 1.0 2005/06/17  
 *   
 * This class can take file's path and file's name;  
 * you must give the path where you want to take the file.  
 */  
public class MultiThreadTakeName implements Runnable{    
	String pathA;
	

	public MultiThreadTakeName(String path) {
		// TODO Auto-generated constructor stub
    	this.setPathA(path);
	}

	public MultiThreadTakeName() {
		// TODO Auto-generated constructor stub
	}

	public String getPathA() {
		return pathA;
	}

	public void setPathA(String pathA) {
		this.pathA = pathA;
	}

	public static void main(String[] args) {   
        // This is the path where the file's name you want to take.   
    	long startTime=System.currentTimeMillis(); 
        String path = "e://";   
        MultiThreadTakeName tp = new MultiThreadTakeName();
        tp.getFile(path);   
        Time.setEndTime(System.currentTimeMillis());
        
        while(Time.getCountThread() > 0){
        	try {
        		
                Thread.sleep(1000);
                System.out.println("当前线程数量为：   " + Time.getCountThread());
            } catch (InterruptedException e) {
                e.printStackTrace(); 
            }
        }
        long time=Time.getEndTime()-startTime;
        System.out.println("所用时间： "+time+"ms");
    }   
       
    private  void getFile(String path){   
        // get file list where the path has   
        File file = new File(path);   
        // get the folder list   
        File[] array = file.listFiles();   
          
        for(int i=0;i<array.length;i++){   
            if(array[i].isFile()){   
                // only take file name   
                System.out.println("^^^^^" + array[i].getName());   
                // take file path and name    
                //System.out.println("#####" + array[i]);   
                // take file path and name   
                //System.out.println("*****" + array[i].getPath());   
                
            }else if(array[i].isDirectory()){   
                try {
                	//setPathA(array[i].getPath());
                	 Thread thread1 = new Thread( new MultiThreadTakeName(array[i].getPath()));
                	 thread1.start();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
				}   
            }   
        }   
    }

	@Override
	public void run() {
		// TODO Auto-generated method stub
		Time.addCountThread();
		try {
			getFile(getPathA());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Time.setEndTime(System.currentTimeMillis());
			Time.reduceCountThread();
		}
		
		
	}   
}