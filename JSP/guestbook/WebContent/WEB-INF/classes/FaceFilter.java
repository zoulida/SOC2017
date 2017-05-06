/*
 *******            表情转化        *************
 ************************************************
 *  源文件名:     FaceFilter.java
 *
 *	作者：梦想年华
 *	Email:fanwsp@126.com
 *	HomePage:http://wsp.hniuca.net
 *  QQ:122142023 
 *	CopyRight(c)2005-2006 by DreamTime 
 *
*/

package dreamtime.guestbook;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FaceFilter
{

    private String faceList[];
    private String faceImage[];
    private String source;

    public FaceFilter()
    {
        byte byte0 = 96;
        faceList = new String[byte0];
        faceImage = new String[byte0];
        for(int i=1; i <byte0; i++)
            if(i < 10)
            {
                faceList[i] = ":em0" + i;
                faceImage[i] = "<img src=\"images/ubbface/0" + i + ".gif\">";
            } 
            else
            {
                faceList[i] = ":em" + i;
                faceImage[i] = "<img src=\"images/ubbface/" + i + ".gif\">";
            }

    }

    public void run()
    {
        source = replaceNormalFace(source);
        source = replaceSpecialFace(source);
    }

    private String replace(String s, String s1, String s2)
    {
        Pattern pattern = Pattern.compile(s1);
        Matcher matcher = pattern.matcher(s);
        StringBuffer stringbuffer = new StringBuffer();
        for(boolean flag = matcher.find(); flag; flag = matcher.find())
            matcher.appendReplacement(stringbuffer, s2);

        return matcher.appendTail(stringbuffer).toString();
    }

    private String replaceNormalFace(String s)
    {
        String s1 = new String(s);
        for(int i = 0; i < faceList.length; i++)
            s1 = replace(s1, faceList[i], faceImage[i]);

        return s1;
    }

    private String replaceSpecialFace(String s)
    {
        String s1 = new String(s);
        s1 = replace(s1, ":P", "<img src=\"images/ubbface/04.gif\">");
        s1 = replace(s1, ":O", "<img src=\"images/ubbface/03.gif\">");
        s1 = replace(s1, ":S", "<img src=\"images/ubbface/07.gif\">");
        s1 = replace(s1, ":\\)", "<img src=\"images/ubbface/00.gif\">");
        s1 = replace(s1, ":\\(", "<img src=\"images/ubbface/18.gif\">");
        s1 = replace(s1, ":D", "<img src=\"images/ubbface/01.gif\">");
        s1 = replace(s1, ":\\|", "<img src=\"images/ubbface/17.gif\">");
        s1 = replace(s1, ":Y", "<img src=\"images/ubbface/32.gif\">");
        s1 = replace(s1, ":N", "<img src=\"images/ubbface/33.gif\">");
        s1 = replace(s1, ":\\[", "<img src=\"images/ubbface/31.gif\">");
        return s1;
    }

    public void setSource(String s)
    {
        source = s;
    }

    public String getResult()
    {
        return source;
    }
}
