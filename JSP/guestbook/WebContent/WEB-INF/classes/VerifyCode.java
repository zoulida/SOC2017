/*
 * ***************************************** 
 *   
 *  ˵����  	java����У���� 
 *  �ļ���:    	VerifyCode.java
 *
 *	���ߣ������껪
 *	Email:fanwsp@126.com
 *	HomePage:http://wsp.hniuca.net
 *  QQ:122142023 
 * 	CopyRight(c)2005-2006 by DreamTime 
 *
*/

package dreamtime.guestbook;			//ָ�������ڵİ�
import java.awt.*;						//������
import java.awt.image.*;
import java.util.*;
import javax.imageio.*;

//������

public class VerifyCode {
	static Random r = new Random();
	static String ssource = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"  + "abcdefghijklmnopqrstuvwxyz" + "0123456789";
	static char[] src = ssource.toCharArray();
	
	
	//��������ַ���
	
	private static String randString (int length){
		char[] buf = new char[length];
		int rnd;
		for(int i=0;i<length;i++){
			rnd = Math.abs(r.nextInt()) % src.length;
			
			buf[i] = src[rnd];
		}
		return new String(buf);
	}
	
	//���ø÷�������������ַ���,
	//����i: Ϊ�ַ����ĳ���
	public String runVerifyCode(int i){
		String VerifyCode = randString(i);
		return VerifyCode;
	}
	
	
	//������Χ��������ɫ
	public Color getRandColor(int fc,int bc)
	{
	   Random random = new Random();
	   if(fc>255) fc=255;
	   if(bc>255) bc=255;
	   int r=fc+random.nextInt(bc-fc);
	   int g=fc+random.nextInt(bc-fc);
	   int b=fc+random.nextInt(bc-fc);
	   return new Color(r,g,b);
   	}
  
  	//���ø÷������õ�����֤������ͼ��
  	//sCode:������֤�� w:ͼ���� h:ͼ��߶�
  	public BufferedImage CreateImage(String sCode)
  	{
	  	try{	
	  		//�ַ�������
			Font CodeFont = new Font("Arial Black",Font.PLAIN,16);
			int iLength = sCode.length();					//�õ���֤�볤��
			int width=22*iLength, height=20;				//ͼ������߶�
			int CharWidth = (int)(width-24)/iLength;		//�ַ�����߿��
			int CharHeight = 16;    						//�ַ����ϱ߸߶�
			
			// ���ڴ��д���ͼ��
			BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
			
			// ��ȡͼ��������
			Graphics g = image.getGraphics();
			
			//���������
			Random random = new Random();
			
			// �趨����ɫ
			g.setColor(getRandColor(200,240));
			g.fillRect(0, 0, width, height);
			
			//�趨����
			g.setFont(CodeFont);
			
			//�������ɫ�ı߿�
			g.setColor(getRandColor(10,50));
			g.drawRect(0,0,width-1,height-1);
			
			// �������155�������ߣ�ʹͼ���е���֤�벻�ױ���������̽�⵽
			g.setColor(getRandColor(160,200));
			for (int i=0;i<155;i++)
			{
				  int x = random.nextInt(width);
				  int y = random.nextInt(height);
				  int xl = random.nextInt(12);
				  int yl = random.nextInt(12);
				  g.drawLine(x,y,x+xl,y+yl);
			}
			
	
			for (int i=0;i<iLength;i++)
			{
				String rand = sCode.substring(i,i+1); 
				// ����֤����ʾ��ͼ����
				g.setColor(new Color(20+random.nextInt(60),20+random.nextInt(120),20+random.nextInt(180)));
				g.drawString(rand,CharWidth*i+14,CharHeight);
			}
			// ͼ����Ч
			g.dispose();
			return image;
		}catch(Exception e){
			System.out.println(e.getMessage());
			}
		return null;
	}
	
	//����
	public static void main(String[] args){	
			VerifyCode vc = new VerifyCode();
			String s1 = vc.runVerifyCode(4);
			System.out.println(s1);	
			//Image im = vc.CreateImage(s1);
			//Graphics g = im.getGraphics();
			//g.drawImage(im,20,20,this);
			//g.drawString(s1,20,20);
			
	}	
}
