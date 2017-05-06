<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%@ include file="inc/config.jsp"%>
<%@ include file="inc/style.jsp"%>

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

<%	
	String action = request.getParameter("action");
	if(action!=null && action.equals("add"))
	{
		String Page1  = (String)request.getHeader("Referer");		//�õ�ҳ���ַ��Դ
		String Page2  = request.getRequestURL().toString();			//�õ���ǰҳ���ַ
		String methon = request.getMethod();
		if (methon.equals("POST") && Page2.equals(Page1))
		{
			request.setCharacterEncoding("gb2312");					//���ñ��뷽ʽΪgb2312
			
			String Name=request.getParameter("Name");				//����ȡ�ñ����������Ϣ
			String QQ=request.getParameter("QQ");
			String Mail=request.getParameter("Mail");
			String HomePage=request.getParameter("HomePage");		
			String ComeFrom=request.getParameter("ComeFrom");
			Ip = request.getRemoteAddr();							//�õ��ͻ���Ip��ַ
			String Time = NowTime;									//�õ�����ʱ��,NowTimeΪ��ǰʱ�����
			String Title=request.getParameter("Title");
			String Content=request.getParameter("Content");
			String Face = request.getParameter("Face");
			String Sex = request.getParameter("Sex");
			String Secret  = request.getParameter("Secret");
			String Validate = "Yes";
			
			try{
				sql = "select * from lockip where LockIP='" + Ip + "'";
				rs = stmt.executeQuery(sql);
				//out.println(sql);
				if(rs.next()) 
				{
					serror = "�Ƿ���IP��ַ�������ѱ�����Ա����IP���������Ա��ϵ!";
					session.setAttribute("error",serror);
					session.setAttribute("url","index.jsp");
					response.sendRedirect("error.jsp");
					return;
				}
			}catch(SQLException e){
				//out.println(e.getMessage());
				session.setAttribute("error",error2);
				session.setAttribute("url","addly.jsp");
				response.sendRedirect("error.jsp");
				return;	
				}
				
			if(Name == null || Name.equals("") || Title == null || Title.equals("") || Content == null || Content.equals("") || Content.length() > LybMaxByte)
			{
				out.println("<br><br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td>");
				out.println("<div align=\"center\" class=\"info\"><br>�� �� ������Ϊ�գ�<br>�������ⲻ��Ϊ�գ�<br>�������ݲ���Ϊ�գ�");
				out.println("<br><br>�������ݲ��ܴ���" + LybMaxByte +"���ַ���<br><br>����ϸ�˶��������룡<br>");
				out.println("<br><a href=\"#\" onClick=\"javascript:history.go(-1);\">����</a><br></div></td></tr></table>");
				return;
			}
			Name = CheckReplace(Name);
			Title = CheckReplace(Title);
			if(Name.indexOf(AdminName) != -1 || Name.indexOf("����") != -1 || Name.indexOf("����Ա") != -1)
			{
				out.println("<br><br><br><p><table width=\"640\"  border=\"1\" align=\"center\"><tr height=\"25\"><td>");
				out.println("<div align=\"center\" class=\"info\"><br>��ע�⣺<br>Ϊ�˷�ֹһ���û�ð���������<br>");
				out.println("�����߲���ʹ�ð��������ƣ�Ҳ���ܰ������������͡�����Ա�����ַ���<br>");
				out.println("<br><a href=\"#\" onClick=\"javascript:history.go(-1);\">����</a><br></div></td></tr></table>");
				return;
			}
			
			if(Name.equals(AdminUid)) Name = "���� [" + AdminName + "]"; 
			if(isValidate) Validate = "No";
			if(Face==null || Face.equals("")) Face="04";
			QQ = CheckReplace(QQ);
			Mail = CheckReplace(Mail);
			HomePage = CheckReplace(HomePage);
			ComeFrom = CheckReplace(ComeFrom);
								
			HTMLFilter.setSource(Content);
			HTMLFilter.run();
			Content=HTMLFilter.getResult();
			
			UbbCode.setSource(Content);
			UbbCode.run();
			Content=UbbCode.getResult();
			
			FaceFilter.setSource(Content);
			FaceFilter.run();
			Content=FaceFilter.getResult();
							
			try{
				sql = "insert into guestbook (Name,QQ,Mail,ComeFrom,Ip,UpdateTime,Sex,HomePage,Face,Title,Content,Secret,Validate) values (";
				sql += "'" + Name + "',";
				sql += "'" + QQ + "',";
				sql += "'" + Mail + "',";
				sql += "'" + ComeFrom + "',";
				sql += "'" + Ip + "',";
				sql += "'" + Time + "',";
				sql += "'" + Sex + "',";
				sql += "'" + HomePage + "',";
				sql += "'" + Face + "',";
				sql += "'" + Title + "',";
				sql += "'" + Content + "',";
				sql += "'" + Secret + "',";
				sql += "'" + Validate + "')";
				//out.println(sql);
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
			out.println("<SCRIPT LANGUAGE='JavaScript'>alert('���Գɹ�!');location.href='index.jsp';</SCRIPT>");
		}
		else
 		{
			serror = "�Ƿ��ݽ����ԣ��뵽��������ҳ���������!";
			session.setAttribute("error",serror);
			session.setAttribute("url",sPage);
			response.sendRedirect("error.jsp");
			out.println(methon);
			return;
		}
 	}
%>


<html>
<head>
<title><%=LybTitle%> - ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
<SCRIPT src="inc/ubbcode.js"></SCRIPT> 
<SCRIPT src="inc/post.js"></SCRIPT> 
</head>
<%=TopInfo(false)%> 
<br>               
<body>
<table width="640" border="0" align="center" cellspacing="1">
  <tr>
    <td align="center" valign="middle"><div align="center">
	 <form name="form" method="post" onSubmit="return Check()" action="addly.jsp">
                    <table width="640"  border="1" align="center" cellpadding="6" cellspacing="1" style="border-collapse:collapse">
                      <tr>
                        <td height="25" colspan="4"  background="images/bg<%=LybSkin%>.gif">
                          <div align="center"> </div>
                        <div align="center"><span class="title">��������</span></div>						</td>
                      </tr>
                      <tr>
                        <td width="17%"><div align="center" class="chinese">�� &nbsp;&nbsp;&nbsp;����</div></td>
                        <td width="33%" height="25">
                          <input name="Name" type="text" class="chinese" id="Name" onfocus="this.select()" onmouseover="this.focus()" size="16" maxlength="16">
                        &nbsp;<span class="info">(����) </span></td>
                        <td width="10%" height="25"><div align="center" class="chinese">OICQ��</div></td>
                        <td width="40%">
                            <input name="QQ" type="text" class="chinese" id="QQ" onfocus="this.select()" onmouseover="this.focus()" onkeyup="this.value=this.value.replace(/\D/g,'')" size="16" maxlength="9" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
                      </tr>
                      <tr>
                        <td>
                          <div align="center" class="chinese">�������䣺</div></td>
                        <td height="25">
                            <input name="Mail" type="text" class="chinese" id="Mail" onfocus="this.select()" onmouseover="this.focus()" size="16" maxlength="40"></td>
                        <td height="25"><div align="center" class="chinese">��&nbsp;�ԣ�</div></td>
                        <td>
                          <input name="ComeFrom" type="text" class="chinese" id="ComeFrom" onfocus="this.select()" onmouseover="this.focus()" size="16" maxlength="30"></td>
                      </tr>
                      <tr>
                        <td><div align="center" class="chinese">��&nbsp; &nbsp;��</div></td>
                        <td height="25">
                          <select name="Sex" size="1" class="chinese" id="Sex" onchange="ShowFace()">
							<OPTION value="m" selected>��
							<OPTION value="w">Ů</OPTION>
						  </select>                       
                          <span class="chinese">
                        </span></td>
                        <td height="25"><div align="center" class="chinese">�� �飺</div></td>
                        <td>
							<select name="Face" size="1" class="chinese" id="Face" onChange="ShowFace()">
						<% 
							for(i=0;i<16;i++)
							{
								String sSelect = (FaceID[i].equals("04"))?"SELECTED":"";
								out.print("<option value=\"" + FaceID[i] + "\"" + sSelect + ">" + FaceNote[i] + "</option>");
							}
						%>
							</select>
						</td>
                      </tr>
                      <%if (isSecret) {%>
					  <tr>
					    <td><div align="center" class="chinese">������ҳ��</div></td>
					    <td height="25" colspan="3"><input name="HomePage" type="text" class="chinese" id="HomePage" onfocus="this.select()" onmouseover="this.focus()" size="40" maxlength="80"></td>
				      </tr>
					  <tr>
                        <td> <div align="center" class="chinese">��&nbsp; &nbsp;�ܣ�</div></td>
                        <td height="25" colspan="3"><span class="chinese">
                          <input name="Secret" type="radio" class="chinese" value="Yes">��
						  <input name="Secret" type="radio" class="chinese" value="No" checked>
						��</span><span class="info"> &nbsp;( ѡ���ǡ�������ֻ�й���Ա�ɼ���)</span></td>
                      </tr>
					  <% } %>
                      <tr>
                        <td><div align="center" class="chinese">��&nbsp; &nbsp;&nbsp;�⣺</div></td>
                        <td height="25" colspan="3">
                            <input name="Title" type="text" class="chinese" id="Title" onfocus="this.select()" onmouseover="this.focus()" size="30" maxlength="50">
                            &nbsp;<span class="info">(����)</span></td>
                      </tr>
                      <tr>
                        <td valign="middle"><div align="center">
                              <span class="chinese">�� &nbsp; &nbsp;�ݣ�</span><br><br>
                              <span class="info">��<a href="javascript:CheckLength();">�鿴���ݳ���</a>��</span><br>
                              <span class="info">��<a href="javascript:Replac()"> �� �� �� ��</a>��</span><br>
                              <span class="info">��<a href="javascript:Copy('form.Content')">���Ƶ�������</a>��
                              </span></div><br>
						</td>
                        <td height="25" colspan="3">
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
                                      <option value="��������">��������</option>
                                      <option value="����Ҧ��">����Ҧ��</option>
                                      <option value="����_GB2312">����_GB2312</option>
                                      <option value="����">����</option>
                                      <option value="���Ĳ���">���Ĳ���</option>
                                      <option value="����ϸ��">����ϸ��</option>
                                      <option value="������κ">������κ</option>
                                      <option value="���Ŀ���">���Ŀ���</option>
                                      <option value="�����п�">�����п�</option>
                                      <option value="��������">��������</option>
                                      <option value="����_GB2312">����_GB2312</option>
                                      <option value="����">����</option>
                                      <option value="����">����</option>
                                      <option value="������">������</option>
                                      <option value="��Բ">��Բ</option>
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
								  <a href="javascript:" onClick="addEmail()"><img src="images/ubb/email.gif" alt="����Email" width="16" height="16" border="0"></a>								</tr>
								<% } %>
                                <tr>
                                  <td><textarea name="Content" cols="60" rows="6" class="chinese" id="Content" onfocus="this.select()" onmouseover="this.focus()" onKeyDown="PressKey();"></textarea>
                                  <br><span class="info">
                                  ���������ݲ��ܴ��� <B><%=LybMaxByte%></B> ���ַ���������԰�Ctrl+Enter�ύ����<br>
                                  <%if(isValidate) out.println("������Ա������̨��ˣ����ύ��������ͨ������Ա��֤�Ż���ʾ������</span>"); %></td>
                                </tr>
                              </table>                              
							</td>
                            <td width="23%">
							<div align="center"><img alt="��ѡ������ġ��Ա𡱺͡����顱����ͷ��" src="images/face/m04.gif"  name="face" width="39" height="70"></div>
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
                        <td height="25" colspan="4" valign="middle"><div align="center">
                            <input type="submit" name="Submit" value="�ύ" class="button">
                            <input name="action" type="hidden" id="action" value="add">&nbsp;
                            <input type="reset" name="Reset" value="���" class="button">
                        </div></td>
                      </tr>
                      <tr>
                        <td height="25" colspan="4" valign="middle"  background="images/bg<%=LybSkin%>.gif">
						</td>
                      </tr>
          </table>
        </form>
		
	</div></td>
  </tr>
</table>
<br>
<%=BottomInfo()%>
</body>
</html>