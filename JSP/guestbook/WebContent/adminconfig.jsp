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
*		֣���������ó����������û����ʹ��,δ������ͬ�⣬           *
*				���Ͻ�������ҵ��;��	                               *
*                                                                  *
*********************************************************************/
%>

<html>
<head>
<title><%=LybTitle%> - ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
<SCRIPT src="inc/ubbcode.js"></SCRIPT> 
<SCRIPT src="inc/post.js"></SCRIPT> 
</head>

<%			
	request.setCharacterEncoding("gb2312");					//���ñ��뷽ʽΪgb2312
	//��������������쳣����
	String action = request.getParameter("action");
	if(action!=null && action.equals("add"))
	{
	try{
		LybTitle = CheckReplace(request.getParameter("LybTitle"));
		LybHomePage = CheckReplace(request.getParameter("LybHomePage"));
		LybPageSize = Integer.parseInt(request.getParameter("LybPageSize"));
		LybMaxByte =  Integer.parseInt(request.getParameter("LybMaxByte"));
		LybCopyRight = CheckReplace(request.getParameter("LybCopyRight"));
		LybVersion = CheckReplace(request.getParameter("LybVersion"));
		OpenSecret = CheckReplace(request.getParameter("OpenSecret"));
		OpenValidate = CheckReplace(request.getParameter("OpenValidate"));
		OpenUBB = CheckReplace(request.getParameter("OpenUBB"));
		OpenFace = CheckReplace(request.getParameter("OpenFace"));
		EditInfo = CheckReplace(request.getParameter("EditInfo"));
		ReplyInfo = CheckReplace(request.getParameter("ReplyInfo"));
		NoReplyInfo = CheckReplace(request.getParameter("NoReplyInfo"));
		SecretInfo = CheckReplace(request.getParameter("SecretInfo"));
		LybSkin = Integer.parseInt(request.getParameter("LybSkin"));
		}catch(Exception e){
			//out.println(e.getMessage());
			session.setAttribute("error",error1);
			session.setAttribute("url",sPage);
			response.sendRedirect("error.jsp");
			return;
			}	
		
	try{
		sql = "update config set ";
		sql += "LybTitle='" + LybTitle + "',";
		sql += "LybHomePage='" + LybHomePage + "',";
		sql += "LybPageSize=" + LybPageSize + ",";
		sql += "LybMaxByte=" + LybMaxByte + ",";
		sql += "LybCopyRight='" + LybCopyRight + "',";
		sql += "LybVersion='" + LybVersion + "',";
		sql += "OpenSecret='" + OpenSecret + "',";
		sql += "OpenValidate='" + OpenValidate + "',";
		sql += "OpenUBB='" + OpenUBB + "',";
		sql += "OpenFace='"+ OpenFace + "',";
		sql += "EditInfo='" + EditInfo + "',";
		sql += "ReplyInfo='" + ReplyInfo + "',";
		sql += "NoReplyInfo='" + NoReplyInfo + "',";
		sql += "SecretInfo='" + SecretInfo + "',";
		sql += "LybSkin=" + LybSkin;
		//sql += "where LybID=" + LybID;
		
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
		out.println("<SCRIPT LANGUAGE='JavaScript'>alert('���Ա������޸ĳɹ�!');location.href='adminindex.jsp';</SCRIPT>");
	}	
%>


<body>
<%=TopInfo(true)%>
<a name="ly"></a> 
<table border="0" align="center" width="778">
  <tr>
    <td valign="top"><table width="100%" height="23%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="176" align="left" valign="top"><br>
          <table width="86%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="69" valign="top">
                <form name="form" method="post" action="adminconfig.jsp" onSubmit="return AdminConfigCheck();">
                    <table width="80%"  border="1" align="center" cellpadding="6" cellspacing="1" style="border-collapse:collapse">
                      <tr>
                        <td height="25" colspan="2"  background="images/bg<%=LybSkin%>.gif">
                        <div align="center" class="title">���Ա���������</div>						
						</td>
                      </tr>
                      <tr>
                        <td width="36%" class="chinese"><div align="center" class="chinese">
                          <div align="right">���Ա����ƣ�</div>
                        </div></td>
                        <td width="64%" height="25"><input name="LybTitle" type="text" class="chinese" id="LybTitle" value="<%=LybTitle%>" size="30" maxlength="30">
                        &nbsp;<span class="info">(����)</span></td>
                      </tr>
                      <tr>
                        <td class="chinese">
                          <div align="center" class="chinese">
                            <div align="right">���Ա���վ��ҳ��ַ��</div>
                          </div></td>
                        <td height="29"><input name="LybHomePage" type="text" class="chinese" id="LybHomePage" value="<%=LybHomePage%>" size="30" maxlength="50"></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="center" class="chinese">
                          <div align="right">ÿҳ��ʾ���Ե�������</div>
                        </div></td>
                        <td height="29"><input name="LybPageSize" type="text" class="chinese" id="LybPageSize" value="<%=LybPageSize%>" size="2" maxlength="2">
                        &nbsp;<span class="info">(����)</span></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">�������ݵ�����ֽ�����</div></td>
                        <td height="29"><input name="LybMaxByte" type="text" class="chinese" id="LybMaxByte" value="<%=LybMaxByte%>" size="4" maxlength="5">
                        &nbsp;<span class="info">(����)</span></td>
                      </tr>
                      <tr>
                        <td class="chinese"> <div align="center" class="chinese">
                          <div align="right">��Ȩ���У�</div>
                        </div></td>
                        <td height="29"><input name="LybCopyRight" type="text" class="chinese" id="LybCopyRight" value="<%=LybCopyRight%>" size="30" maxlength="50"></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="center" class="chinese">
                          <div align="right">�汾�ţ�</div>
                        </div></td>
                        <td height="25"><input name="LybVersion" type="text" class="chinese" id="LybVersion" value="<%=LybVersion%>" size="30" maxlength="10" readonly></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">���ܹ��ܣ�</div></td>
                        <td height="25" class="chinese">
						<input name="OpenSecret" type="radio" value="Yes" <%=((OpenSecret.toString().equals(("Yes").toString()))?"CHECKED":"")%>>�� 
                        <input <%=((OpenSecret.toString().equals(("No").toString()))?"CHECKED":"")%> name="OpenSecret" type="radio" value="No">�ر�</td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">��̨��ˣ�</div></td>
                        <td height="25" class="chinese">
						<input <%=((OpenValidate.toString().equals(("Yes").toString()))?"CHECKED":"")%> name="OpenValidate" type="radio" value="Yes">��
						<input <%=((OpenValidate.toString().equals(("No").toString()))?"CHECKED":"")%> name="OpenValidate" type="radio" value="No">�ر�</td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">UBB ���ܣ�</div></td>
                        <td height="25" class="chinese">
						<input <%=((OpenUBB.toString().equals(("Yes").toString()))?"CHECKED":"")%> name="OpenUBB" type="radio" value="Yes">��
						<input <%=((OpenUBB.toString().equals(("No").toString()))?"CHECKED":"")%> name="OpenUBB" type="radio" value="No">�ر�</td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">������ţ�</div></td>
                        <td height="25" class="chinese">
						<input <%=((OpenFace.toString().equals(("Yes").toString()))?"CHECKED":"")%> name="OpenFace" type="radio" value="Yes">��
						<input <%=((OpenFace.toString().equals(("No").toString()))?"CHECKED":"")%> name="OpenFace" type="radio" value="No">�ر�</td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">�༭����ʱ����ʾ��Ϣ��</div></td>
                        <td height="25"><input name="EditInfo" type="text" class="chinese" id="EditInfo" value="<%=EditInfo%>" size="30" maxlength="40"></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">�ظ�����ʱ����ʾ��Ϣ��</div></td>
                        <td height="25"><input name="ReplyInfo" type="text" class="chinese" id="ReplyInfo" value="<%=ReplyInfo%>" size="30" maxlength="40"></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">�޻ظ�ʱ����ʾ��Ϣ��</div></td>
                        <td height="25"><input name="NoReplyInfo" type="text" class="chinese" id="NoReplyInfo" value="<%=NoReplyInfo%>" size="30" maxlength="40"></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">���Ļ�ʱ��ʾ����Ϣ��</div></td>
                        <td height="25"><input name="SecretInfo" type="text" class="chinese" id="SecretInfo" value="<%=SecretInfo%>" size="30" maxlength="40"></td>
                      </tr>
                      <tr>
                        <td class="chinese"><div align="right">���Ա����</div></td>
                        <td height="25">
						<select name="LybSkin" size="1" class="chinese" id="LybSkin">
						  <option value="1" <%=((LybSkin==1)?"SELECTED":"")%>>�������</option>
						  <option value="2" <%=((LybSkin==2)?"SELECTED":"")%>>������</option>
						  <option value="3" <%=((LybSkin==3)?"SELECTED":"")%>>�������</option>
						  <option value="4" <%=((LybSkin==4)?"SELECTED":"")%>>���̷��</option>
						  <option value="5" <%=((LybSkin==5)?"SELECTED":"")%>>���Ʒ��</option>
						  <option value="6" <%=((LybSkin==6)?"SELECTED":"")%>>���Ϸ��</option>
						  <option value="7" <%=((LybSkin==7)?"SELECTED":"")%>>��ɫ���</option>
						  <option value="8" <%=((LybSkin==8)?"SELECTED":"")%>>��ɫ���</option>
						</select>
					  </td>
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
              </form></td>
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
