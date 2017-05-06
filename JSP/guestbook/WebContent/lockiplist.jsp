<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="inc/config.jsp"%>
<%@ include file="inc/style.jsp"%>
<%@ include file="session.jsp"%>
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
<title>查看管理员资料</title>
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
                <td height="27" class="chinese"  background="images/bg<%=LybSkin%>.gif"><div align="center" class="title">被封IP地址列表</div></td>
              </tr>
			<%	try{
					sql = "select * from lockip";
					rs = stmt.executeQuery(sql);
					if (!rs.next())
					{	
						out.println("<tr><td height=\"25\" class=\"chinese\"><div align=\"center\">");
						out.println("暂时没有被封IP地址!</div></td></tr>");
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
				<span class="chinese"><a href="#" onClick="javascript:window.close();">关闭</a></span></div></td>
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
