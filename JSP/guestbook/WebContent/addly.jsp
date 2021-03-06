<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ include file="inc/config.jsp"%>
<%@ include file="inc/style.jsp"%>

<jsp:useBean id="HTMLFilter" scope="page" class="dreamtime.guestbook.HTMLFilter"/>
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

<%	
	String action = request.getParameter("action");
	if(action!=null && action.equals("add"))
	{
		String Page1  = (String)request.getHeader("Referer");		//得到页面地址来源
		String Page2  = request.getRequestURL().toString();			//得到当前页面地址
		String methon = request.getMethod();
		if (methon.equals("POST") && Page2.equals(Page1))
		{
			request.setCharacterEncoding("gb2312");					//设置编码方式为gb2312
			
			String Name=request.getParameter("Name");				//依次取得表彰输入的信息
			String QQ=request.getParameter("QQ");
			String Mail=request.getParameter("Mail");
			String HomePage=request.getParameter("HomePage");		
			String ComeFrom=request.getParameter("ComeFrom");
			Ip = request.getRemoteAddr();							//得到客户端Ip地址
			String Time = NowTime;									//得到留言时间,NowTime为当前时间变量
			String Title=request.getParameter("Title");
			String Content=request.getParameter("Content");
			String Face = request.getParameter("Face");
			String Sex = request.getParameter("Sex");
			String Secret  = request.getParameter("Secret");
			String Validate = "Yes";
			
			try{
				sql = "select * from lockip where LockIP='" + Ip + "'";
				rs = stmt.executeQuery(sql);
				//out.println(sql);
				if(rs.next()) 
				{
					serror = "非法的IP地址，可能已被管理员封了IP，请与管理员联系!";
					session.setAttribute("error",serror);
					session.setAttribute("url","index.jsp");
					response.sendRedirect("error.jsp");
					return;
				}
			}catch(SQLException e){
				//out.println(e.getMessage());
				session.setAttribute("error",error2);
				session.setAttribute("url","addly.jsp");
				response.sendRedirect("error.jsp");
				return;	
				}
				
			if(Name == null || Name.equals("") || Title == null || Title.equals("") || Content == null || Content.equals("") || Content.length() > LybMaxByte)
			{
				out.println("<br><br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td>");
				out.println("<div align=\"center\" class=\"info\"><br>用 户 名不能为空！<br>留言主题不能为空！<br>留言内容不能为空！");
				out.println("<br><br>留言内容不能大于" + LybMaxByte +"个字符！<br><br>请仔细核对您的输入！<br>");
				out.println("<br><a href=\"#\" onClick=\"javascript:history.go(-1);\">返回</a><br></div></td></tr></table>");
				return;
			}
			Name = CheckReplace(Name);
			Title = CheckReplace(Title);
			if(Name.indexOf(AdminName) != -1 || Name.indexOf("版主") != -1 || Name.indexOf("管理员") != -1)
			{
				out.println("<br><br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td>");
				out.println("<div align=\"center\" class=\"info\"><br>请注意：<br>为了防止一般用户冒充版主留言<br>");
				out.println("留言者不能使用版主的名称，也不能包含“版主”和“管理员”等字符！<br>");
				out.println("<br><a href=\"#\" onClick=\"javascript:history.go(-1);\">返回</a><br></div></td></tr></table>");
				return;
			}
			
			if(Name.equals(AdminUid)) Name = "版主 [" + AdminName + "]"; 
			if(isValidate) Validate = "No";
			if(Face==null || Face.equals("")) Face="04";
			QQ = CheckReplace(QQ);
			Mail = CheckReplace(Mail);
			HomePage = CheckReplace(HomePage);
			ComeFrom = CheckReplace(ComeFrom);
								
			HTMLFilter.setSource(Content);
			HTMLFilter.run();
			Content=HTMLFilter.getResult();
			
			UbbCode.setSource(Content);
			UbbCode.run();
			Content=UbbCode.getResult();
			
			FaceFilter.setSource(Content);
			FaceFilter.run();
			Content=FaceFilter.getResult();
							
			try{
				sql = "insert into guestbook (Name,QQ,Mail,ComeFrom,Ip,UpdateTime,Sex,HomePage,Face,Title,Content,Secret,Validate) values (";
				sql += "'" + Name + "',";
				sql += "'" + QQ + "',";
				sql += "'" + Mail + "',";
				sql += "'" + ComeFrom + "',";
				sql += "'" + Ip + "',";
				sql += "'" + Time + "',";
				sql += "'" + Sex + "',";
				sql += "'" + HomePage + "',";
				sql += "'" + Face + "',";
				sql += "'" + Title + "',";
				sql += "'" + Content + "',";
				sql += "'" + Secret + "',";
				sql += "'" + Validate + "')";
				//out.println(sql);
				stmt.executeUpdate(sql);
				stmt.close();
				DBConn.close();
				}catch(SQLException e){
					//out.println(e.getMessage());
					session.setAttribute("error",error2);
					session.setAttribute("url",sPage);
					response.sendRedirect("error.jsp");
					return;
				   }
			out.println("<SCRIPT LANGUAGE='JavaScript'>alert('留言成功!');location.href='index.jsp';</SCRIPT>");
		}
		else
 		{
			serror = "非法递交留言，请到添加留言页面进行留言!";
			session.setAttribute("error",serror);
			session.setAttribute("url",sPage);
			response.sendRedirect("error.jsp");
			out.println(methon);
			return;
		}
 	}
