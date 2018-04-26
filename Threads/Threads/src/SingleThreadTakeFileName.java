
import java.io.File;    
  
/**  
 * @author yinxm  
 * @version 1.0 2005/06/17  
 *   
 * This class can take file's path and file's name;  
 * you must give the path where you want to take the file.  
 */  
public class SingleThreadTakeFileName {    
  
    public static void main(String[] args) {   
        // This is the path where the file's name you want to take.   
    	long startTime=System.currentTimeMillis(); 
        String path = "e://";   
        getFile(path);   
        long endTime=System.currentTimeMillis();
        long time=endTime-startTime;
        System.out.println("����ʱ�䣺 "+time+"ms");
    }   
       
    private static void getFile(String path){   
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
					getFile(array[i].getPath());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
				}   
            }   
        }   
    }   
}