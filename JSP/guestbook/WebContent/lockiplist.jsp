<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="inc/config.jsp"%>
<%@ include file="inc/style.jsp"%>
<%@ include file="session.jsp"%>
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
<title>�鿴����Ա����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>

<table width="100%" height="23%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="176" align="left" valign="top">
      <table width="680"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="69" valign="top"><br>
            <table width="437"  border="1" align="center" cellpadding="6" cellspacing="1" style="border-collapse:collapse">
              <tr>
                <td height="27" class="chinese"  background="images/bg<%=LybSkin%>.gif"><div align="center" class="title">����IP��ַ�б�</div></td>
              </tr>
			<%	try{
					sql = "select * from lockip";
					rs = stmt.executeQuery(sql);
					if (!rs.next())
					{	
						out.println("<tr><td height=\"25\" class=\"chinese\"><div align=\"center\">");
						out.println("��ʱû�б���IP��ַ!</div></td></tr>");
					}
					rs.beforeFirst();
					while(rs.next())
					{
						Ip = rs.getString("LockIP");
						out.println("<tr><td height=\"20\" class=\"chinese\"><div align=\"center\">");
						out.println(Ip + "</div></td></tr>");
					}
				}catch(SQLException e){
						//out.println(e.getMessage());
						session.setAttribute("error",error2);
						session.setAttribute("url","adminly.jsp");
						response.sendRedirect("error.jsp");
						return;
						}
				 %>  
              <tr>
                <td height="25" valign="middle"  background="images/bg<%=LybSkin%>.gif"><div align="center">
				<span class="chinese"><a href="#" onClick="javascript:window.close();">�ر�</a></span></div></td>
              </tr>
            </table>
		  </td>
        </tr>
    </table></td>
  </tr>
</table>
<br><br>
<%  
	rs.close();
	stmt.close();
	DBConn.close(); 
%>
</body>
</html>
