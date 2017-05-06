<%@ page contentType="text/html; charset=gb2312" language="java" isErrorPage="true"%>
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
<title>留言本出错信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
</head>

<%
	request.setCharacterEncoding("gb2312");					//设置编码方式为gb2312
	String errorinfo = (String)session.getAttribute("error");	
	String errorurl = (String)session.getAttribute("url");
%>
<body>
<table width="640" height="23%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="176" align="left" valign="top">
      <table width="640"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="69" valign="top"><br>
 			 <table width="100%"  border="1" align="center" cellpadding="6" cellspacing="1">
                <tr class="chinese" height="25">
                  <td height="27" background="images/bg<%=LybSkin%>.gif" class="info"><div align="center" class="title">错误页面</div></td>
                </tr>
                <tr class="chinese" height="25">
                  <td><div align="center" class="chinese"><br>
                    <table cellspacing="4" cellpadding="1">
                      <tr>
                        <td width="511" align="middle">
                          <p align="left"><span class="info">
						  出现该页面，说明留言本操作有误!<br><br>
                          出现该错误的原因可能是因为不正确的输入或操作造成的!<br>
                          如果您是管理员请确认留言本的参数配置正确并且保证数据库连接正确!<br>
                          请您不要尝试非法输入和非法递交!<br>
                          请仔细阅读本留言本的帮助系统以后再重试! &nbsp;&nbsp; 谢谢!<br><br>
                          以下是错误说明：<br><br>
                          <%=(errorinfo==null)? "" : errorinfo%>
						  </span></p>					    </td>
                      </tr>
                    </table>
                    <br>
                    </div></td>
                </tr>
                <tr>
                <td background="images/bg<%=LybSkin%>.gif" height="20" valign="middle"><div align="center" class="chinese">
				<a href="<%=(errorurl==null)? "" : errorurl%>">返回</a></div></td>
                </tr>
            </table>
			  <br>
			  <br>
          </td>
        </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
