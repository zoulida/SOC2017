<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.lang.Math.*,javax.imageio.*"%>
<%@ include file="inc/config.jsp"%>
<%@ include file="inc/style.jsp"%>

<jsp:useBean id="MD5" scope="page" class="dreamtime.guestbook.MD5"/>

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
<title><%=LybTitle%> - 管理员登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
<SCRIPT src="inc/post.js"></SCRIPT> 
</head>

<%
	request.setCharacterEncoding("gb2312");						//设置编码方式为gb2312
	//处理表单，并进行异常处理
	String action = request.getParameter("action");
	if(action!=null && action.equals("login"))
	{
		String methon = request.getMethod();
		if (methon.equals("POST"))
		{
			try{
				String User = CheckReplace(request.getParameter("User"));;
				String Pwd = CheckReplace(request.getParameter("Pwd"));
				String sCode = request.getParameter("VerifyCode");
				
				//进行MD5加密
				//User = MD5.getMD5ofStr(User);
				Pwd = MD5.getMD5ofStr(Pwd);
						
				sql = "select User,Pwd from admin where AdminID=" + AdminID;
				rs = stmt.executeQuery(sql);
				rs.next();
				AdminUser=rs.getString("User");
				AdminPwd=rs.getString("Pwd");
				
				if(!sCode.equals(session.getAttribute("VerifyCode")))
				{
					out.println("<br><br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td>");
					out.println("<div align=\"center\" class=\"info\">验证码错误，请重新输入！");
					out.println("<br><br><a href=\"login.jsp\">返回</a></div></td></tr></table>");
					return;
				}
				
				if(!User.equals(AdminUser) || !Pwd.equals(AdminPwd))
				{
					out.println("<br><br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td>");
					out.println("<div align=\"center\" class=\"info\">用户名或密码错误，请重新输入！");
					out.println("<br><br><a href=\"login.jsp\">返回</a></div></td></tr></table>");
					return;
				}
				else if(Pwd.equals(AdminPwd)) 
				{
					
					session.setAttribute("Login","Yes");
					//session.setMaxInactiveInterval(300);
					//out.print((String)session.getAttribute("Login")+isLogin);
				}
			}catch(SQLException e){
					//out.println(e.getMessage());
					session.setAttribute("error",error2);
					session.setAttribute("url",sPage);
					response.sendRedirect("error.jsp");
					return;
					}	
				out.println("<SCRIPT LANGUAGE='JavaScript'>alert('登录成功!');location.href='adminindex.jsp';</SCRIPT>");
		}
		else
 		{
			serror = "非法登录，请管理员到登录页面进行登录!";
			session.setAttribute("error",serror);
			session.setAttribute("url",sPage);
			response.sendRedirect("error.jsp");
			out.println(methon);
			return;
		}
	
	}	
	
	// 将认证码存入SESSION
	//session.setAttribute("VerifyCode",Code.runVerifyCode(4));
	//Code = (String)session.getAttribute("VerifyCode");
	//session.setAttribute("VerifyCode",Code.sRand);
	//session.setMaxInactiveInterval(1);
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);
%>



<%=TopInfo(false)%>
<body>
<table width="100%" height="23%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="176" align="left" valign="top">
      <table width="640"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="69" valign="top">
             <br>
			  <table width="640"  border="1" align="center" cellpadding="6" cellspacing="1">
                <tr class="chinese" height="25">
                  <td height="27" background="images/bg<%=LybSkin%>.gif" class="info"><div align="center" class="title">留言本管理员登录页面</div></td>
                </tr>
                <tr class="chinese" height="25">
                  <td valign="middle"><div align="center" class="chinese">
                      <table width="600" border="0" cellspacing="1" cellpadding="2" align="center">
                        <form name="form" method="post" onSubmit="return LoginCheck()" action="login.jsp">
                          <tr>
                            <td height="25" colspan="2" align="center" class=info> 管理员登录</td>
                          </tr>
                          <tr>
                            <td width="284" align="center"><div align="right" class="chinese">用户名:&nbsp;</div></td>
                            <td width="364" align="center"><div align="left">
                              <input name="User" class="chinese" id="User" size="16" maxlength="20">
                            </div></td>
                          </tr>
                          <tr>
                            <td align="center"><div align="right" class="chinese">密　码：</div></td>
                            <td align="center"><div align="left">
                              <input name="Pwd" type="password" class="chinese" id="Pwd" size="16" maxlength="20">
                            </div></td>
                          </tr>
                          <tr>
                            <td align="center"><div align="right" class="chinese">验证码：</div></td>
                            <td align="center"><div align="left" class="info">
                              <input name="VerifyCode" class="chinese" id="VerifyCode" size="16" maxlength="4"> 
                              &nbsp;<img src="verifycode.jsp" alt="请输入该验证码" align="middle">&nbsp;(区分大小写)</div></td>
                          </tr>
                          <tr>
                            <td height="19" colspan="3" align="center" valign="top" class=a3>
                              <div align="center">
                                <br>
                                <input name="Submit" type="submit" class="button" value=" 登录 ">
                                <input name="action" type="hidden" id="action" value="login">&nbsp;
								<input name="Submit" type="reset" class="button" value=" 取消 ">
                            </div></td>
                          </tr>
                        </form>
                    </table>
                    <p>&nbsp;</p>
                      <p>&nbsp;</p>
                      <p><br>
                        <br>
                        <br>
                        <br>
                    </p>
                  </div></td>
                </tr>
                <tr>
                  <td background="images/bg<%=LybSkin%>.gif" height="25" valign="middle"></td>
                </tr>
            </table></td>
        </tr>
    </table></td>
  </tr>
</table>
<br>
<%=BottomInfo()%>
</body>
</html>
