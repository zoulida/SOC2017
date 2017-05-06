<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<jsp:useBean id="DBConn" scope="page" class="dreamtime.guestbook.DBConn"/>

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

<%! 
	Connection conn;				//连接对象
	Statement stmt;					//语句对象 
	int DBType=1;					//数据库类型:0为Access,1为MYSQL,2为MSSQL，请改成您用的数据库
	
	//以下几项请自行修改
	//Access数据库路径，请自行修改
	String dbpath="data/DreamTimeGuestBook.mdb";							

	//请修改相应的MYSQL连接参数,,请自行修改
	String MYSQLserver="localhost";						//MYSQL 服务器的地址
	String MYSQLdbname="DreamTimeGuestBook";			//留言本数据库的名字
	String MYSQLuser="root";							//MYSQL 数据库的登录用户名
	String MYSQLpass="root";						//MYSQL 数据库的登录密码
	String MYSQLport="3306";							//MYSQL 服务器的端口号，默认为3306
	
	//连接　SQL Server 数据库所需各种参数,请自行修改
	String MSSQLserver="localhost";						//SQL Server 服务器的地址
	String MSSQLdbname="DreamTimeGuestBook";			//SQL Server 数据库的名字
	String MSSQLuser="dream";							//SQL Server 数据库的登录用户名
	String MSSQLpass="chfanwsp";						//SQL Server 数据库的登录密码
	String MSSQLport ="1433";		    				//SQL Server 服务器的端口号，默认为1433
%>

<% 
		switch(DBType)
		{
		case 0: 						//为 0 则连接 Access 数据库
			try{
				conn = DBConn.getConnToAccess(application.getRealPath(dbpath));
				stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			}catch(Exception e){
				//out.println(e.getMessage());
				out.println("连接Access数据库出错! 请管理员仔细检查并阅读相应说明文档!");
				e.printStackTrace();
				return;
				}	
			break;
		case 1: 						//为 1 则连接 MYSQL 数据库
			try{
				conn = DBConn.getConnToMySql(MYSQLserver,MYSQLdbname,MYSQLuser,MYSQLpass,MYSQLport);
				stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			}catch(Exception e){
				//out.println(e.getMessage());
				out.println("连接MYSQL数据库出错! 请管理员仔细检查并阅读相应说明文档!");
				return;
				}	
			break;
		case 2: 						//为 2 则连接 SQL Server 数据库
			try{
				conn = DBConn.getConnToSql(MSSQLserver,MSSQLdbname,MSSQLuser,MSSQLpass,MSSQLport);
				stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			}catch(Exception e){
				//out.println(e.getMessage());
				out.println("连接SQL Server数据库出错! 请管理员仔细检查并阅读相应说明文档!");
				return;
				}	
			break;
		default:
			out.println("<br><br><br><p><table width=\"640\"  border=\"0\" align=\"center\"><tr height=\"25\"><td>");
			out.println("<div align=\"center\" class=\"info\">数据库连接配置错误，请管理员仔细检查并阅读相应说明文档!");
			out.println("<br><br><br><a href=\"#\" onClick=\"javascript:window.close();\">关闭</a><br></div></td></tr></table>");
			break;
		}
%>




