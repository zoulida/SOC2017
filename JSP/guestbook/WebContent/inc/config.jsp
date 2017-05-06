<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.PrintStream"%>
<%@ include file="conndb.jsp"%>

<% 
/*******************************************************************
*                                                                  *
*                   梦想年华 JSP 版留言本                           *
*                                                                  *
* 		版权所有: 	wsp.hniuca.net   							   *
*	`	CopyRight	2005-2006 DreamTime All Rights Reserved 	   *
*                                                                  *
*		程序制作:	[梦想年华]                                     *
*           		Email:fanwsp@126.com		                   *
*            		QQ:122142023                                   *
*            		HomePage:http://wsp.hniuca.net                 *
*       														   *
*		郑重申明：该程序仅提个人用户免费使用,未经本人同意，           *
*				　严禁用于商业用途！	                               *
*                                                                  *
*********************************************************************/
%>

<%!
	//以下为系统用到的变量和留言本的参数
	String error1 = "非法的参数传递!";								//错误提示信息
	String error2 = "数据库操作出错!";
	String NowTime=(new java.util.Date()).toLocaleString();			//得到当前时间时间
	String dEditInfo = "该留言已被管理员 梦想年华 编辑过！";	   		//编辑留言时默认的信息
    String dReplyInfo= "首先非常感谢您的留言!";						//回复留言时默认的头信息
	String dNoReplyInfo = "暂无回复";								//无回复时默认显示的信息
	String dSecretInfo = "该留言只有管理员可见！";					//悄悄话时默认提示的信息
	boolean isLogin;												//是否登录标记
	String sql;														//SQL语句
	String serror;													//错误详细描述
	ResultSet rs;
	int id;					//留言ID
	String Ip;
	
	int LybID;				//留言本ID标识
	String LybTitle;		//留言本名称
	String LybHomePage;		//网站首页网址
	int LybPageSize;		//留言每页显示的记录条数
	int LybMaxByte;			//留言内容最大字节数
	String LybCopyRight;	//版权信息
	String LybVersion;		//版本号
	String OpenSecret;		//是否打开悄悄话功能
	String OpenValidate;	//是否打开审核功能
	String OpenUBB;			//是否打开UBB功能
	String OpenFace;		//是否打开表情符号功能
	String EditInfo;		//编辑留言时的信息
	String ReplyInfo;		//回复留言时的头信息
	String ReplyInfo1;		//回复留言时的尾信息
	String NoReplyInfo;		//没有回复时的提示信息
	String SecretInfo;		//悄悄话时的提示信息
	String LybNote;			//留言本公告
	int LybSkin;			//留言本的风格
	
	boolean isSecret;		//是否打开悄悄话功能
	boolean isValidate;		//是否打开审核功能
	boolean isUBB;			//是否打开UBB功能
	boolean isFace;			//是否打开表情符号功能
	
	String TopInfo;			//页面头信息
	String BottomInfo;		//页面版权信息
	String s = "";
	
	//以下为管理员资料的变量　
	int AdminID;
	String AdminUser;		//登录用户名
	String AdminPwd;		//登录密码
	String AdminName;		//管理员名称
	String AdminUid;		//管理员留言ID
	String AdminQQ;
	String AdminMail;
	String AdminHomePage;
	String AdminPhone;
	String AdminAddress;
	String AdminNote;
	
	//以下是分面所用的变量申明
	String sPage;
	int intPageSize; 				//一页显示的记录数 
	int intRowCount; 				//记录总数 
	int intPageCount; 				//总页数 
	int intPage; 					//待显示页码 
	String strPage;					//得到页码的临时变量
	int i; 			
	int NO;							//第几条留言
	
	//表情信息
	String FaceID [] = {"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16"};
	String FaceNote [] = {"好开心","没办法","不满意","平常心","忙死了","动脑筋","好感动","好生气","要坚持","好可怜","要唱歌","好伤心","棒极了","哇好靓","我抗议","好害怕"};
		   
		   
	/***************************************************************
	函数名：CheckReplace
	作  用：转化SQL特殊字符串
	参  数：s: 字符串型，待转化的字符
	返回值：转化以后的字符串
	调　用：String s2 = CheckReplace(s1);
	*****************************************************************/	
	public String CheckReplace(String s)
	{
	    if(s == null || s.equals("")) return " ";
		else
		{
			StringBuffer stringbuffer = new StringBuffer();
			for(int i = 0; i < s.length(); i++)
			{
				char c = s.charAt(i);
				switch(c)
				{
           		case 0: // '空格'
					stringbuffer.append("");						//依次将相应的字符转化成空格
					break;
					
				case 10: // '\n'
					stringbuffer.append("<br>");					//依次将相应的字符转化成空格
					break;
					
				case 32: // ' '
					stringbuffer.append("");					
					break;				
					
				case 34: // '"'
					stringbuffer.append("&quot;");
					break;
	
				case 39: // '\''									
					stringbuffer.append("&#039;");
					break;

				case 124: // '|'
					stringbuffer.append(" ");
					break;
				default:
					stringbuffer.append(c);
					break;
				}
			}
			return stringbuffer.toString().trim();					//返回转化以后的字符串
  		}
	}
	
	
	/***************************************************************
	函数名：StringToBoolean
	作  用：头部信息显示
	参  数：AdminLogin: 布尔型，用户是否登录标识
	返回值：字符串
	调　用：out.println(BottomInfo());
	*****************************************************************/	
	public boolean StringToBoolean(String s)
	{
		if (s != null && s.equals("Yes")) return true; 
		else return false;
	}
	
	
	/***************************************************************
	函数名：TopInfo
	作  用：头部信息显示
	参  数：AdminLogin: boolean，用户是否登录标识
	返回值：字符串
	调　用：out.println(BottomInfo());
	*****************************************************************/
	public String TopInfo(boolean AdminLogin)
	{
		if(AdminLogin) 
		{
			TopInfo =  "<table width=\"640\" border=\"1\" align=\"center\" cellspacing=\"1\" background=\"images/bg" + LybSkin + ".gif\">";
			TopInfo += "<tr height=\"25\">";
			TopInfo += "<td><div align=\"center\"><a href=\"adminindex.jsp\">管理首页</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"adminly.jsp\">留言管理</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"adminconfig.jsp\">参数设置</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"adminsystem.jsp\">系统管理</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"admininfo.jsp\">版主资料</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"adminnote.jsp\">公告管理</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"logout.jsp\">退出系统</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"help.jsp\">管理帮助</a></div></td>";
			TopInfo += "</tr></table>";
			return TopInfo;
		}
		else 
		{
			TopInfo  = "<table width=\"640\" border=\"1\" align=\"center\" cellspacing=\"1\" background=\"images/bg" + LybSkin + ".gif\">";
			TopInfo += "<tr height=\"25\">";
			TopInfo += "<td width=\"233\"><div align=\"center\" class=\"title\">" + LybTitle + "</div></td>";
			TopInfo += "<td width=\"85\"><div align=\"center\"><a href=\"" + LybHomePage + "\" target=\"_blank\">网站首页</a></div></td>";
			TopInfo += "<td width=\"85\"><div align=\"center\"><a href=\"addly.jsp\">添加留言</a></div></td>";
			TopInfo += "<td width=\"85\"><div align=\"center\"><a href=\"index.jsp\">查看留言</a></div></td>";
			TopInfo += "<td width=\"85\"><div align=\"center\"><a href=\"login.jsp\">管理登录</a></div></td>";
			TopInfo += "<td width=\"85\"><div align=\"center\"><a href=\"help.jsp\">留言帮助</a></div></td>";
			TopInfo += "</tr></table>";
			TopInfo += "<br><br><table width=\"640\" border=\"1\" align=\"center\" cellspacing=\"1\" background=\"images/bg" + LybSkin + ".gif\">";
			TopInfo += "<tr height=\"25\">";
			TopInfo += "<td  width=\"100\"><div align=\"center\" class=\"info\">留言本公告：</div></td>";
			TopInfo += "<td colspan=\"5\" class=\"info\"><marquee width=\"540\" scrolldelay=\"30\" scrollamount=\"1\" onmouseover=\"this.stop()\" onmouseout=\"this.start()\">" + LybNote + "</marquee></td>";
			TopInfo += "</tr>";
			TopInfo += "</table>";
			return TopInfo;
		}
	}
	
	
	/***************************************************************
	函数名：BootomInfo
	作  用：底部信息显示
	参  数：无
	返回值：字符串型
	调　用：out.println(BottomInfo());
	*****************************************************************/
	public String BottomInfo()
	{
		BottomInfo = "<table border=\"1\" align=\"center\"><tr><td><table width=\"640\" border=\"0\" cellspacing=\"0\" align=\"center\">";
		BottomInfo += "<tr height=\"20\"><td><div align=\"center\" class=\"foot\">" + LybTitle + "　 <a title=\"程序设计：梦想年华\" href=\"http://wsp.hniuca.net\" target=\"_blank\">" + LybVersion +"　　</a></div></td></tr>";
		BottomInfo += "<tr height=\"20\"><td><div align=\"center\" class=\"foot\">管理维护：<a title=\"查看管理员资料\" href=\"dispadmininfo.jsp\" target=\"_blank\">" + AdminName + "</a></div></td></tr>";
		BottomInfo += "<tr height=\"20\"><td><div align=\"center\" class=\"foot\">CopyRight &copy; 2005-2006 " + LybCopyRight + " All Rights Reserved</div></td></tr>";
		BottomInfo += "<tr height=\"20\"><td><div align=\"center\" class=\"foot\">QQ：" + AdminQQ + "　E-Mail：" + AdminMail + "　TEL：" + AdminPhone + "</div></td></tr>";
		BottomInfo += "<tr height=\"30\"><td><div align=\"center\" class=\"foot\">&nbsp;&nbsp;[Powered By <a href=\"http://wsp.hniuca.net\" target=\"_blank\">DreamTime</a>]</div></td></tr>";
		BottomInfo += "</table></td><tr></table><br>";
		return BottomInfo;
	}

	
	/***************************************************************
	函数名：Page
	作  用：分页显示
	参  数：sPage: 字符型，当前页面文件路径 
			可用 sPage = request.getServletPath()得到 
	返回值：显示分页的字符串
	调　用：out.println(Page(sPage);
	*****************************************************************/
	public String Page(String sPage)
	{
		s  = "<table width=\"100%\"  border=\"0\"><tr>";
		s += "<td width=\"82%\" height=\"30\" class=\"info\"><span class=\"info\">";
		s += "当前第"+intPage+"页/共"+ intPageCount+"页,共"+intRowCount+"条记录,"+intPageSize+"条/页"; 
		
		int showye = intPageCount;
		if(showye>20) showye=20;
		for(i=1;i<=showye;i++)
		{
			if(i==intPage)	s += " " + i + " ";
			else s += " <a href=\""+sPage+"?intPage="+i+"\">" +i+"</a> ";
		}
		
		s += "</span></td>";
		s += "<td width=\"18%\">";
		s += "<table width=\"100%\" border=\"0\">";
		s += "<tr><td><div align=\"right\"><span class=\"info\">跳转到";
		s += "<select name=\"ipage\" class=\"info\" onChange=\"MM_jumpMenu('parent',this,0)\">";
		s += "<option selected>请选择</option>";
		
		for(i=1;i<=intPageCount;i++)
		{
			String sSelect = (i==intPage)?"SELECTED":"";
			s += "<option value=\"" + sPage + "?intPage=" + i + "\"" + sSelect + ">第" + i + "页</option>";
		}
		
		s += "</select></span></div>";
		s += "</td></tr></table>";
		s += "</td></tr></table>";
		return s;
	}
	
