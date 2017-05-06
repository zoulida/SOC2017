/*
 *******  java处理留言本内容代码  *************
 *******     实现字符转化         *************
 *  源文件名:   HTMLFilter.java
 *
 *	作者：梦想年华
 *	Email:fanwsp@126.com
 *	HomePage:http://wsp.hniuca.net
 *  QQ:122142023 
 * 	CopyRight(c)2005-2006 by DreamTime 
 *
*/

package dreamtime.guestbook;					//指定类所在的包

import java.io.PrintStream;						//导入类

public class HTMLFilter							//定义类
{

    public String source;

    public HTMLFilter()							//构造方法，初始化
    {
        source = "";
    }

    public void run()							//执行字符串转化的方法
    {
        source = replaceHTML(source);
    }

    private String replaceHTML(String s)		//字符串转化
    {
        StringBuffer stringbuffer = new StringBuffer();
        for(int i = 0; i < s.length(); i++)
        {
            char c = s.charAt(i);
            switch(c)
            {
            case 39: // '\''					//依次将相应的字符转化成HTML代码
                stringbuffer.append("&#039;");
                break;

            case 34: // '"'
                stringbuffer.append("&quot;");
                break;

            case 60: // '<'
                stringbuffer.append("&lt;");
                break;

            case 62: // '>'
                stringbuffer.append("&gt;");
                break;

            case 38: // '&'
                stringbuffer.append("&amp;");
                break;

            case 32: // ' '
                stringbuffer.append("&nbsp;");
                break;

            case 10: // '\n'
                stringbuffer.append("<br>");
                break;
            default:
                stringbuffer.append(c);
                break;
            }
        }

        return stringbuffer.toString();				//返回转化以后的字符串
    }

    public void setSource(String s)					//设定待转化的字符串
    {
        source = s;
    }

    public String getResult()						//得到转化以后的字符串结果
    {
        return source;
    }

    public static void main(String args[])			//主方法
    {
        HTMLFilter htmlfilter = new HTMLFilter();
        String s = "abc<>abc";
        htmlfilter.setSource(s);
        System.out.println(htmlfilter.source);
        htmlfilter.run();
        System.out.println(htmlfilter.getResult());
    }
}
