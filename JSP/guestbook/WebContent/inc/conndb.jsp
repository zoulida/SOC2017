<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<jsp:useBean id="DBConn" scope="page" class="dreamtime.guestbook.DBConn"/>

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

<%! 
	Connection conn;				//���Ӷ���
	Statement stmt;					//������ 
	int DBType=1;					//���ݿ�����:0ΪAccess,1ΪMYSQL,2ΪMSSQL����ĳ����õ����ݿ�
	
	//���¼����������޸�
	//Access���ݿ�·�����������޸�
	String dbpath="data/DreamTimeGuestBook.mdb";							

	//���޸���Ӧ��MYSQL���Ӳ���,,�������޸�
	String MYSQLserver="localhost";						//MYSQL �������ĵ�ַ
	String MYSQLdbname="DreamTimeGuestBook";			//���Ա����ݿ������
	String MYSQLuser="root";							//MYSQL ���ݿ�ĵ�¼�û���
	String MYSQLpass="root";						//MYSQL ���ݿ�ĵ�¼����
	String MYSQLport="3306";							//MYSQL �������Ķ˿ںţ�Ĭ��Ϊ3306
	
	//���ӡ�SQL Server ���ݿ�������ֲ���,�������޸�
	String MSSQLserver="localhost";						//SQL Server �������ĵ�ַ
	String MSSQLdbname="DreamTimeGuestBook";			//SQL Server ���ݿ������
	String MSSQLuser="dream";							//SQL Server ���ݿ�ĵ�¼�û���
	String MSSQLpass="chfanwsp";						//SQL Server ���ݿ�ĵ�¼����
	String MSSQLport ="1433";		    				//SQL Server �������Ķ˿ںţ�Ĭ��Ϊ1433
%>

<% 
		switch(DBType)
		{
		case 0: 						//Ϊ 0 ������ Access ���ݿ�
			try{
				conn = DBConn.getConnToAccess(application.getRealPath(dbpath));
				stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			}catch(Exception e){
				//out.println(e.getMessage());
				out.println("����Access���ݿ����! �����Ա��ϸ��鲢�Ķ���Ӧ˵���ĵ�!");
				e.printStackTrace();
				return;
				}	
			break;
		case 1: 						//Ϊ 1 ������ MYSQL ���ݿ�
			try{
				conn = DBConn.getConnToMySql(MYSQLserver,MYSQLdbname,MYSQLuser,MYSQLpass,MYSQLport);
				stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			}catch(Exception e){
				//out.println(e.getMessage());
				out.println("����MYSQL���ݿ����! �����Ա��ϸ��鲢�Ķ���Ӧ˵���ĵ�!");
				return;
				}	
			break;
		case 2: 						//Ϊ 2 ������ SQL Server ���ݿ�
			try{
				conn = DBConn.getConnToSql(MSSQLserver,MSSQLdbname,MSSQLuser,MSSQLpass,MSSQLport);
				stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			}catch(Exception e){
				//out.println(e.getMessage());
				out.println("����SQL Server���ݿ����! �����Ա��ϸ��鲢�Ķ���Ӧ˵���ĵ�!");
				return;
				}	
			break;
		default:
			out.println("<br><br><br><p><table width=\"640\"  border=\"0\" align=\"center\"><tr height=\"25\"><td>");
			out.println("<div align=\"center\" class=\"info\">���ݿ��������ô��������Ա��ϸ��鲢�Ķ���Ӧ˵���ĵ�!");
			out.println("<br><br><br><a href=\"#\" onClick=\"javascript:window.close();\">�ر�</a><br></div></td></tr></table>");
			break;
		}
%>




