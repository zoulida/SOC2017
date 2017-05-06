/*
 *******    java实现UBB代码  *************
 *****************************************
 *  源文件名:     UbbCode.java
 *
 *	作者：梦想年华
 *	Email:fanwsp@126.com
 *	HomePage:http://wsp.hniuca.net
 *  QQ:122142023 
 * 	CopyRight(c)2005-2006 by DreamTime 
 *
*/


package dreamtime.guestbook;					//指定类所在的包

import java.util.regex.Matcher;					//导入所需要的类
import java.util.regex.Pattern;

public class UbbCode							//类定义
{

    private String source;						//待转化的HTML代码字符串
    private String ubbTags[];					//UBB标记数组
    private String htmlTags[];					//HTML标记数组

    //初始化,分别为UBB标记数组和HTML标记数组赋值
    public UbbCode()							
    {
        byte byte0 = 74;
        source = new String();
        ubbTags = new String[byte0];
        htmlTags = new String[byte0];
        ubbTags[0] = "[b]";
        htmlTags[0] = "<b>";
        ubbTags[1] = "[/b]";
        htmlTags[1] = "</b>";
        ubbTags[2] = "[i]";
        htmlTags[2] = "<em>";
        ubbTags[3] = "[/i]";
        htmlTags[3] = "</em>";
        ubbTags[4] = "[quote]";
        htmlTags[4] = "<div style=\"border-style:dashed;background-color:#CCCCCC;border-width:thin;border-color:#999999\"><br><em>";
        ubbTags[5] = "[/quote]";
        htmlTags[5] = "</em><br><br></div>";
        ubbTags[6] = "[/size]";
        htmlTags[6] = "</font>";
        ubbTags[7] = "[size=6]";
        htmlTags[7] = "<font style=\"font-size:6px\">";
        ubbTags[8] = "[size=8]";
        htmlTags[8] = "<font style=\"font-size:8px\">";
        ubbTags[9] = "[size=10]";
        htmlTags[9] = "<font style=\"font-size:10px\">";
        ubbTags[10] = "[size=12]";
        htmlTags[10] = "<font style=\"font-size:12px\">";
        ubbTags[11] = "[size=14]";
        htmlTags[11] = "<font style=\"font-size:14px\">";
        ubbTags[12] = "[size=18]";
        htmlTags[12] = "<font style=\"font-size:18px\">";
        ubbTags[13] = "[size=24]";
        htmlTags[13] = "<font style=\"font-size:24px\">";
        ubbTags[14] = "[size=36]";
        htmlTags[14] = "<font style=\"font-size:36px\">";
        
        //字体
        ubbTags[15] = "[/font]";
        htmlTags[15] = "</font>";
        ubbTags[16] = "[font=Arial]";
        htmlTags[16] = "<font face=\"Arial\">";
        ubbTags[17] = "[font=Arial Black]";
        htmlTags[17] = "<font face=\"Arial Black\">";
        ubbTags[18] = "[font=Verdana]";
        htmlTags[18] = "<font face=\"Verdana\">";
        ubbTags[19] = "[font=Times New Roman]";
        htmlTags[19] = "<font face=\"Times New Roman\">";
        ubbTags[20] = "[font=Garamond]";
        htmlTags[20] = "<font face=\"Garamond\">";
        ubbTags[21] = "[font=Courier New]";
        htmlTags[21] = "<font face=\"Courier New\">";
        ubbTags[22] = "[font=Webdings]";
        htmlTags[22] = "<font face=\"Webdings\">";
        ubbTags[23] = "[font=Wingdings]";
        htmlTags[23] = "<font face=\"Wingdings\">";
        ubbTags[24] = "[font=隶书]";
        htmlTags[24] = "<font face=\"隶书\">";
        ubbTags[25] = "[font=幼圆]";
        htmlTags[25] = "<font face=\"幼圆\">";        
        ubbTags[26] = "[font=方正舒体]";
        htmlTags[26] = "<font face=\"方正舒体\">";
        ubbTags[27] = "[font=方正姚体]";
        htmlTags[27] = "<font face=\"方正姚体\">";
        ubbTags[28] = "[font=仿宋_GB2312]";
        htmlTags[28] = "<font face=\"仿宋_GB2312\">";
        ubbTags[29] = "[font=黑体]";
        htmlTags[29] = "<font face=\"黑体\">";
		ubbTags[30] = "[font=华文彩云]";
        htmlTags[30] = "<font face=\"华文彩云\">";
        ubbTags[31] = "[font=华文细黑]";
        htmlTags[31] = "<font face=\"华文细黑\">";
 		ubbTags[32] = "[font=华文新魏]";
        htmlTags[32] = "<font face=\"华文新魏\">";
		ubbTags[33] = "[font=华文中宋]";
        htmlTags[33] = "<font face=\"华文中宋\">";
        ubbTags[34] = "[font=华文行楷]";
        htmlTags[34] = "<font face=\"华文行楷\">";
        ubbTags[35] = "[font=楷体_GB2312]";
        htmlTags[35] = "<font face=\"楷体_GB2312\">";
        ubbTags[36] = "[font=隶书]";
        htmlTags[36] = "<font face=\"隶书\">"; 
        ubbTags[37] = "[font=华文楷体]";
        htmlTags[37] = "<font face=\"华文楷体\">";        
        ubbTags[38] = "[font=宋体]";
        htmlTags[38] = "<font face=\"宋体\">";
		ubbTags[39] = "[font=新宋体";
        htmlTags[39] = "<font face=\"新宋体\">";
        ubbTags[40] = "[font=幼圆";
        htmlTags[40] = "<font face=\"幼圆\">";
		
		//字体颜色
        ubbTags[41] = "[red]";
        htmlTags[41] = "<font color=\"red\">";
        ubbTags[42] = "[/red]";
        htmlTags[42] = "</font>";
        ubbTags[43] = "[blue]";
        htmlTags[43] = "<font color=\"blue\">";
        ubbTags[44] = "[/blue]";
        htmlTags[44] = "</font>";
        ubbTags[45] = "[yellow]";
        htmlTags[45] = "<font color=\"yellow\">";
        ubbTags[46] = "[/yellow]";
        htmlTags[46] = "</font>";
        ubbTags[47] = "[green]";
        htmlTags[47] = "<font color=\"green\">";
        ubbTags[48] = "[/green]";
        htmlTags[48] = "</font>";
        
        ubbTags[49] = "[f]";
        htmlTags[49] = "<marquee width=\"400\" scrolldelay=\"30\" scrollamount=\"1\" onmouseover=\"this.stop()\" onmouseout=\"this.start()\">";
       
        //标题
        ubbTags[50] = "[h1]";
        htmlTags[50] = "<h1>";
        ubbTags[51] = "[/h1]";
        htmlTags[51] = "</h1>";
        ubbTags[52] = "[h2]";
        htmlTags[52] = "<h2>";
        ubbTags[53] = "[/h2]";
        htmlTags[53] = "</h2>";
        ubbTags[54] = "[h3]";
        htmlTags[54] = "<h3>";
        ubbTags[55] = "[/h3]";
        htmlTags[55] = "</h3>";
        ubbTags[56] = "[h4]";
        htmlTags[56] = "<h4>";
        ubbTags[57] = "[/h4]";
        htmlTags[57] = "</h4>";
        ubbTags[58] = "[h5]";
        htmlTags[58] = "<h5>";
        ubbTags[59] = "[/h5]";
        htmlTags[59] = "</h5>";
        ubbTags[60] = "[h6]";
        htmlTags[60] = "<h6>";
        ubbTags[61] = "[/h6]";
        htmlTags[61] = "</h6>";
        ubbTags[62] = "[hr]";
        htmlTags[62] = "<hr>";
        ubbTags[63] = "[img]";
        htmlTags[63] = "<br><img src=\"";
        ubbTags[64] = "[/img]";
        htmlTags[64] = "\"><br>";
        ubbTags[65] = "[center]";
        htmlTags[65] = "<div align=\"center\">";
        ubbTags[66] = "[/center]";
        htmlTags[66] = "</div>";
        
        ubbTags[67] = "[/f]";
        htmlTags[67] = "</marquee>"; 
        ubbTags[68] = "[left]";
        htmlTags[68] = "<div align=\"left\">";
        ubbTags[69] = "[/left]";
        htmlTags[69] = "</div>";
        ubbTags[70] = "[right]";
        htmlTags[70] = "<div align=\"right\">";
        ubbTags[71] = "[/right]";
        htmlTags[71] = "</div>";
        ubbTags[72] = "[u]";
        htmlTags[72] = "<u>";
        ubbTags[73] = "[/u]"; 
        htmlTags[73] = "</u>";
      
    }

