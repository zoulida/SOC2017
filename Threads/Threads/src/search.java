
import java.io.*;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

import javax.xml.crypto.Data;
public class search {
	private static File[] fm;
	
	/*public static void main(String[] args){
		System.out.println("曹殿磊 20141844301");
		search se=new search();
		
		String key="12";
		System.out.println("输入文件路径");
		Scanner in=new Scanner(System.in);
		
		long startTime=System.currentTimeMillis(); 
		String files;
		files=in.next();
		File dir=new File(files);
		System.out.println("\nsearch key : " + key); 
		System.out.println("search results : "); 
		se.printAllinfo(dir);
		 long endTime=System.currentTimeMillis();
		System.out.println("所用时间： "+(endTime-startTime)+"ms");

	}*/
	public void printAllinfo(File dir){
		StringBuffer fileinfo=new StringBuffer();
		fm=dir.listFiles();
		for(File file:fm)
		{
			if(file.isFile()){
				fileinfo.append(file.getName()+"  ");
			}else if(file.isDirectory()){
				File dir1=new File(file.getAbsolutePath());
				this.printAllinfo(dir1);
			}
		}
		System.out.println(dir.getAbsolutePath());
		System.out.println("contains : "); 
		System.out.println("file ---> " + fileinfo); 
	}
}
