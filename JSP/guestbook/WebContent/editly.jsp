<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.lang.Math.*"  %>
<%@ include file="inc/config.jsp"%>
<%@ include file="inc/style.jsp"%>
<%@ include file="session.jsp"%>

<jsp:useBean id="FaceFilter" scope="page" class="dreamtime.guestbook.FaceFilter"/>
<jsp:useBean id="UbbCode" scope="page" class="dreamtime.guestbook.UbbCode"/>

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
<title>编辑留言</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
<SCRIPT src="inc/ubbcode.js"></SCRIPT> 
<SCRIPT src="inc/post.js"></SCRIPT> 
</head>
<%			
	request.setCharacterEncoding("gb2312");					//设置编码方式为gb2312
	//处理表单，并进行异常处理
	String action = request.getParameter("action");
	if(action!=null && action.equals("edit"))
	{
		String EditContent=request.getParameter("Content");
		if(EditContent == null || EditContent.equals("") || EditContent.length() > LybMaxByte)
		{
			out.println("<br><br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td>");
			out.println("<div align=\"center\" class=\"info\"><br>编辑留言内容不能为空！");
			out.println("<br><br>编辑留言内容不能大于" + LybMaxByte +"个字符！<br><br>请仔细核对您的输入！<br>");
			out.println("<br><a href=\"#\" onClick=\"javascript:history.go(-1);\">返回</a><br></div></td></tr></table>");
			return;
		}
		
		UbbCode.setSource(EditContent);
		UbbCode.run();
		EditContent=UbbCode.getResult();
		
		FaceFilter.setSource(EditContent);
		FaceFilter.run();
		EditContent=FaceFilter.getResult();
		
	try{
			id = Integer.parseInt(request.getParameter("id"));
			sql = "update guestbook set Content='" + EditContent + "',EditTime='"+ NowTime +"' where ID="+id;
			stmt.executeUpdate(sql);
			//stmt.close();
			//DBConn.close();
		}catch(SQLException e){
			//out.println(e.getMessage());
			session.setAttribute("error",error2);
			session.setAttribute("url",sPage+"?id="+id);
			response.sendRedirect("error.jsp");
			return;
			}
		out.println("<SCRIPT LANGUAGE='JavaScript'>alert('编辑留言成功!');location.href='adminly.jsp';</SCRIPT>");
		//out.println(sql);
	}
   	
		//读取指定的ID
	request.setCharacterEncoding("gb2312");						//设置编码方式为gb2312
	try{
		id = Integer.parseInt(request.getParameter("id"));		//将字符串转换成整型 
		}catch(Exception e){
			//out.println(e.getMessage());
			session.setAttribute("error",error1);
			session.setAttribute("url","adminly.jsp");
			response.sendRedirect("error.jsp");
			return;
		  	}
	
	try{
		sql="select * from guestbook where id=" +id;			//构造SQL语句
		rs = stmt.executeQuery(sql);
		}catch(SQLException e){
			//out.println(e.getMessage());
			session.setAttribute("error",error2);
			session.setAttribute("url","adminly.jsp");
			response.sendRedirect("error.jsp");
			return;
	   		}
	   
	//读留言信息
	rs.next();
	int ID=rs.getInt("ID");
	String Name=rs.getString("Name");
	String QQ=rs.getString("QQ");
	String Mail=rs.getString("Mail");
	String ComeFrom=rs.getString("ComeFrom");
	String Time=rs.getString("UpdateTime");
	String Title=rs.getString("Title");
	String Sex=rs.getString("Sex");
	String Face=rs.getString("Face");
	String Content=rs.getString("Content");
	String ReContent=rs.getString("ReContent");
	String ReTime=rs.getString("ReTime");
	String Secret=rs.getString("Secret");
	String IP=rs.getString("IP");
%>