%>


<html>
<head>
<title><%=LybTitle%> - 添加留言</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
<SCRIPT src="inc/ubbcode.js"></SCRIPT> 
<SCRIPT src="inc/post.js"></SCRIPT> 
</head>
<%=TopInfo(false)%> 
<br>               
<body>
<table width="640" border="0" align="center" cellspacing="1">
  <tr>
    <td align="center" valign="middle"><div align="center">
	 <form name="form" method="post" onSubmit="return Check()" action="addly.jsp">
                    <table width="640"  border="1" align="center" cellpadding="6" cellspacing="1" style="border-collapse:collapse">
                      <tr>
                        <td height="25" colspan="4"  background="images/bg<%=LybSkin%>.gif">
                          <div align="center"> </div>
                        <div align="center"><span class="title">添加留言</span></div>						</td>
                      </tr>
                      <tr>
                        <td width="17%"><div align="center" class="chinese">姓 &nbsp;&nbsp;&nbsp;名：</div></td>
                        <td width="33%" height="25">
                          <input name="Name" type="text" class="chinese" id="Name" onfocus="this.select()" onmouseover="this.focus()" size="16" maxlength="16">
                        &nbsp;<span class="info">(必填) </span></td>
                        <td width="10%" height="25"><div align="center" class="chinese">OICQ：</div></td>
                        <td width="40%">
                            <input name="QQ" type="text" class="chinese" id="QQ" onfocus="this.select()" onmouseover="this.focus()" onkeyup="this.value=this.value.replace(/\D/g,'')" size="16" maxlength="9" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
                      </tr>
                      <tr>
                        <td>
                          <div align="center" class="chinese">电子邮箱：</div></td>
                        <td height="25">
                            <input name="Mail" type="text" class="chinese" id="Mail" onfocus="this.select()" onmouseover="this.focus()" size="16" maxlength="40"></td>
                        <td height="25"><div align="center" class="chinese">来&nbsp;自：</div></td>
                        <td>
                          <input name="ComeFrom" type="text" class="chinese" id="ComeFrom" onfocus="this.select()" onmouseover="this.focus()" size="16" maxlength="30"></td>
                      </tr>
                      <tr>
                        <td><div align="center" class="chinese">性&nbsp; &nbsp;别：</div></td>
                        <td height="25">
                          <select name="Sex" size="1" class="chinese" id="Sex" onchange="ShowFace()">
							<OPTION value="m" selected>男
							<OPTION value="w">女</OPTION>
						  </select>                       
                          <span class="chinese">
                        </span></td>
                        <td height="25"><div align="center" class="chinese">表 情：</div></td>
                        <td>
							<select name="Face" size="1" class="chinese" id="Face" onChange="ShowFace()">
						<% 
							for(i=0;i<16;i++)
							{
								String sSelect = (FaceID[i].equals("04"))?"SELECTED":"";
								out.print("<option value=\"" + FaceID[i] + "\"" + sSelect + ">" + FaceNote[i] + "</option>");
							}
						%>
							</select>
						</td>
                      </tr>
                      <%if (isSecret) {%>
					  <tr>
					    <td><div align="center" class="chinese">个人主页：</div></td>
					    <td height="25" colspan="3"><input name="HomePage" type="text" class="chinese" id="HomePage" onfocus="this.select()" onmouseover="this.focus()" size="40" maxlength="80"></td>
				      </tr>
					  <tr>
                        <td> <div align="center" class="chinese">保&nbsp; &nbsp;密：</div></td>
                        <td height="25" colspan="3"><span class="chinese">
                          <input name="Secret" type="radio" class="chinese" value="Yes">是
						  <input name="Secret" type="radio" class="chinese" value="No" checked>
						否</span><span class="info"> &nbsp;( 选“是”则留言只有管理员可见。)</span></td>
                      </tr>
					  <% } %>
                      <tr>
                        <td><div align="center" class="chinese">主&nbsp; &nbsp;&nbsp;题：</div></td>
                        <td height="25" colspan="3">
                            <input name="Title" type="text" class="chinese" id="Title" onfocus="this.select()" onmouseover="this.focus()" size="30" maxlength="50">
                            &nbsp;<span class="info">(必填)</span></td>
                      </tr>
                      <tr>
                        <td valign="middle"><div align="center">
                              <span class="chinese">内 &nbsp; &nbsp;容：</span><br><br>
                              <span class="info">『<a href="javascript:CheckLength();">查看内容长度</a>』</span><br>
                              <span class="info">『<a href="javascript:Replac()"> 替 换 内 容</a>』</span><br>
                              <span class="info">『<a href="javascript:Copy('form.Content')">复制到剪贴板</a>』
                              </span></div><br>
						</td>
                        <td height="25" colspan="3">
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
                                      <option value="方正舒体">方正舒体</option>
                                      <option value="方正姚体">方正姚体</option>
                                      <option value="仿宋_GB2312">仿宋_GB2312</option>
                                      <option value="黑体">黑体</option>
                                      <option value="华文彩云">华文彩云</option>
                                      <option value="华文细黑">华文细黑</option>
                                      <option value="华文新魏">华文新魏</option>
                                      <option value="华文楷体">华文楷体</option>
                                      <option value="华文行楷">华文行楷</option>
                                      <option value="华文中宋">华文中宋</option>
                                      <option value="楷体_GB2312">楷体_GB2312</option>
                                      <option value="隶书">隶书</option>
                                      <option value="宋体">宋体</option>
                                      <option value="新宋体">新宋体</option>
                                      <option value="幼圆">幼圆</option>
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
                                    <select name="selectColor" class="chinese" id="select4" onChange="setColor(this.options[this.selectedIndex].value)">
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
								  <a href="javascript:" onClick="addEmail()"><img src="images/ubb/email.gif" alt="插入Email" width="16" height="16" border="0"></a>								</tr>
								<% } %>
                                <tr>
                                  <td><textarea name="Content" cols="60" rows="6" class="chinese" id="Content" onfocus="this.select()" onmouseover="this.focus()" onKeyDown="PressKey();"></textarea>
                                  <br><span class="info">
                                  （正文内容不能大于 <B><%=LybMaxByte%></B> 个字符，必填。可以按Ctrl+Enter提交！）<br>
                                  <%if(isValidate) out.println("（管理员开启后台审核，您提交的留言需通过管理员验证才会显示出来）</span>"); %></td>
                                </tr>
                              </table>                              
							</td>
                            <td width="23%">
							<div align="center"><img alt="请选择上面的“性别”和“表情”更换头像" src="images/face/m04.gif"  name="face" width="39" height="70"></div>
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
                        <td height="25" colspan="4" valign="middle"><div align="center">
                            <input type="submit" name="Submit" value="提交" class="button">
                            <input name="action" type="hidden" id="action" value="add">&nbsp;
                            <input type="reset" name="Reset" value="清除" class="button">
                        </div></td>
                      </tr>
                      <tr>
                        <td height="25" colspan="4" valign="middle"  background="images/bg<%=LybSkin%>.gif">
						</td>
                      </tr>
          </table>
        </form>
		
	</div></td>
  </tr>
</table>
<br>
<%=BottomInfo()%>
</body>
</html>