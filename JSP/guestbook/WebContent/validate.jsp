<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
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

<%
	request.setCharacterEncoding("gb2312");						//设置编码方式为gb2312
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
		out.println("<SCRIPT LANGUAGE='JavaScript'>alert('审核所有留言成功!');location.href='adminly.jsp';</SCRIPT>");
	}  
	
	
	try{
		String sValidate = request.getParameter("id");
		if(sValidate.equals("all")) 							//决断是否全部审核
		{
			out.println("<form name=\"form\" method=\"post\" action=\"\">");
			out.println("<br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td>");
			out.println("<div align=\"center\" class=\"info\"><br>该操作将审核通过所有留言，请您再一次确定？<br><br>");
			out.println("<input name=\"action\" type=\"hidden\" id=\"action\" value=\"add\">&nbsp;");
			out.println("<a Title=\"确定审核所有留言\" href=\"#\" onClick=\"javascript:this.document.form.submit();\">确定</a>");
			out.println("<a Title=\"取消审核所有留言\" href=\"#\" onClick=\"javascript:history.go(-1);\">取消</a>");
			out.println("<br></div></td></tr></table></form>"); 
		}
		else
		{
			try{
				id = Integer.parseInt(sValidate);					   			//将字符串转换成整型
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
			out.println("<SCRIPT LANGUAGE='JavaScript'>alert('审核通过!');location.href='adminly.jsp';</SCRIPT>");
		}
	}catch(Exception e){
		//out.println(e.getMessage());
		session.setAttribute("error",error1);
		session.setAttribute("url","adminly.jsp");
		response.sendRedirect("error.jsp");
		return;
		}
%>

