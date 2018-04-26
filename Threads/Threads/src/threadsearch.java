

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
public class threadsearch extends Thread {
	public static String t="";
	public static long time;
public	void run(){
	long startTime=System.currentTimeMillis(); 
	File file = new File(t); 
	 String [] names = file.list();
	 System.out.println(file.getAbsolutePath());
		System.out.println("file ---> ");
	 for(String name:names)
     {
         System.out.print(name+"   ");
     }
	 System.out.println();
	 File [] fs = file.listFiles();
     for(File a:fs)
     {
         if(a.isDirectory())
         {
         	t=a.getAbsolutePath();
         	new threadsearch().start();  
         }
      
     }
     long endTime=System.currentTimeMillis();
     time=endTime-startTime;
     System.out.println("所用时间： "+time+"ms");
	 }
	    public static void main(String[] args)
	    {
	    	System.out.println("曹殿磊 20141844301");
	    	long startTime=System.currentTimeMillis(); 
	    	t="C:\\";
	    	threadsearch xian=new threadsearch();
	    	xian.run();
	    	long endTime=System.currentTimeMillis();
	    	time=endTime-startTime;
	    }
}