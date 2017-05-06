<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.lang.Math.*"  %>
<%@ include file="inc/config.jsp"%>
<%@ include file="inc/style.jsp"%>

<% 
/*******************************************************************
*                                                                  *
*                   梦想年华 JSP 版留言本                          *
*                                                                  *
* 		版权所有: 	wsp.hniuca.net   							   *
*	`	CopyRight	2005-2006 DreamTime All Rights Reserved 	   *
*                                                                  *
*		程序制作:	[梦想年华]                                     *
*           		Email:fanwsp@126.com		                   *
*            		QQ:122142023                                   *
*            		HomePage:http://wsp.hniuca.net                 *
*       														   *
*		郑重申明：该程序仅提个人用户免费使用,未经本人同意，        *
*				　严禁用于商业用途！	                           *
*                                                                  *
*********************************************************************/
%>

<html>
<head>
<title><%=LybTitle%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<SCRIPT src="inc/ubbcode.js"></SCRIPT> 
<SCRIPT src="inc/post.js"></SCRIPT> 
</head>
<body>
<%=TopInfo(false)%>
<a name="ly"></a>
<table border="0" align="center" width="778">
  <tr>
    <td valign="top"><table width="100%" height="23%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="176" align="left" valign="top">
          <table width="640"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="69" valign="top">
