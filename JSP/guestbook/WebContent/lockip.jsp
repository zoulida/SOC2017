<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ include file="inc/config.jsp"%>
<%@ include file="session.jsp"%>

<%	
	Ip = request.getParameter("ip");
	String Do = request.getParameter("do");
	if(Do != null && !Do.equals(""))
	{
		if(Do.equals("lock")) 
		{
			try{
				sql = "insert into lockip (LockIP) values('" + Ip + "')";
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
				out.println("<SCRIPT LANGUAGE='JavaScript'>alert('封锁成功!');location.href='adminly.jsp';</SCRIPT>");
		}
		
		if(Do.equals("unlock")) 
			{
				try{
					sql = "delete from lockip where LockIP='" + Ip + "'";
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
				out.println("<SCRIPT LANGUAGE='JavaScript'>alert('解除成功!');location.href='adminly.jsp';</SCRIPT>");
		}
	}
%>


