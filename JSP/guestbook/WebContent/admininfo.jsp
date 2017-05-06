<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.lang.Math.*"  %>
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

<html>
<head>
<title><%=LybTitle%> - 版主资料</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
<SCRIPT src="inc/post.js"></SCRIPT> 
</head>

<%			
	request.setCharacterEncoding("gb2312");					//设置编码方式为gb2312
	//处理表单，并进行异常处理
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
			out.println("<div align=\"center\" class=\"info\"><br>管 理 员名称不能为空！<br>管理员留言ID不能为空！<br>管 理 员 QQ 不能为空！");
			out.println("<br>管理员E-Mail不能为空！<br><br>请仔细核对您的输入！<br>");
			out.println("<br><a href=\"#\" onClick=\"javascript:history.go(-1);\">返回</a><br></div></td></tr></table>");
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
		out.println("<SCRIPT LANGUAGE='JavaScript'>alert('管理员资料修改成功!');location.href='adminindex.jsp';</SCRIPT>");
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
                        <div align="center" class="title">管理员资料</div>						</td>
                      </tr>
                      <tr>
                        <td width="33%" class="chinese"><div align="center" class="chinese">
                          <div align="right">管理员名称：</div>
                        </div></td>
                        <td width="67%" height="25"><input name="AdminName" type="text" class="chinese" id="AdminName" value="<%=AdminName%>" size="20" maxlength="16"> 
                          &nbsp;<span class="info">(必填)</span></td>
                      </tr>
                      <tr>
                        <td class="chinese">
                          <div align="center" class="chinese">
                            <div align="right">管理员留言ID：</div>
                          </div></td>
                        <td height="29"><input name="AdminUid" type="text" class="chinese" id="AdminUid" value="<%=AdminUid%>" size="20" maxlength="20">
                        &nbsp;<span class="info">(必填)</span></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="center" class="chinese">
                          <div align="right">管理员QQ：</div>
                        </div></td>
                        <td height="29"><input name="AdminQQ" type="text" class="chinese" id="AdminQQ" value="<%=AdminQQ%>" size="20" maxlength="9">
                        &nbsp;<span class="info">(必填)</span></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">
                          <div align="center" class="chinese">
                            <div align="right">管理员电话：</div>
                          </div>
                        </div></td>
                        <td height="29"><input name="AdminPhone" type="text" class="chinese" id="AdminPhone3" value="<%=AdminPhone%>" size="20" maxlength="12"></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">管理员电子邮箱：</div></td>
                        <td height="29"><input name="AdminMail" type="text" class="chinese" id="AdminMail" value="<%=AdminMail%>" size="40" maxlength="50">
                        &nbsp;<span class="info">(必填)</span></td>
                      </tr>
                      <tr>
                        <td class="chinese"> <div align="center" class="chinese">
                          <div align="right">管理员个人主页：</div>
                        </div></td>
                        <td height="29"><input name="AdminHomePage" type="text" class="chinese" id="AdminHomePage" value="<%=AdminHomePage%>" size="40" maxlength="40"></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">管理员联系地址：</div></td>
                        <td height="25"><input name="AdminAddress" type="text" class="chinese" id="AdminAddress" value="<%=AdminAddress%>" size="40" maxlength="50"></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">备注：</div></td>
                        <td height="25"><textarea name="AdminNote" cols="40" rows="5" class="chinese" id="AdminNote"><%=AdminNote%></textarea></td>
                      </tr>
                      <tr>
                        <td height="27" colspan="2" valign="middle"><div align="center">
                            <input type="submit" name="Submit" value="提交" class="button">
                            <input name="action" type="hidden" id="action" value="add">&nbsp;
							<input type="reset" name="Reset" value="清除" class="button">
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