%>

<%
	//读取系统参数变量　
	request.setCharacterEncoding("gb2312");								//设置编码方式为gb2312
	try{
		sql="select * from admin,config";				 				//构造SQL语句
		rs = stmt.executeQuery(sql);
		
	rs.next();
	//读管理员资料
	AdminID=rs.getInt("AdminID");
	AdminUser=rs.getString("User");
	//AdminPwd=rs.getString("Pwd");
	AdminName=rs.getString("AdminName");
	AdminUid=rs.getString("AdminUid");
	AdminQQ=rs.getString("AdminQQ");
	AdminMail=rs.getString("AdminMail");
	AdminHomePage=rs.getString("AdminHomePage");
	AdminPhone=rs.getString("AdminPhone");
	AdminAddress=rs.getString("AdminAddress");
	AdminNote=rs.getString("AdminNote");

	//读留言本参数信息
	LybID=rs.getInt("LybID");
	LybTitle=rs.getString("LybTitle");
	LybHomePage=rs.getString("LybHomePage");
	LybPageSize=rs.getInt("LybPageSize");
	LybMaxByte=rs.getInt("LybMaxByte");
	LybCopyRight=rs.getString("LybCopyRight");
	LybVersion=rs.getString("LybVersion");
	OpenSecret=rs.getString("OpenSecret");
	OpenValidate=rs.getString("OpenValidate");
	OpenUBB=rs.getString("OpenUBB");
	OpenFace=rs.getString("OpenFace");
	EditInfo=rs.getString("EditInfo");
	ReplyInfo=rs.getString("ReplyInfo");
	NoReplyInfo=rs.getString("NoReplyInfo");
	SecretInfo=rs.getString("SecretInfo");
	LybSkin=rs.getInt("LybSkin");
	LybNote=rs.getString("LybNote");
	ReplyInfo1 = "管理员 " + AdminName + " 回复于： "; 
	//如果这些提示信息为空，则给默认值，防止系统出错!
	if(EditInfo == null || EditInfo.equals("")) EditInfo = dEditInfo;
	if(ReplyInfo == null || ReplyInfo.equals("")) ReplyInfo = dReplyInfo;
	if(NoReplyInfo == null || NoReplyInfo.equals("")) NoReplyInfo = dNoReplyInfo;
	if(SecretInfo == null || SecretInfo.equals("")) SecretInfo = dSecretInfo;
	if(LybPageSize == 0) LybPageSize = 10;
	if(LybMaxByte == 0) LybMaxByte = 1200;
	intPageSize = LybPageSize;				//每页显示的记录数
	
	isSecret=StringToBoolean(OpenSecret);
	isValidate=StringToBoolean(OpenValidate);
	isUBB=StringToBoolean(OpenUBB);
	isFace=StringToBoolean(OpenFace);
	
	}catch(SQLException e){
			out.println(e.getMessage());
			session.setAttribute("error",error2);
			//session.setAttribute("url",sPage);
			//response.sendRedirect("error.jsp");
			return;
			}


	//判断用户是否登录　	
	isLogin = StringToBoolean((String)session.getAttribute("Login"));
	
	sPage =	request.getServletPath();
	sPage = sPage.substring(1);
	//out.println(sPage);
%>



