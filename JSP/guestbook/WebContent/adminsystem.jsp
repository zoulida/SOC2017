<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.lang.Math.*"  %>
<%@ include file="inc/config.jsp"%>
<%@ include file="inc/style.jsp"%>
<%@ include file="session.jsp"%>
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
<title><%=LybTitle%> - ϵͳ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
<SCRIPT src="inc/ubbcode.js"></SCRIPT> 
<SCRIPT src="inc/post.js"></SCRIPT> 
</head>
<%			
	request.setCharacterEncoding("gb2312");					//���ñ��뷽ʽΪgb2312
	//��������������쳣����
	String action = request.getParameter("action");
	if(action!=null)
	{
	try{
		String User = CheckReplace(request.getParameter("User"));;
		String Pwd = CheckReplace(request.getParameter("Pwd"));
		String NewPwd = CheckReplace(request.getParameter("NewPwd"));
		
		if(User == null || User.equals("") || Pwd == null || Pwd.equals("") || NewPwd == null || NewPwd.equals(""))
		{
			out.println("<br><br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td>");
			out.println("<div align=\"center\" class=\"info\"><br>�û�������Ϊ�գ�<br>�����벻��Ϊ�գ�");
			out.println("<br>�����벻��Ϊ�գ�<br><br>����ϸ�˶��������룡<br>");
			out.println("<br><a href=\"adminsystem.jsp\">����</a><br></div></td></tr></table>");
			return;
		}
		
		//����MD5����
		Pwd = MD5.getMD5ofStr(Pwd);
		NewPwd = MD5.getMD5ofStr(NewPwd);			
		
		sql = "select User,Pwd from admin where AdminID=" + AdminID;
		rs = stmt.executeQuery(sql);
		rs.next();
		AdminPwd=rs.getString("Pwd");
		if(!Pwd.equals(AdminPwd))
		{
			out.println("<br><br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td background=\"images/bg.gif\">");
			out.println("<div align=\"center\" class=\"info\"><br>ԭ����������������룡");
			out.println("<br><br><a href=\"adminsystem.jsp\">����</a></div><br></div></td></tr></table>");
			return;
		}
		else if(Pwd.equals(AdminPwd)) 
		{
			try{
				sql = "update admin set User='" + User + "',Pwd='" + NewPwd + "' where AdminID=" + AdminID;
				//out.print(sql);
				stmt.executeUpdate(sql);
				//rs.close();
				stmt.close();
				DBConn.close();
			}catch(SQLException e){
				//out.println(e.getMessage());
				session.setAttribute("error",error2);
				session.setAttribute("url",sPage);
				response.sendRedirect("error.jsp");
				return;
		   		}
		}
	}catch(SQLException e){
		//out.println(e.getMessage());
		session.setAttribute("error",error2);
		session.setAttribute("url",sPage);
		response.sendRedirect("error.jsp");
		return;
		}
		out.println("<SCRIPT LANGUAGE='JavaScript'>alert('�޸ĳɹ�!');location.href='adminindex.jsp';</SCRIPT>");
	}	
%>


<body>
<%=TopInfo(true)%>
<a name="ly"></a> 
<table width="680" border="0" align="center" cellspacing="1">
  <tr>
    <td align="center"><br>
      <form name="form" method="post" action="adminsystem.jsp" onSubmit="return ModPwdCheck()">
        <table width="80%"  border="1" align="center" cellpadding="6" cellspacing="1" style="border-collapse:collapse">
                          <tr>
                            <td height="25" colspan="2"  background="images/bg<%=LybSkin%>.gif">
                              <div align="center"> </div>
                            <div align="center" class="title">����Ա����</div>
						    </td>
                          </tr>
                          <tr>
                            <td width="36%" class="chinese"><div align="center" class="chinese">
                                <div align="right">�û�����</div>
                            </div></td>
                            <td width="64%" height="25"><input name="User" type="text" class="chinese" id="User" value="<%=AdminUser%>" size="20" maxlength="20"></td>
                          </tr>
                          <tr>
                            <td class="chinese">
                              <div align="center" class="chinese">
                                <div align="right">�����룺</div>
                              </div></td>
                            <td height="29"><input name="Pwd" type="password" class="chinese" id="Pwd" size="20" maxlength="20"></td>
                          </tr>
                          <tr>
                            <td class="chinese"><div align="center" class="chinese">
                                <div align="right">�����룺</div>
                            </div></td>
                            <td height="29"><input name="NewPwd" type="password" class="chinese" id="NewPwd" size="20" maxlength="20"></td>
                          </tr>
                          <tr>
                            <td class="chinese"><div align="right">ȷ�������룺</div></td>
                            <td height="29"><input name="NewPwd2" type="password" class="chinese" id="NewPwd2" size="20" maxlength="20"></td>
                          </tr>
                          <tr>
                            <td height="27" colspan="2" valign="middle"><div align="center">
                                <input type="submit" name="Submit" value="�ύ" class="button">
                                <input name="action" type="hidden" id="action" value="add">&nbsp;
						        <input type="reset" name="Reset" value="���" class="button">
                            </div></td>
                          </tr>
                          <tr>
                            <td height="27" colspan="2" valign="middle"  background="images/bg<%=LybSkin%>.gif">
						    <div align="right">&nbsp;&nbsp;</div>
						    </td>
                          </tr>
        </table>
                        <p><br>
            </p>
                        <p><br>
                            <br>
	                                          </p>
      </form>
    </td></tr>
</table>
<%  
	out.println(BottomInfo());
	//rs.close();
	stmt.close();
	DBConn.close(); %>
</body>
</html>
