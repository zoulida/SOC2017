<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.awt.*,java.awt.image.*"%>
<%@ page import="java.util.*,javax.imageio.*,java.io.*"%>
<%@ include file="inc/config.jsp"%>

<jsp:useBean id="Code" scope="page" class="dreamtime.guestbook.VerifyCode"/>

<%! String sVerifyCode; 		//��֤���ַ���  %> 

<%	//����ҳ�治����
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);
	response.reset();
	
	try{
		// ����֤�����SESSION
		//���� runVerifyCode(int i) ,��i�ĳ���Ҫ����֤��λ��
		session.setAttribute("VerifyCode",Code.runVerifyCode(4));
		//session.setMaxInactiveInterval(60);
		
		// ���ͼ��ҳ��
		sVerifyCode = (String)session.getAttribute("VerifyCode");
		OutputStream outs = response.getOutputStream();
		ImageIO.write(Code.CreateImage(sVerifyCode),"JPEG",outs);
		//out.print(sVerifyCode);
	}catch(Exception e){
		//out.println(e.getMessage());
		serror = e.getMessage();
		session.setAttribute("error",serror);
		session.setAttribute("url","login.jsp");
		response.sendRedirect("error.jsp");
	   }
%>

