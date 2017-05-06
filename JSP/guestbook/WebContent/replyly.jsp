<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.lang.Math.*"  %>
<%@ include file="inc/config.jsp"%>
<%@ include file="inc/style.jsp"%>
<%@ include file="session.jsp"%>

<jsp:useBean id="HTMLFilter" scope="page" class="dreamtime.guestbook.HTMLFilter"/>
<jsp:useBean id="FaceFilter" scope="page" class="dreamtime.guestbook.FaceFilter"/>
<jsp:useBean id="UbbCode" scope="page" class="dreamtime.guestbook.UbbCode"/>

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
<title>�ظ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
<SCRIPT src="inc/ubbcode.js"></SCRIPT> 
<SCRIPT src="inc/post.js"></SCRIPT> 
</head>
<%			
	request.setCharacterEncoding("gb2312");					//���ñ��뷽ʽΪgb2312
	//�����������������쳣����
	String action = request.getParameter("action");
	if(action!=null && action.equals("reply"))
	{
		String ReplyContent=request.getParameter("Content");
		if(ReplyContent == null || ReplyContent.equals("") || ReplyContent.length() > LybMaxByte)
		{
			out.println("<br><br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td>");
			out.println("<div align=\"center\" class=\"info\"><br>�ظ��������ݲ���Ϊ�գ�");
			out.println("<br><br>�ظ��������ݲ��ܴ���" + LybMaxByte +"���ַ���<br><br>����ϸ�˶��������룡<br>");
			out.println("<br><a href=\"#\" onClick=\"javascript:history.go(-1);\">����</a><br></div></td></tr></table>");
			return;
		}			
						
		HTMLFilter.setSource(ReplyContent);
		HTMLFilter.run();
		ReplyContent=HTMLFilter.getResult();		
			
		UbbCode.setSource(ReplyContent);
		UbbCode.run();
		ReplyContent=UbbCode.getResult();
		
		FaceFilter.setSource(ReplyContent);
		FaceFilter.run();
		ReplyContent=FaceFilter.getResult();
		
	try{
		id = Integer.parseInt(request.getParameter("id"));
		sql = "update guestbook set ReContent='" + ReplyContent + "',ReTime='"+ NowTime +"' where ID="+id;
		stmt.executeUpdate(sql);
		//stmt.close();
		//DBConn.close();
		}catch(Exception e){
			//out.println(e.getMessage());
			session.setAttribute("error",error2);
			session.setAttribute("url",sPage+"?id="+id);
			response.sendRedirect("error.jsp");
			return;
			}
		out.println("<SCRIPT LANGUAGE='JavaScript'>alert('�ظ����Գɹ�!');location.href='adminly.jsp';</SCRIPT>");
	}
   	
	
	//��ȡָ����ID
	request.setCharacterEncoding("gb2312");								//���ñ��뷽ʽΪgb2312
	try{
		id = Integer.parseInt(request.getParameter("id"));				//���ַ���ת�������� 
		}catch(Exception e){
			//out.println(e.getMessage());
			session.setAttribute("error",error1);
			session.setAttribute("url","adminly.jsp");
			response.sendRedirect("error.jsp");
			return;
			}
	
	try{
		sql="select * from guestbook where id=" +id;					//����SQL���
		rs = stmt.executeQuery(sql);
	}catch(SQLException e){
			//out.println(e.getMessage());
			session.setAttribute("error",error2);
			session.setAttribute("url","adminly.jsp");
			response.sendRedirect("error.jsp");
			return;
			}
		   
	//��������Ϣ
	rs.next();
	int ID=rs.getInt("ID");
	String Name=rs.getString("Name");
	String Content=rs.getString("Content");
	String Sex=rs.getString("Sex");
	String Face=rs.getString("Face");
	String ReContent=rs.getString("ReContent");
	//String Secret=rs.getString("Secret");
	if (ReContent == null || ReContent.equals("")) ReContent = "�ڴ�������Ҫ�ظ������ݣ�";
%>

<body>
<%=TopInfo(true)%>
<a name="ly"></a>
<table border="0" align="center" width="640">
  <tr>
    <td valign="top"><table width="100%" height="23%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="176" align="left" valign="top">
          <br>
          <br>
          <table width="640"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="69" valign="top">
                <form name="form" method="post" action="replyly.jsp" onSubmit="return ReplyCheck()">
                    <table width="100%"  border="1" align="center" cellpadding="6" cellspacing="1" style="border-collapse:collapse">
                      <tr>
                        <td height="25" colspan="2"  background="images/bg<%=LybSkin%>.gif">
                          <div align="center"> </div>
                        <div align="center"><span class="title">�ظ�����</span></div>						</td>
                      </tr>
                      <tr class="chinese">
                        <td width="17%"><div align="center" class="chinese">����������</div></td>
                        <td height="25"><%=Name%>
                        <input name="id" type="hidden" id="id" value="<%=ID%>"></td>
                      </tr>
                      <tr class="chinese">
                        <td><div align="center" class="chinese">��������:</div></td>
                        <td height="25"><%=Content%></td>
                      </tr>
                      <tr>
                        <td valign="middle"><div align="center">
                            <span class="chinese">�ظ����ݣ�</span><br><br>
                            <span class="info">��<a href="javascript:CheckLength();">�鿴���ݳ���</a>��</span><br>
                            <span class="info">��<a href="javascript:Replac()"> �� �� �� ��</a>��</span><br>
							<span class="info">��<a href="javascript:Copy('form.Content')">���Ƶ�������</a>��</span>
							</div><br>
						</td>
                        <td height="27">
						<table width="100%"  border="0" cellpadding="0" cellspacing="0">
						  <tr>
                            <td width="77%">
							<table width="100%"  border="0" cellpadding="0" cellspacing="0">
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
                                    <select name="selectColor" class="chinese" id="select4" onChange="setColor(this.options[this.selectedIndex].value)">
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
                                  <td><textarea onKeyDown="PressKey1();" name="Content" cols="50" rows="6" id="Content" onfocus="this.select()" onmouseover="this.focus()"><%=ReContent%></textarea>
                                    <br>
                                    <span class="info">���ظ����ݲ��ܴ��� <B><%=LybMaxByte%></B> ���ַ���</span></td>
                                </tr>
                               </table>                              
							</td>
                            <td width="23%">
							<div align="center"><img alt="<%=Face%>" src="images/face/<%=Sex+Face%>.gif"  name="face" width="39" height="70"></div>
							</td>
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
                            <input name="action" type="hidden" id="action" value="reply">&nbsp;
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
	rs.close();
	stmt.close();
	DBConn.close(); %>
</body>
</html>