<body>
<%=TopInfo(true)%>
<a name="ly"></a> 
<table border="0" align="center" width="640">  
  <tr>
    <td valign="top"><table width="100%" height="23%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="176" align="left" valign="top">
          <br>
          <table width="640"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="69" valign="top">
                <form name="form" method="post" action="editly.jsp" onSubmit="return ReplyCheck()">
                    <table width="100%"  border="1" align="center" cellpadding="6" cellspacing="1" style="border-collapse:collapse">
                      <tr>
                        <td height="25" colspan="4"  background="images/bg<%=LybSkin%>.gif">
                        <div align="center"><span class="title">编辑留言</span></div>						</td>
                      </tr>
                      <tr>
                        <td width="17%"><div align="center" class="chinese">姓 &nbsp;&nbsp;&nbsp;名：</div></td>
                        <td width="33%" height="25" class="chinese"><%=Name%>
                        <input name="id" type="hidden" id="id" value="<%=ID%>"></td>
                        <td width="10%" height="25"><div align="center" class="chinese">OICQ：</div></td>
                        <td width="40%" class="chinese"><%=QQ%> </td>
                      </tr>
                      <tr>
                        <td>
                          <div align="center" class="chinese">电子邮箱：</div></td>
                        <td height="25" class="chinese"><%=Mail%> </td>
                        <td height="29"><div align="center" class="chinese">来&nbsp;自：</div></td>
                        <td class="chinese"><%=ComeFrom%> </td>
                      </tr>
                      <tr>
                        <td><div align="center" class="chinese">性&nbsp; &nbsp;别：</div></td>
                        <td height="25">
                          <span class="chinese">
						  <%//转化性别为汉字
							if(Sex.equals("m")) out.println("男");
							else out.println("女");
							%>
                        </span></td>
                        <td height="29"><div align="center" class="chinese">表 情：</div></td>
                        <td class="chinese"><%=Face%> </td>
                      </tr>
                      <tr>
                        <td> <div align="center" class="chinese">保&nbsp; &nbsp;密：</div></td>
                        <td height="29" colspan="3"><span class="chinese"><%=Secret%>
                        </span></td>
                      </tr>
                      <tr>
                        <td><div align="center" class="chinese">主&nbsp; &nbsp;&nbsp;题：</div></td>
                        <td height="25" colspan="3" class="chinese"><%=Title%> </td>
                      </tr>
                      
					  <tr>
                        <td valign="middle"><div align="center">
                              <span class="chinese">内 &nbsp; &nbsp;容：</span><br><br> 
                              <span class="info">『<a href="javascript:CheckLength();">查看内容长度</a>』</span><br>
                              <span class="info">『<a href="javascript:Replac()"> 替 换 内 容</a>』</span><br>
                              <span class="info">『<a href="javascript:Copy('form.Content')">复制到剪贴板</a>』
                              </span></div><br>
						</td>
                        <td height="27" colspan="3">
						<table width="100%"  border="0" cellpadding="0" cellspacing="0">
						  <tr>
                            <td width="77%">
							<table width="100%"  border="0" cellpadding="0" cellspacing="0">
                      		<% if(isUBB) { %>
								<tr>
                                  <td>
								  <select name="selectFont" class="chinese" id="select2" onChange="setFont(this.options[this.selectedIndex].value)">
                                    <option value="Arial" selected>选择字体</option>
                                    <option value="Arial">Arial</option>
                                    <option value="Arial Black">Arial Black</option>
                                    <option value="Verdana">Verdana</option>
                                    <option value="Times New Roman">Times New Roman</option>
                                    <option value="Garamond">Garamond</option>
                                    <option value="Courier New">Courier New</option>
                                    <option value="Webdings">Webdings</option>
                                    <option value="Wingdings">Wingdings</option>
                                    <option value="隶书">隶书</option>
                                    <option value="幼圆">幼圆</option>
                                    <OPTION value="方正舒体">方正舒体</OPTION>
                                    <OPTION value="方正姚体">方正姚体</OPTION>
                                    <OPTION value="仿宋_GB2312">仿宋_GB2312</OPTION>
                                    <OPTION value="黑体">黑体</OPTION>
                                    <OPTION value="华文彩云">华文彩云</OPTION>
                                    <OPTION value="华文细黑">华文细黑</OPTION>
                                    <OPTION value="华文新魏">华文新魏</OPTION>
                                    <OPTION value="华文楷体">华文楷体</OPTION>
                                    <OPTION value="华文行楷">华文行楷</OPTION>
                                    <OPTION value="华文中宋">华文中宋</OPTION>
                                    <OPTION value="楷体_GB2312">楷体_GB2312</OPTION>
                                    <OPTION value="隶书">隶书</OPTION>
                                    <OPTION value="宋体">宋体</OPTION>
                                    <OPTION value="新宋体">新宋体</OPTION>
                                    <OPTION value="幼圆">幼圆</OPTION>
                                  </select>
                                    <select name="selectSize" class="chinese" id="select3" onChange="setSize(this.options[this.selectedIndex].value)">
                                      <option selected>字体大小</option>
                                      <option value="6">6</option>
                                      <option value="8">8</option>
                                      <option value="10">10</option>
                                      <option value="12">12</option>
                                      <option value="14">14</option>
                                      <option value="18">18</option>
                                      <option value="24">24</option>
                                      <option value="36">36</option>
                                    </select>
                                    <select name="selectColor" class="chinese" id="selectColor" onChange="setColor(this.options[this.selectedIndex].value)">
                                      <option value="" selected>选择颜色</option>
                                      <option value="red">红色</option>
                                      <option value="blue">蓝色</option>
                                      <option value="yellow">黄色</option>
                                      <option value="green">绿色</option>
                                    </select>
									<br>
									<a href="javascript:" onClick="addBold()"><img src="images/ubb/bold.gif" alt="字体加粗" width="16" height="16" border="0"></a> 
									<a href="javascript:" onClick="addEm()"><img src="images/ubb/italic.gif" alt="字体倾斜" width="16" height="16" border="0"></a> 
									<a href="javascript:" onClick="addUnder()"><img src="images/ubb/underline.gif" alt="加下划线" width="16" height="16" border="0"></a>
									<a href="javascript:" onClick="addFly()"> <img src="images/ubb/fly.gif" alt="移动文字" width="16" height="16" border="0"></a> <img src="images/ubb/separator.gif" width="6" height="16"> 
									<a href="javascript:" onClick="addLeft()"> <img src="images/ubb/left.gif" alt="字体左对齐" width="16" height="16" border="0"></a> 
									<a href="javascript:" onClick="addCenter()"> <img src="images/ubb/center.gif" alt="字体居中" width="16" height="16" border="0"></a> 
									<a href="javascript:" onClick="addRight()"> <img src="images/ubb/right.gif" alt="字体靠右" width="16" height="16" border="0"></a> <img src="images/ubb/separator.gif" width="6" height="16"> 
									<a href="javascript:" onClick="addImages()"><img src="images/ubb/image.gif" alt="引用外部图片" width="16" height="16" border="0"></a>
									<a href="javascript:" onClick="addDate()"><img src="images/ubb/date.gif" alt="插入日期" width="16" height="16" border="0"></a> <img src="images/ubb/separator.gif" width="6" height+"16"> 
									<a href="javascript:" onClick="addQuote()"><img src="images/ubb/quote.gif" alt="插入引用" width="16" height="16" border="0"></a>
									<a href="javascript:" onClick="addURL()"><img src="images/ubb/link.gif" alt="加入超链接" width="16" height="16" border="0"></a>
									<a href="javascript:" onClick="addEmail()"><img src="images/ubb/email.gif" alt="插入Email" width="16" height="16" border="0"></a>
								</tr>
								<% } %>
                                <tr>
                                  <td><textarea onKeyDown="PressKey1();" name="Content" cols="50" rows="6" id="Content" onfocus="this.select()" onmouseover="this.focus()"><%=Content%></textarea><br><span class="info">
                                  （正文内容不能大于 <B><%=LybMaxByte%></B> 个字符，必填。可以按Ctrl+Enter提交！）</span></td>
                                </tr>
                               </table>                              
							</td>
                            <td width="23%">
							<div align="center"><img alt="<%=Face%>" src="images/face/<%=Sex+Face%>.gif"  name="face" width="39" height="70"></div>
							</td>
                          </tr>
                        </table>
						<% if (isFace) {
							out.println("<span class=\"info\">点击表情符号可以将其加入正文：</span><br>");
							out.println("<script>ShowSmile();</script>");
						} %>
					    </td>
                      </tr>
                     
                      <tr>
                        <td height="27" colspan="4" valign="middle"><div align="center">
                            <input type="submit" name="Submit" value="提交" class="button">
                            <input name="action" type="hidden" id="action" value="edit">&nbsp;
                            <input type="reset" name="Reset" value="清除" class="button">
                        </div></td>
                      </tr>
                      <tr>
                        <td height="27" colspan="4" valign="middle"  background="images/bg<%=LybSkin%>.gif">
						<div align="right">&nbsp;&nbsp;</div>
						</td>
                      </tr>
                    </table>
              </form>			  </td>
            </tr>
    </table></td>
  </tr>
</table>
</table>
<%  
	out.println(BottomInfo());
	rs.close();
	stmt.close();
	DBConn.close(); 
%>
</body>
</html>
