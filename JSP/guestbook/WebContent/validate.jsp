<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
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

<%
	request.setCharacterEncoding("gb2312");						//���ñ��뷽ʽΪgb2312
	String action = request.getParameter("action");
	if(action!=null && action.equals("add"))  
	{
		try{ 
				sql="update guestbook set Validate='Yes'";
				stmt.executeUpdate(sql);
			}catch(SQLException e){
				//out.println(e.getMessage());
				session.setAttribute("error",error2);
				session.setAttribute("url","adminly.jsp");
				response.sendRedirect("error.jsp");
				return;
				}
		//rs.close();
		stmt.close();
		DBConn.close(); 
		out.println("<SCRIPT LANGUAGE='JavaScript'>alert('����������Գɹ�!');location.href='adminly.jsp';</SCRIPT>");
	}  
	
	
	try{
		String sValidate = request.getParameter("id");
		if(sValidate.equals("all")) 							//�����Ƿ�ȫ�����
		{
			out.println("<form name=\"form\" method=\"post\" action=\"\">");
			out.println("<br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td>");
			out.println("<div align=\"center\" class=\"info\"><br>�ò��������ͨ���������ԣ�������һ��ȷ����<br><br>");
			out.println("<input name=\"action\" type=\"hidden\" id=\"action\" value=\"add\">&nbsp;");
			out.println("<a Title=\"ȷ�������������\" href=\"#\" onClick=\"javascript:this.document.form.submit();\">ȷ��</a>");
			out.println("<a Title=\"ȡ�������������\" href=\"#\" onClick=\"javascript:history.go(-1);\">ȡ��</a>");
			out.println("<br></div></td></tr></table></form>"); 
		}
		else
		{
			try{
				id = Integer.parseInt(sValidate);					   			//���ַ���ת��������
				sql="update guestbook set Validate='Yes' where id=" +id;
				stmt.executeUpdate(sql);
        		}catch(Exception e){
					//out.println(e.getMessage());
					session.setAttribute("error",error2);
					session.setAttribute("url","adminly.jsp");
					response.sendRedirect("error.jsp");
					return;
					}
			stmt.close();
			out.println("<SCRIPT LANGUAGE='JavaScript'>alert('���ͨ��!');location.href='adminly.jsp';</SCRIPT>");
		}
	}catch(Exception e){
		//out.println(e.getMessage());
		session.setAttribute("error",error1);
		session.setAttribute("url","adminly.jsp");
		response.sendRedirect("error.jsp");
		return;
		}
%>

