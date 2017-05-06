<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
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
                <td height="27" colspan="2" class="chinese"  background="images/bg<%=LybSkin%>.gif"><div align="center" class="title">查看管理员资料</div></td>
              </tr>
              <tr class="chinese">
                <td width="36%" class="chinese"><div align="center" class="chinese">
                    <div align="right">管理员名称：</div>
                </div></td>
                <td width="64%" height="25"><%=AdminName%></td>
              </tr>
              <tr class="chinese">
                <td class="chinese"><div align="center" class="chinese">
                    <div align="right">管理员QQ：</div>
                </div></td>
                <td height="29"><%=AdminQQ%></td>
              </tr>
              <tr class="chinese">
                <td class="chinese"><div align="right">管理员电子邮箱：</div></td>
                <td height="29"><%=AdminMail%></td>
              </tr>
              <tr class="chinese">
                <td class="chinese">
                  <div align="center" class="chinese">
                    <div align="right">管理员个人主页：</div>
                </div></td>
                <td height="29"><%=AdminHomePage%></td>
              </tr>
              <tr class="chinese">
                <td class="chinese"><div align="center" class="chinese">
                    <div align="right">管理员电话：</div>
                </div></td>
                <td height="25"><%=AdminPhone%></td>
              </tr>
              <tr class="chinese">
                <td class="chinese"><div align="right">管理员联系地址：</div></td>
                <td height="25"><%=AdminAddress%></td>
              </tr>
              <tr class="chinese">
                <td class="chinese"><div align="right">备注：</div></td>
                <td height="25"><%=AdminNote%></td>
              </tr>
              <tr>
                <td height="25" colspan="2" valign="middle"  background="images/bg<%=LybSkin%>.gif"><div align="center"><span class="chinese"><a href="#" onClick="javascript:window.close();">关闭</a></span> </div></td>
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
