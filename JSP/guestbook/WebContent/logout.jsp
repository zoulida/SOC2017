<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page contentType="text/html; charset=gb2312" language="java"%>
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

<%
	session.setAttribute("Login","");
	isLogin = false;
	out.println("<SCRIPT LANGUAGE='JavaScript'>alert('�ɹ��˳�ϵͳ!');location.href='index.jsp';</SCRIPT>");
	//response.sendRedirect("index.jsp");
%>
