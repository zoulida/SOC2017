<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*,java.lang.Math.*"%>
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
<title><%=LybTitle%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<SCRIPT src="inc/ubbcode.js"></SCRIPT> 
<SCRIPT src="inc/post.js"></SCRIPT> 
</head>
<body>
<%=TopInfo(true)%>
<a name="ly"></a>
<table border="0" align="center" width="778">
  <tr>
    <td valign="top"><table width="100%" height="23%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="176" align="left" valign="top">
          <table width="640"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="69" valign="top">
<%	 
	try{	
		request.setCharacterEncoding("gb2312");					//���ñ��뷽ʽΪgb2312  
		sql="select * from guestbook order by ID DESC";
		rs = stmt.executeQuery(sql);
  	}catch(SQLException e){
			//out.println(e.getMessage());
			session.setAttribute("error",error2);
			session.setAttribute("url",sPage);
			response.sendRedirect("error.jsp");
			return;
			}	
  	//�������û���κμ�¼���ո�����ʾ��Ϣ
  	if (!rs.next()){ 
			out.println("<table width=\"100%\"  border=\"1\" align=\"center\"><tr height=\"25\"><td background=\"images/bg.gif\">");
			out.println("<div align=\"center\" class=\"info\">��ʱ��û���κ����ԣ�</div></td></tr></table>");
			return;
		} 

  	//ȡ�ô���ʾҳ�룬��Ϊ��ǰҳ��
  	strPage = request.getParameter("intPage");
  	try {
  		if(strPage == null || strPage.equals(""))	intPage = 1;
		else intPage = Integer.parseInt(request.getParameter("intPage"));	//���ַ���ת�������� 
		}catch(java.lang.NumberFormatException e){
			intPage = 1;
		}
	//��ȡ��¼���� 
	rs.last(); 
	intRowCount = rs.getRow();
	//������ҳ�� 
	if(intRowCount % intPageSize == 0) intPageCount = intRowCount/intPageSize;
	else intPageCount = (int)Math.floor(intRowCount/intPageSize)+1;
	if(intPageCount == 0) intPageCount = 1;
 	if(intPage < 1) intPage = 1;
	if(intPage > intPageCount) intPage = intPageCount;
	
	//����¼ָ�붨λ������ʾҳ�ĵ�һ����¼�� 
	rs.absolute((intPage-1) * intPageSize+1); 
    NO = intRowCount - (intPage-1)*intPageSize;
   	i = 0; 
	while(i < intPageSize && !rs.isAfterLast()){
	//��������Ϣ
	int ID=rs.getInt("ID");
	String Name=rs.getString("Name");
	String QQ=rs.getString("QQ");
	String Mail=rs.getString("Mail");
	String ComeFrom=rs.getString("ComeFrom");
	String Time=rs.getString("UpdateTime");
	String Title=rs.getString("Title");
	String Sex=rs.getString("Sex");
	String Face=rs.getString("Face");
	String Content=rs.getString("Content");
	String ReContent=rs.getString("ReContent");
	String ReTime=rs.getString("ReTime");
	String IP=rs.getString("IP");
	String EditTime=rs.getString("EditTime");
	boolean Secret=StringToBoolean(rs.getString("Secret"));
	boolean Validate=StringToBoolean(rs.getString("Validate"));
	
%>
<br>
                  <table width="100%"  border="1" align="center" cellpadding="4" cellspacing="1">
                    <tr class="chinese" height="25">
                      <td height="25" background="images/bg<%=LybSkin%>.gif"><div align="left" class="info">&nbsp;&nbsp;<%=NO%>
				      <%if(isValidate)
					  {	
					  		if(Validate) out.println("&nbsp;&nbsp;�� �� ��");
							else out.println("&nbsp;&nbsp;δ �� ��&nbsp;&nbsp;&nbsp;&nbsp;[<a href=\"validate.jsp?id="+ID+"\">ͨ�����</a>]");
					  }
					  %>
				      </div></td>
                      <td width="4%" height="25" colspan="-2" background="images/bg<%=LybSkin%>.gif"><div align="right"><a href="#top" title="�ص�����"><img src="images/top.gif" width="15" height="15" border="0"></a></div></td>
                    </tr>
                    <tr class="chinese" height="25">
                      <td height="25" colspan="2">&nbsp;&nbsp;�����ߣ�&nbsp;<%=Name%>&nbsp;&nbsp;���ԣ�<%=ComeFrom%>&nbsp;&nbsp;&nbsp;&nbsp;IP��<%=IP%>
					  &nbsp;&nbsp;&nbsp;&nbsp;[<a href="lockip.jsp?ip=<%=IP%>&do=lock">��IP</a>]&nbsp;&nbsp;[<a href="lockip.jsp?ip=<%=IP%>&do=unlock">��IP</a>]</td>
                    </tr>
                    <tr class="chinese" height="25">
                      <td height="80" colspan="2" valign="middle"><div align="center"></div>
					    <%  if(EditTime!= null && !EditTime.equals("")) 
							{
								String EditContent = Content + "<br><br><div class=\"info\">&nbsp;&nbsp;&nbsp;&nbsp;";
								EditContent += EditInfo + " �༭ʱ�䣺" + EditTime + "</div>";
								out.println(EditContent);
					  	 	}
							else 
							{ 
								out.println(Content);
					  		}
						%></td>
                    </tr>
                    <tr class="chinese">
                      <td height="40" colspan="2" valign="middle">
					    <% 	if (ReContent == null || ReContent.equals(""))	out.println(NoReplyInfo);
						 	else 
						 	{
								String Reply = ReplyInfo + "��<br><br>" + ReContent + "<br><br><div class=\"info\">";
								Reply += "&nbsp;&nbsp;&nbsp;&nbsp;" + ReplyInfo1 + ReTime + "</div>"; 
						 		out.println(Reply);
						 	}
						 %></td>
                    </tr>
                    <tr valign="bottom" height="27">
                      <td background="images/bg<%=LybSkin%>.gif" height="25" colspan="2">
					  <div align="left"><span class="info">&nbsp;&nbsp;�� �� �ڣ�&nbsp;&nbsp;<%=Time%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    <%
					  		out.print("[<a href=\"javascript:go('delly.jsp?id="+ID+"','��ȷ��Ҫɾ��?')\">ɾ��</a>]"); 
							out.print(" [<a href=\"editly.jsp?id="+ID+"\">�༭</a>] [<a href=\"replyly.jsp?id="+ID+"\">�ظ�</a>]");
					  	%>
                          </span></div>
					  </td>
                    </tr>
                </table>
<% 
	rs.next(); 
    i++;
	NO--; 
  //��ȡ������Ϣ����
  } 
  out.println("<br><div class=\"info\">&nbsp;&nbsp;&nbsp;&nbsp;");
  if(isValidate) out.println("[<a href=\"validate.jsp?id=all\">���ͨ��ȫ������</a>]&nbsp;&nbsp;&nbsp;&nbsp;");
  out.println("[<a href=\"javascript:go('delly.jsp?id=all','�ò�����ɾ���������ԣ������������')\">ɾ����������</a>]&nbsp;&nbsp;&nbsp;&nbsp;");
  out.println("[<a href=\"lockiplist.jsp\" target=\"_blank\">����IP��ַ�б�</a>]");
  out.println("</div>");
  out.println(Page(sPage));
%>

		</td>
      </tr>
    </table></td>
  </tr>
</table>
</table>
<%  out.println(BottomInfo());
	rs.close();
	stmt.close();
	DBConn.close(); 
%>
</body>
</html>