    private String replace(String s, String s1, String s2)
    {
        StringBuffer stringbuffer = new StringBuffer();
        for(int i = 0; i < s1.length(); i++)
        {
            char c = s1.charAt(i);
            switch(c)
            {
            case 91: // '['
                stringbuffer.append("\\[");
                break;

            case 93: // ']'
                stringbuffer.append("\\]");
                break;

            default:
                stringbuffer.append(c);
                break;
            }
        }

        Pattern pattern = Pattern.compile(stringbuffer.toString());
        Matcher matcher = pattern.matcher(s);
        StringBuffer stringbuffer1 = new StringBuffer();
        for(boolean flag = matcher.find(); flag; flag = matcher.find())
            matcher.appendReplacement(stringbuffer1, s2);

        return matcher.appendTail(stringbuffer1).toString();
    }

    private String replaceNormalUBBCode(String s)
    {
        String s1 = new String(s);
        for(int i = 0; i < ubbTags.length; i++)
            s1 = replace(s1, ubbTags[i], htmlTags[i]);

        return s1;
    }

    private String replaceURL(String s)
    {
        StringBuffer stringbuffer = new StringBuffer(s);
        String s1 = new String();
        int i = s.indexOf("[url]");
        int j = s.indexOf("[/url]");
        if(i != -1 && j != -1 && i < j)
        {
            String s2 = s.substring(i + 5, j);
            String s3 = "<a href=\"" + s2 + "\">" + s2 + "</a>";
            stringbuffer.replace(i, j + 6, s3);
        }
        return stringbuffer.toString();
    }

    private String replaceEmail(String s)
    {
        StringBuffer stringbuffer = new StringBuffer(s);
        String s1 = new String();
        int i = s.indexOf("[email]");
        int j = s.indexOf("[/email]");
        if(i != -1 && j != -1 && i < j)
        {
            String s2 = s.substring(i + 7, j);
            String s3 = "<a href=\"mailto:" + s2 + "\">" + s2 + "</a>";
            stringbuffer.replace(i, j + 8, s3);
        }
        return stringbuffer.toString();
    }

    public void setSource(String s)
    {
        source = s;
    }

    public String getResult()
    {
        return source;
    }

    public void run()
    {
        for(source = replaceNormalUBBCode(source); source.indexOf("[url]") != -1 && source.indexOf("[/url]") != -1; source = replaceURL(source));
        for(; source.indexOf("[email]") != -1 && source.indexOf("[/email]") != -1; source = replaceEmail(source));
    }
}
