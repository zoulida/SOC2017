<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.lang.Math.*,javax.imageio.*"%>
<%@ include file="inc/config.jsp"%>
<%@ include file="inc/style.jsp"%>

<jsp:useBean id="MD5" scope="page" class="dreamtime.guestbook.MD5"/>

<% 
/*******************************************************************
*                                                                  *
*                   �����껪 JSP �����Ա�                          *
*                                                                  *
* 		��Ȩ����: 	wsp.hniuca.net   							   *
*	`	CopyRight	2005-2006 DreamTime All Rights Reserved 	   *
*                                                                  *
*		��������:	[�����껪]                                     *
*           		Email:fanwsp@126.com		                   *
*            		QQ:122142023                                   *
*            		HomePage:http://wsp.hniuca.net                 *
*       														   *
*		֣���������ó����������û����ʹ��,δ������ͬ�⣬        *
*				���Ͻ�������ҵ��;��	                           *
*                                                                  *
*********************************************************************/
%>

<html>
<head>
<title><%=LybTitle%> - ����Ա��¼</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
<SCRIPT src="inc/post.js"></SCRIPT> 
</head>

<%
	request.setCharacterEncoding("gb2312");						//���ñ��뷽ʽΪgb2312
	//��������������쳣����
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
				
				//����MD5����
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
					out.println("<div align=\"center\" class=\"info\">��֤��������������룡");
					out.println("<br><br><a href=\"login.jsp\">����</a></div></td></tr></table>");
					return;
				}
				
				if(!User.equals(AdminUser) || !Pwd.equals(AdminPwd))
				{
					out.println("<br><br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td>");
					out.println("<div align=\"center\" class=\"info\">�û���������������������룡");
					out.println("<br><br><a href=\"login.jsp\">����</a></div></td></tr></table>");
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
				out.println("<SCRIPT LANGUAGE='JavaScript'>alert('��¼�ɹ�!');location.href='adminindex.jsp';</SCRIPT>");
		}
		else
 		{
			serror = "�Ƿ���¼�������Ա����¼ҳ����е�¼!";
			session.setAttribute("error",serror);
			session.setAttribute("url",sPage);
			response.sendRedirect("error.jsp");
			out.println(methon);
			return;
		}
	
	}	
	
	// ����֤�����SESSION
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
                  <td height="27" background="images/bg<%=LybSkin%>.gif" class="info"><div align="center" class="title">���Ա�����Ա��¼ҳ��</div></td>
                </tr>
                <tr class="chinese" height="25">
                  <td valign="middle"><div align="center" class="chinese">
                      <table width="600" border="0" cellspacing="1" cellpadding="2" align="center">
                        <form name="form" method="post" onSubmit="return LoginCheck()" action="login.jsp">
                          <tr>
                            <td height="25" colspan="2" align="center" class=info> ����Ա��¼</td>
                          </tr>
                          <tr>
                            <td width="284" align="center"><div align="right" class="chinese">�û���:&nbsp;</div></td>
                            <td width="364" align="center"><div align="left">
                              <input name="User" class="chinese" id="User" size="16" maxlength="20">
                            </div></td>
                          </tr>
                          <tr>
                            <td align="center"><div align="right" class="chinese">�ܡ��룺</div></td>
                            <td align="center"><div align="left">
                              <input name="Pwd" type="password" class="chinese" id="Pwd" size="16" maxlength="20">
                            </div></td>
                          </tr>
                          <tr>
                            <td align="center"><div align="right" class="chinese">��֤�룺</div></td>
                            <td align="center"><div align="left" class="info">
                              <input name="VerifyCode" class="chinese" id="VerifyCode" size="16" maxlength="4"> 
                              &nbsp;<img src="verifycode.jsp" alt="���������֤��" align="middle">&nbsp;(���ִ�Сд)</div></td>
                          </tr>
                          <tr>
                            <td height="19" colspan="3" align="center" valign="top" class=a3>
                              <div align="center">
                                <br>
                                <input name="Submit" type="submit" class="button" value=" ��¼ ">
                                <input name="action" type="hidden" id="action" value="login">&nbsp;
								<input name="Submit" type="reset" class="button" value=" ȡ�� ">
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
