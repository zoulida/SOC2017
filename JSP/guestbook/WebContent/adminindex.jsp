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
<title><%=LybTitle%> - ��̨����ϵͳ</title>
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
                  <td width="640" height="27" background="images/bg<%=LybSkin%>.gif" class="info"><div align="center" class="title">��ӭʹ�������껪JSP�����Ա�</div></td>
                </tr>
                <tr class="chinese" height="25">
                  <td><div align="center" class="chinese">
                    <table width="572" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="570" align="middle"><div align="center"><span class="info">��ӭʹ�������껪JSP�����Ա�</span><br>
                        </div></td>
                      </tr>
                      <tr>
                        <td height="413" valign="top">						<p align="center" class="info"><br>
                          ���ڡ�JSP������JavaBean ����</p>
                          <p align="center" class="info">����ƽ̨��Win2003 + Apache2.0.52 + Tomcat5.54 + Mod_jk 1.2.6 + JDK1.5</p>
                          <p align="center" class="info">���ݿ⣺����ʹ��Access��MYSQL��MSSQL�������ݿ�</p>
                          <p align="center" class="info">�������ߣ�Dreamweaver MX + JCreator Pro</p>                          
                          <p align="center" class="info"><br>
                          �������ƣ������껪���Ա�</p>
                          <p align="center" class="info">����汾��1.0</p>
                          <p align="center" class="info">������ƣ�[�����껪]</p>
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