<%
	request.setCharacterEncoding("gb2312");					//设置编码方式为gb2312  
	
	try{
		sql="select * from guestbook where Validate='Yes' order by ID DESC";
		rs = stmt.executeQuery(sql);
	}catch(SQLException e){
			//out.println(e.getMessage());
			session.setAttribute("error",error2);
			session.setAttribute("url",sPage);
			response.sendRedirect("error.jsp");
			return;
			}	
	//如果表中没有任何记录，刚给出提示信息
	if (!rs.next()){ 
			out.println("<table width=\"100%\"  border=\"1\" align=\"center\"><tr height=\"25\"><td background=\"images/bg.gif\">");
			out.println("<div align=\"center\" class=\"info\">暂时还没有任何留言！</div></td></tr></table>");
			return;
		} 
	
	//取得待显示页码 
	strPage = request.getParameter("intPage");
	try {
		if(strPage == null || strPage.equals(""))
			intPage = 1;
		else
			intPage = Integer.parseInt(request.getParameter("intPage"));	//将字符串转换成整型 
		}catch(java.lang.NumberFormatException e){
			intPage = 1;
			//out.println(e.getMessage());
		}
	//获取记录总数 
	rs.last(); 
	intRowCount = rs.getRow();
	//记算总页数 
	if(intRowCount % intPageSize == 0) intPageCount = intRowCount/intPageSize;
	else intPageCount = (int)Math.floor(intRowCount/intPageSize)+1;
	if(intPageCount == 0) intPageCount = 1;
	if(intPage < 1) intPage = 1;
	if(intPage > intPageCount) intPage = intPageCount;
	
	//将记录指针定位到待显示页的第一条记录上 
	rs.absolute((intPage-1) * intPageSize+1); 
	NO = intRowCount - (intPage-1)*intPageSize;
	i = 0; 
	while(i < intPageSize && !rs.isAfterLast()){
	//读留言信息
	int ID=rs.getInt("ID");
	String Name=rs.getString("Name");
	String QQ=rs.getString("QQ");
	String Mail=rs.getString("Mail");
	String ComeFrom=rs.getString("ComeFrom");
	String Time=rs.getString("UpdateTime");
	String Title=rs.getString("Title");
	String Sex=rs.getString("Sex");
	String HomePage=rs.getString("HomePage");
	String Face=rs.getString("Face");
	String Content=rs.getString("Content");
	String ReContent=rs.getString("ReContent");
	String ReTime=rs.getString("ReTime");
	String IP=rs.getString("IP");
	String EditTime=rs.getString("EditTime");
	boolean Secret=StringToBoolean(rs.getString("Secret"));
	boolean Validate=StringToBoolean(rs.getString("Validate"));
%>
<br>
                  <table width="100%"  border="1" align="center" cellpadding="4" cellspacing="1">
                    <tr class="chinese" height="25" background="images/bg<%=LybSkin%>.gif">
                      <td height="25" colspan="4" background="images/bg<%=LybSkin%>.gif"></td>
                      <td height="25" background="images/bg<%=LybSkin%>.gif"><div align="right"><a href="#top" title="回到顶部"><img src="images/top.gif" width="15" height="15" border="0"></a></div></td>
                    </tr>
                    <tr class="chinese" height="25">
                      <td width="13%" height="25"><div align="center">姓 &nbsp;&nbsp;&nbsp;名：</div></td>
                      <td width="31%" height="25"><%=Name%></td>
                      <td width="9%" height="25" class="chinese"><div align="center">OICQ：</div></td>
                      <td width="29%" height="25" class="chinese"><%=QQ%></td>
                      <td width="18%" rowspan="6"><div align="center" class="chinese">
					  <img alt="<%=FaceNote[(Integer.parseInt(Face)-1)]%>" src="<%="images/face/"+Sex+Face+".gif"%>" width="39" height="70"><br><br>
					  <span class="chinese">NO.<%=NO%></span></div></td>
                    </tr>
                    <tr class="chinese" height="25">
                      <td>
                        <div align="center">电子邮箱：</div></td>
                      <td height="25"><%=Mail%></td>
                      <td height="25"><div align="center">来&nbsp;自：</div></td>
                      <td><%=ComeFrom%></td>
                    </tr>
                    <tr class="chinese">
                      <td><div align="center" class="chinese">个人主页：</div></td>
                      <td height="25" colspan="3"><a Title="点击进入留言者的个人主页" href="<%=HomePage%>" target="_blank"><%=HomePage%></a></td>
                    </tr>
                    <tr class="chinese">
                      <td><div align="center">主&nbsp; &nbsp;&nbsp;题：</div></td>
                      <td height="25" colspan="3"><%=Title%></td>
                    </tr>
                    <tr class="chinese" height="25">
                      <td valign="middle"><div align="center">内 &nbsp; &nbsp;容：</div></td>
                      <td height="25" colspan="3">
					  <% if(Secret) out.println("<div class=\"info\">&nbsp;&nbsp;&nbsp;&nbsp;" + SecretInfo + "</div>");
					  	 else{
						 	if(EditTime!= null && !EditTime.equals("")) 
							{
								String EditContent = Content + "<br><br><div class=\"info\">&nbsp;&nbsp;&nbsp;&nbsp;";
								EditContent += EditInfo + " 编辑时间：" + EditTime + "</div>";
								out.println(EditContent);
					  	 	}
							else out.println(Content);
							}
					  %></td>
                    </tr>
                    <tr class="chinese">
                      <td valign="middle"><div align="center">回 &nbsp; &nbsp;复：</div></td>
                      <td height="25" colspan="3">
					  <% if (ReContent == null || ReContent.equals(""))	out.println(NoReplyInfo);
						 else 
						 {
							String Reply = ReplyInfo + "<br><br>" + ReContent + "<br><br><div class=\"info\">";
							Reply += "&nbsp;&nbsp;&nbsp;&nbsp;" + ReplyInfo1 + ReTime + "</div>"; 
						 	out.println(Reply);
						 }
						 %>
					  </td>
                    </tr>
                    <tr valign="bottom" height="27">
                      <td background="images/bg<%=LybSkin%>.gif" height="25" colspan="5">
					  <div align="left"><span class="info">&nbsp;&nbsp;发 表 于：&nbsp;&nbsp;<%=Time%></span></div>
					  </td>
                    </tr>
                </table>
                  <% 
	rs.next(); 
	i++;
	NO--; 
  //读取留言信息结束
  
  }
  out.println(Page(sPage)); 
%>
		</td>
      </tr>
    </table></td>
  </tr>
</table>
</table>
<%  out.println(BottomInfo());
	rs.close();
	stmt.close();
	DBConn.close(); %>
</body>
</html>
