<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.lang.Math.*"  %>
<jsp:useBean id="HTMLFilter" scope="page" class="dreamtime.guestbook.HTMLFilter"/>
<jsp:useBean id="FaceFilter" scope="page" class="dreamtime.guestbook.FaceFilter"/>
<jsp:useBean id="UbbCode" scope="page" class="dreamtime.guestbook.UbbCode"/>
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
<title><%=LybTitle%> - �������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
<SCRIPT src="inc/ubbcode.js"></SCRIPT> 
<SCRIPT src="inc/post.js"></SCRIPT> 
</head>

<%			
	request.setCharacterEncoding("gb2312");					//���ñ��뷽ʽΪgb2312
	//��������������쳣����
	String action = request.getParameter("action");
	if(action!=null)
	{
	try{
		
		LybNote=request.getParameter("Content");
		if(LybNote==null || LybNote.equals("")) LybNote="���޹��棡";
		
		HTMLFilter.setSource(LybNote);
		HTMLFilter.run();
		LybNote=HTMLFilter.getResult();
		
		UbbCode.setSource(LybNote);
		UbbCode.run();
		LybNote=UbbCode.getResult();
		
		FaceFilter.setSource(LybNote);
		FaceFilter.run();
		LybNote=FaceFilter.getResult();
		
		sql = "update config set LybNote='" + LybNote + "'";
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
		out.println("<SCRIPT LANGUAGE='JavaScript'>alert('�����޸ĳɹ�!');location.href='adminindex.jsp';</SCRIPT>");
	}	
%>


<body>
<%=TopInfo(true)%>
<a name="ly"></a> 
<table border="0" align="center" width="778">
  <tr>
    <td width="778" valign="top"><table width="778" height="23%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="813" height="176" align="left" valign="top"><br>
          <table width="640"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="69" valign="top">
                <form name="form" method="post" action="adminnote.jsp">
                    <table width="640"  border="1" align="center" cellpadding="6" cellspacing="1" style="border-collapse:collapse">
                      <tr>
                        <td height="25" colspan="2"  background="images/bg<%=LybSkin%>.gif">
                          <div align="center"> </div>
                        <div align="center" class="title">�������</div></td>
                      </tr>
                      <tr>
                        <td width="17%" class="chinese"><div align="center">�������ݣ�<br>
                            <br>
                            <span class="info">��<a href="javascript:CheckLength();">�鿴���ݳ���</a>��</span><br>
                            <span class="info">��<a href="javascript:Replac()"> �� �� �� ��</a>��</span><br>
                            <span class="info">��<a href="javascript:Copy('form.Content')">���Ƶ�������</a>��</span> </div></td>
                        <td width="83%" height="25"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
                          <% if(isUBB) { %>
                          <tr>
                            <td>
                              <select name="selectFont" class="chinese" id="select2" onChange="setFont(this.options[this.selectedIndex].value)">
                                <option value="Arial" selected>ѡ������</option>
                                <option value="Arial">Arial</option>
                                <option value="Arial Black">Arial Black</option>
                                <option value="Verdana">Verdana</option>
                                <option value="Times New Roman">Times New Roman</option>
                                <option value="Garamond">Garamond</option>
                                <option value="Courier New">Courier New</option>
                                <option value="Webdings">Webdings</option>
                                <option value="Wingdings">Wingdings</option>
                                <option value="����">����</option>
                                <option value="��Բ">��Բ</option>
                                <OPTION value="��������">��������</OPTION>
                                <OPTION value="����Ҧ��">����Ҧ��</OPTION>
                                <OPTION value="����_GB2312">����_GB2312</OPTION>
                                <OPTION value="����">����</OPTION>
                                <OPTION value="���Ĳ���">���Ĳ���</OPTION>
                                <OPTION value="����ϸ��">����ϸ��</OPTION>
                                <OPTION value="������κ">������κ</OPTION>
                                <OPTION value="���Ŀ���">���Ŀ���</OPTION>
                                <OPTION value="�����п�">�����п�</OPTION>
                                <OPTION value="��������">��������</OPTION>
                                <OPTION value="����_GB2312">����_GB2312</OPTION>
                                <OPTION value="����">����</OPTION>
                                <OPTION value="����">����</OPTION>
                                <OPTION value="������">������</OPTION>
                                <OPTION value="��Բ">��Բ</OPTION>
                              </select>
                              <select name="selectSize" class="chinese" id="select3" onChange="setSize(this.options[this.selectedIndex].value)">
                                <option selected>�����С</option>
                                <option value="6">6</option>
                                <option value="8">8</option>
                                <option value="10">10</option>
                                <option value="12">12</option>
                                <option value="14">14</option>
                                <option value="18">18</option>
                                <option value="24">24</option>
                                <option value="36">36</option>
                              </select>
                              <select name="selectColor" class="chinese" id="selectColor" onChange="setColor(this.options[this.selectedIndex].value)">
                                <option value="" selected>ѡ����ɫ</option>
                                <option value="red">��ɫ</option>
                                <option value="blue">��ɫ</option>
                                <option value="yellow">��ɫ</option>
                                <option value="green">��ɫ</option>
                              </select>
                             <br>
								<a href="javascript:" onClick="addBold()"><img src="images/ubb/bold.gif" alt="����Ӵ�" width="16" height="16" border="0"></a> 
								<a href="javascript:" onClick="addEm()"><img src="images/ubb/italic.gif" alt="������б" width="16" height="16" border="0"></a> 
								<a href="javascript:" onClick="addUnder()"><img src="images/ubb/underline.gif" alt="���»���" width="16" height="16" border="0"></a>
								<a href="javascript:" onClick="addFly()"> <img src="images/ubb/fly.gif" alt="�ƶ�����" width="16" height="16" border="0"></a> <img src="images/ubb/separator.gif" width="6" height="16"> 
								<a href="javascript:" onClick="addLeft()"> <img src="images/ubb/left.gif" alt="���������" width="16" height="16" border="0"></a> 
								<a href="javascript:" onClick="addCenter()"> <img src="images/ubb/center.gif" alt="�������" width="16" height="16" border="0"></a> 
								<a href="javascript:" onClick="addRight()"> <img src="images/ubb/right.gif" alt="���忿��" width="16" height="16" border="0"></a> <img src="images/ubb/separator.gif" width="6" height="16"> 
								<a href="javascript:" onClick="addImages()"><img src="images/ubb/image.gif" alt="�����ⲿͼƬ" width="16" height="16" border="0"></a>
								<a href="javascript:" onClick="addDate()"><img src="images/ubb/date.gif" alt="��������" width="16" height="16" border="0"></a> <img src="images/ubb/separator.gif" width="6" height+"16"> 
								<a href="javascript:" onClick="addQuote()"><img src="images/ubb/quote.gif" alt="��������" width="16" height="16" border="0"></a>
								<a href="javascript:" onClick="addURL()"><img src="images/ubb/link.gif" alt="���볬����" width="16" height="16" border="0"></a>
								<a href="javascript:" onClick="addEmail()"><img src="images/ubb/email.gif" alt="����Email" width="16" height="16" border="0"></a>
						    </tr>
                          <% } %>
                          <tr>
                            <td height="90" valign="top"><textarea name="Content" cols="60" rows="6" class="chinese" id="textarea" onKeyDown="PressKey();"><%=LybNote%></textarea></td>
                          </tr>
                        </table>
						<% if (isFace) {
							out.println("<span class=\"info\">���������ſ��Խ���������ģ�</span><br>");
							out.println("<script>ShowSmile();</script>");
						} %>
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
