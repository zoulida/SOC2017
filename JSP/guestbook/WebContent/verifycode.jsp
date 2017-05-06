<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.awt.*,java.awt.image.*"%>
<%@ page import="java.util.*,javax.imageio.*,java.io.*"%>
<%@ include file="inc/config.jsp"%>

<jsp:useBean id="Code" scope="page" class="dreamtime.guestbook.VerifyCode"/>

<%! String sVerifyCode; 		//验证码字符串  %> 

<%	//设置页面不缓存
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);
	response.reset();
	
	try{
		// 将认证码存入SESSION
		//调用 runVerifyCode(int i) ,把i改成所要的验证码位数
		session.setAttribute("VerifyCode",Code.runVerifyCode(4));
		//session.setMaxInactiveInterval(60);
		
		// 输出图象到页面
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

