<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.lang.Math.*"  %>
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
<title><%=LybTitle%> - ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
<SCRIPT src="inc/post.js"></SCRIPT> 
</head>

<%			
	request.setCharacterEncoding("gb2312");					//���ñ��뷽ʽΪgb2312
	//��������������쳣����
	String action = request.getParameter("action");
	if(action!=null)
	{
	try{
		AdminName = CheckReplace(request.getParameter("AdminName"));;
		AdminUid = CheckReplace(request.getParameter("AdminUid"));
		AdminQQ = CheckReplace(request.getParameter("AdminQQ"));
		AdminMail = CheckReplace(request.getParameter("AdminMail"));
		AdminHomePage = CheckReplace(request.getParameter("AdminHomePage"));
		AdminPhone = CheckReplace(request.getParameter("AdminPhone"));
		AdminAddress = CheckReplace(request.getParameter("AdminAddress"));
		AdminNote = CheckReplace(request.getParameter("AdminNote"));
		
		if(AdminName == null || AdminName.equals("") || AdminUid == null || AdminUid.equals("") || AdminQQ == null || AdminQQ.equals("") || AdminMail == null || AdminMail.equals(""))
		{
			out.println("<br><br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td>");
			out.println("<div align=\"center\" class=\"info\"><br>�� �� Ա���Ʋ���Ϊ�գ�<br>����Ա����ID����Ϊ�գ�<br>�� �� Ա QQ ����Ϊ�գ�");
			out.println("<br>����ԱE-Mail����Ϊ�գ�<br><br>����ϸ�˶��������룡<br>");
			out.println("<br><a href=\"#\" onClick=\"javascript:history.go(-1);\">����</a><br></div></td></tr></table>");
			return;
		}
		
		sql = "update admin set ";
		sql += "AdminName='" + AdminName + "',";
		sql += "AdminUid='" + AdminUid + "',";
		sql += "AdminQQ='" + AdminQQ + "',";
		sql += "AdminMail='" + AdminMail + "',";
		sql += "AdminHomePage='" + AdminHomePage + "',";
		sql += "AdminPhone='" + AdminPhone + "',";
		sql += "AdminAddress='" + AdminAddress + "',";
		sql += "AdminNote='" + AdminNote + "'";
		//sql += "where AdminID=" + AdminID;

		//out.print(sql);
		stmt.executeUpdate(sql);
		stmt.close();
		DBConn.close();
		}catch(SQLException e){
			//out.println(e.getMessage());
			session.setAttribute("error",error2);
			session.setAttribute("url",sPage);
			response.sendRedirect("error.jsp");
			return;
		   }
		out.println("<SCRIPT LANGUAGE='JavaScript'>alert('����Ա�����޸ĳɹ�!');location.href='adminindex.jsp';</SCRIPT>");
	}	
%>


<body>
<%=TopInfo(true)%>
<a name="ly"></a> 
<br>
<table border="0" align="center" width="778"><tr><td valign="top"><table width="100%" height="23%"  border="0" align="center" cellpadding="0" cellspacing="0"><tr><td height="176" align="left" valign="top"><table width="86%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="69" valign="top">
                <form name="form" method="post" onSubmit="return AdminInfoCheck()"action="admininfo.jsp">
                    <table width="80%"  border="1" align="center" cellpadding="6" cellspacing="1" style="border-collapse:collapse">
                      <tr>
                        <td height="25" colspan="2"  background="images/bg<%=LybSkin%>.gif">
                          <div align="center"> </div>
                        <div align="center" class="title">����Ա����</div>						</td>
                      </tr>
                      <tr>
                        <td width="33%" class="chinese"><div align="center" class="chinese">
                          <div align="right">����Ա���ƣ�</div>
                        </div></td>
                        <td width="67%" height="25"><input name="AdminName" type="text" class="chinese" id="AdminName" value="<%=AdminName%>" size="20" maxlength="16"> 
                          &nbsp;<span class="info">(����)</span></td>
                      </tr>
                      <tr>
                        <td class="chinese">
                          <div align="center" class="chinese">
                            <div align="right">����Ա����ID��</div>
                          </div></td>
                        <td height="29"><input name="AdminUid" type="text" class="chinese" id="AdminUid" value="<%=AdminUid%>" size="20" maxlength="20">
                        &nbsp;<span class="info">(����)</span></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="center" class="chinese">
                          <div align="right">����ԱQQ��</div>
                        </div></td>
                        <td height="29"><input name="AdminQQ" type="text" class="chinese" id="AdminQQ" value="<%=AdminQQ%>" size="20" maxlength="9">
                        &nbsp;<span class="info">(����)</span></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">
                          <div align="center" class="chinese">
                            <div align="right">����Ա�绰��</div>
                          </div>
                        </div></td>
                        <td height="29"><input name="AdminPhone" type="text" class="chinese" id="AdminPhone3" value="<%=AdminPhone%>" size="20" maxlength="12"></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">����Ա�������䣺</div></td>
                        <td height="29"><input name="AdminMail" type="text" class="chinese" id="AdminMail" value="<%=AdminMail%>" size="40" maxlength="50">
                        &nbsp;<span class="info">(����)</span></td>
                      </tr>
                      <tr>
                        <td class="chinese"> <div align="center" class="chinese">
                          <div align="right">����Ա������ҳ��</div>
                        </div></td>
                        <td height="29"><input name="AdminHomePage" type="text" class="chinese" id="AdminHomePage" value="<%=AdminHomePage%>" size="40" maxlength="40"></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">����Ա��ϵ��ַ��</div></td>
                        <td height="25"><input name="AdminAddress" type="text" class="chinese" id="AdminAddress" value="<%=AdminAddress%>" size="40" maxlength="50"></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">��ע��</div></td>
                        <td height="25"><textarea name="AdminNote" cols="40" rows="5" class="chinese" id="AdminNote"><%=AdminNote%></textarea></td>
                      </tr>
                      <tr>
                        <td height="27" colspan="2" valign="middle"><div align="center">
                            <input type="submit" name="Submit" value="�ύ" class="button">
                            <input name="action" type="hidden" id="action" value="add">&nbsp;
							<input type="reset" name="Reset" value="���" class="button">
                        </div></td>
                      </tr>
                      <tr>
                        <td height="27" colspan="2" valign="middle"  background="images/bg<%=LybSkin%>.gif">
						<div align="right">&nbsp;&nbsp;</div>
						</td>
                      </tr>
                    </table>
              </form>			  </td>
            </tr>
    </table></td>
  </tr>
</table>
</table>

<%  
	out.println(BottomInfo());
	//rs.close();
	stmt.close();
	DBConn.close(); %>
</body>
</html>
