<%@ page contentType="text/html; charset=gb2312" language="java" isErrorPage="true"%>
<%@ include file="inc/config.jsp"%>
<%@ include file="inc/style.jsp"%>
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
<title>���Ա�������Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
</head>

<%
	request.setCharacterEncoding("gb2312");					//���ñ��뷽ʽΪgb2312
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
                  <td height="27" background="images/bg<%=LybSkin%>.gif" class="info"><div align="center" class="title">����ҳ��</div></td>
                </tr>
                <tr class="chinese" height="25">
                  <td><div align="center" class="chinese"><br>
                    <table cellspacing="4" cellpadding="1">
                      <tr>
                        <td width="511" align="middle">
                          <p align="left"><span class="info">
						  ���ָ�ҳ�棬˵�����Ա���������!<br><br>
                          ���ָô����ԭ���������Ϊ����ȷ������������ɵ�!<br>
                          ������ǹ���Ա��ȷ�����Ա��Ĳ���������ȷ���ұ�֤���ݿ�������ȷ!<br>
                          ������Ҫ���ԷǷ�����ͷǷ��ݽ�!<br>
                          ����ϸ�Ķ������Ա��İ���ϵͳ�Ժ�������! &nbsp;&nbsp; лл!<br><br>
                          �����Ǵ���˵����<br><br>
                          <%=(errorinfo==null)? "" : errorinfo%>
						  </span></p>					    </td>
                      </tr>
                    </table>
                    <br>
                    </div></td>
                </tr>
                <tr>
                <td background="images/bg<%=LybSkin%>.gif" height="20" valign="middle"><div align="center" class="chinese">
				<a href="<%=(errorurl==null)? "" : errorurl%>">����</a></div></td>
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
