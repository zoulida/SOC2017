/*
 *******  java�������Ա����ݴ���  *************
 *******     ʵ���ַ�ת��         *************
 *  Դ�ļ���:   HTMLFilter.java
 *
 *	���ߣ������껪
 *	Email:fanwsp@126.com
 *	HomePage:http://wsp.hniuca.net
 *  QQ:122142023 
 * 	CopyRight(c)2005-2006 by DreamTime 
 *
*/

package dreamtime.guestbook;					//ָ�������ڵİ�

import java.io.PrintStream;						//������

public class HTMLFilter							//������
{

    public String source;

    public HTMLFilter()							//���췽������ʼ��
    {
        source = "";
    }

    public void run()							//ִ���ַ���ת���ķ���
    {
        source = replaceHTML(source);
    }

    private String replaceHTML(String s)		//�ַ���ת��
    {
        StringBuffer stringbuffer = new StringBuffer();
        for(int i = 0; i < s.length(); i++)
        {
            char c = s.charAt(i);
            switch(c)
            {
            case 39: // '\''					//���ν���Ӧ���ַ�ת����HTML����
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

        return stringbuffer.toString();				//����ת���Ժ���ַ���
    }

    public void setSource(String s)					//�趨��ת�����ַ���
    {
        source = s;
    }

    public String getResult()						//�õ�ת���Ժ���ַ������
    {
        return source;
    }

    public static void main(String args[])			//������
    {
        HTMLFilter htmlfilter = new HTMLFilter();
        String s = "abc<>abc";
        htmlfilter.setSource(s);
        System.out.println(htmlfilter.source);
        htmlfilter.run();
        System.out.println(htmlfilter.getResult());
    }
}
