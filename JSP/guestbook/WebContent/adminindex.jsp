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
<title><%=LybTitle%> - 后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
</head>

<body>
<%=TopInfo(true)%>
<table width="100%" height="23%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="176" align="left" valign="top">
      <table width="86%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="69" valign="top"><br>
 			 <table width="640"  border="1" align="center" cellpadding="6" cellspacing="1">
                <tr class="chinese" height="25">
                  <td width="640" height="27" background="images/bg<%=LybSkin%>.gif" class="info"><div align="center" class="title">欢迎使用梦想年华JSP版留言本</div></td>
                </tr>
                <tr class="chinese" height="25">
                  <td><div align="center" class="chinese">
                    <table width="572" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="570" align="middle"><div align="center"><span class="info">欢迎使用梦想年华JSP版留言本</span><br>
                        </div></td>
                      </tr>
                      <tr>
                        <td height="413" valign="top">						<p align="center" class="info"><br>
                          基于　JSP　＋　JavaBean 开发</p>
                          <p align="center" class="info">开发平台：Win2003 + Apache2.0.52 + Tomcat5.54 + Mod_jk 1.2.6 + JDK1.5</p>
                          <p align="center" class="info">数据库：可以使用Access、MYSQL、MSSQL三种数据库</p>
                          <p align="center" class="info">开发工具：Dreamweaver MX + JCreator Pro</p>                          
                          <p align="center" class="info"><br>
                          程序名称：梦想年华留言本</p>
                          <p align="center" class="info">程序版本：1.0</p>
                          <p align="center" class="info">程序设计：[梦想年华]</p>
                          <p align="center" class="info">E-Mail:fanwsp@126.com</p>
                          <p align="center" class="info">QQ:122142023</p>
                          <p align="center" class="info">Phone:0731-8087321</p>
                          <p align="center" class="info">HomePage:<a href="http://wsp.hniuca.net">http://wsp.hniuca.net</a></p>
                          <p align="center" class="info"> CopyRight &copy; 2005-2006 DreamTime All Rights Reserved <br>
                            <br>
                        </p>                          </td>
                      </tr>
                    </table>
                  </div></td>
                </tr>
                <tr>
                  <td background="images/bg<%=LybSkin%>.gif" height="20" valign="middle">&nbsp;</td>
                </tr>
            </table>
          </td>
        </tr>
    </table></td>
  </tr>
</table>
<br>
<%=BottomInfo()%>
</body>
</html>
