<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.PrintStream"%>
<%@ include file="conndb.jsp"%>

<% 
/*******************************************************************
*                                                                  *
*                   �����껪 JSP �����Ա�                           *
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

<%!
	//����Ϊϵͳ�õ��ı��������Ա��Ĳ���
	String error1 = "�Ƿ��Ĳ�������!";								//������ʾ��Ϣ
	String error2 = "���ݿ��������!";
	String NowTime=(new java.util.Date()).toLocaleString();			//�õ���ǰʱ��ʱ��
	String dEditInfo = "�������ѱ�����Ա �����껪 �༭����";	   		//�༭����ʱĬ�ϵ���Ϣ
    String dReplyInfo= "���ȷǳ���л��������!";						//�ظ�����ʱĬ�ϵ�ͷ��Ϣ
	String dNoReplyInfo = "���޻ظ�";								//�޻ظ�ʱĬ����ʾ����Ϣ
	String dSecretInfo = "������ֻ�й���Ա�ɼ���";					//���Ļ�ʱĬ����ʾ����Ϣ
	boolean isLogin;												//�Ƿ��¼���
	String sql;														//SQL���
	String serror;													//������ϸ����
	ResultSet rs;
	int id;					//����ID
	String Ip;
	
	int LybID;				//���Ա�ID��ʶ
	String LybTitle;		//���Ա�����
	String LybHomePage;		//��վ��ҳ��ַ
	int LybPageSize;		//����ÿҳ��ʾ�ļ�¼����
	int LybMaxByte;			//������������ֽ���
	String LybCopyRight;	//��Ȩ��Ϣ
	String LybVersion;		//�汾��
	String OpenSecret;		//�Ƿ�����Ļ�����
	String OpenValidate;	//�Ƿ����˹���
	String OpenUBB;			//�Ƿ��UBB����
	String OpenFace;		//�Ƿ�򿪱�����Ź���
	String EditInfo;		//�༭����ʱ����Ϣ
	String ReplyInfo;		//�ظ�����ʱ��ͷ��Ϣ
	String ReplyInfo1;		//�ظ�����ʱ��β��Ϣ
	String NoReplyInfo;		//û�лظ�ʱ����ʾ��Ϣ
	String SecretInfo;		//���Ļ�ʱ����ʾ��Ϣ
	String LybNote;			//���Ա�����
	int LybSkin;			//���Ա��ķ��
	
	boolean isSecret;		//�Ƿ�����Ļ�����
	boolean isValidate;		//�Ƿ����˹���
	boolean isUBB;			//�Ƿ��UBB����
	boolean isFace;			//�Ƿ�򿪱�����Ź���
	
	String TopInfo;			//ҳ��ͷ��Ϣ
	String BottomInfo;		//ҳ���Ȩ��Ϣ
	String s = "";
	
	//����Ϊ����Ա���ϵı�����
	int AdminID;
	String AdminUser;		//��¼�û���
	String AdminPwd;		//��¼����
	String AdminName;		//����Ա����
	String AdminUid;		//����Ա����ID
	String AdminQQ;
	String AdminMail;
	String AdminHomePage;
	String AdminPhone;
	String AdminAddress;
	String AdminNote;
	
	//�����Ƿ������õı�������
	String sPage;
	int intPageSize; 				//һҳ��ʾ�ļ�¼�� 
	int intRowCount; 				//��¼���� 
	int intPageCount; 				//��ҳ�� 
	int intPage; 					//����ʾҳ�� 
	String strPage;					//�õ�ҳ�����ʱ����
	int i; 			
	int NO;							//�ڼ�������
	
	//������Ϣ
	String FaceID [] = {"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16"};
	String FaceNote [] = {"�ÿ���","û�취","������","ƽ����","æ����","���Խ�","�øж�","������","Ҫ���","�ÿ���","Ҫ����","������","������","�ۺ���","�ҿ���","�ú���"};
		   
		   
	/***************************************************************
	��������CheckReplace
	��  �ã�ת��SQL�����ַ���
	��  ����s: �ַ����ͣ���ת�����ַ�
	����ֵ��ת���Ժ���ַ���
	�����ã�String s2 = CheckReplace(s1);
	*****************************************************************/	
	public String CheckReplace(String s)
	{
	    if(s == null || s.equals("")) return " ";
		else
		{
			StringBuffer stringbuffer = new StringBuffer();
			for(int i = 0; i < s.length(); i++)
			{
				char c = s.charAt(i);
				switch(c)
				{
           		case 0: // '�ո�'
					stringbuffer.append("");						//���ν���Ӧ���ַ�ת���ɿո�
					break;
					
				case 10: // '\n'
					stringbuffer.append("<br>");					//���ν���Ӧ���ַ�ת���ɿո�
					break;
					
				case 32: // ' '
					stringbuffer.append("");					
					break;				
					
				case 34: // '"'
					stringbuffer.append("&quot;");
					break;
	
				case 39: // '\''									
					stringbuffer.append("&#039;");
					break;

				case 124: // '|'
					stringbuffer.append(" ");
					break;
				default:
					stringbuffer.append(c);
					break;
				}
			}
			return stringbuffer.toString().trim();					//����ת���Ժ���ַ���
  		}
	}
	
	
	/***************************************************************
	��������StringToBoolean
	��  �ã�ͷ����Ϣ��ʾ
	��  ����AdminLogin: �����ͣ��û��Ƿ��¼��ʶ
	����ֵ���ַ���
	�����ã�out.println(BottomInfo());
	*****************************************************************/	
	public boolean StringToBoolean(String s)
	{
		if (s != null && s.equals("Yes")) return true; 
		else return false;
	}
	
	
	/***************************************************************
	��������TopInfo
	��  �ã�ͷ����Ϣ��ʾ
	��  ����AdminLogin: boolean���û��Ƿ��¼��ʶ
	����ֵ���ַ���
	�����ã�out.println(BottomInfo());
	*****************************************************************/
	public String TopInfo(boolean AdminLogin)
	{
		if(AdminLogin) 
		{
			TopInfo =  "<table width=\"640\" border=\"1\" align=\"center\" cellspacing=\"1\" background=\"images/bg" + LybSkin + ".gif\">";
			TopInfo += "<tr height=\"25\">";
			TopInfo += "<td><div align=\"center\"><a href=\"adminindex.jsp\">������ҳ</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"adminly.jsp\">���Թ���</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"adminconfig.jsp\">��������</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"adminsystem.jsp\">ϵͳ����</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"admininfo.jsp\">��������</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"adminnote.jsp\">�������</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"logout.jsp\">�˳�ϵͳ</a></div></td>";
			TopInfo += "<td><div align=\"center\"><a href=\"help.jsp\">�������</a></div></td>";
			TopInfo += "</tr></table>";
			return TopInfo;
		}
		else 
		{
			TopInfo  = "<table width=\"640\" border=\"1\" align=\"center\" cellspacing=\"1\" background=\"images/bg" + LybSkin + ".gif\">";
			TopInfo += "<tr height=\"25\">";
			TopInfo += "<td width=\"233\"><div align=\"center\" class=\"title\">" + LybTitle + "</div></td>";
			TopInfo += "<td width=\"85\"><div align=\"center\"><a href=\"" + LybHomePage + "\" target=\"_blank\">��վ��ҳ</a></div></td>";
			TopInfo += "<td width=\"85\"><div align=\"center\"><a href=\"addly.jsp\">�������</a></div></td>";
			TopInfo += "<td width=\"85\"><div align=\"center\"><a href=\"index.jsp\">�鿴����</a></div></td>";
			TopInfo += "<td width=\"85\"><div align=\"center\"><a href=\"login.jsp\">�����¼</a></div></td>";
			TopInfo += "<td width=\"85\"><div align=\"center\"><a href=\"help.jsp\">���԰���</a></div></td>";
			TopInfo += "</tr></table>";
			TopInfo += "<br><br><table width=\"640\" border=\"1\" align=\"center\" cellspacing=\"1\" background=\"images/bg" + LybSkin + ".gif\">";
			TopInfo += "<tr height=\"25\">";
			TopInfo += "<td  width=\"100\"><div align=\"center\" class=\"info\">���Ա����棺</div></td>";
			TopInfo += "<td colspan=\"5\" class=\"info\"><marquee width=\"540\" scrolldelay=\"30\" scrollamount=\"1\" onmouseover=\"this.stop()\" onmouseout=\"this.start()\">" + LybNote + "</marquee></td>";
			TopInfo += "</tr>";
			TopInfo += "</table>";
			return TopInfo;
		}
	}
	
	
	/***************************************************************
	��������BootomInfo
	��  �ã��ײ���Ϣ��ʾ
	��  ������
	����ֵ���ַ�����
	�����ã�out.println(BottomInfo());
	*****************************************************************/
	public String BottomInfo()
	{
		BottomInfo = "<table border=\"1\" align=\"center\"><tr><td><table width=\"640\" border=\"0\" cellspacing=\"0\" align=\"center\">";
		BottomInfo += "<tr height=\"20\"><td><div align=\"center\" class=\"foot\">" + LybTitle + "�� <a title=\"������ƣ������껪\" href=\"http://wsp.hniuca.net\" target=\"_blank\">" + LybVersion +"����</a></div></td></tr>";
		BottomInfo += "<tr height=\"20\"><td><div align=\"center\" class=\"foot\">����ά����<a title=\"�鿴����Ա����\" href=\"dispadmininfo.jsp\" target=\"_blank\">" + AdminName + "</a></div></td></tr>";
		BottomInfo += "<tr height=\"20\"><td><div align=\"center\" class=\"foot\">CopyRight &copy; 2005-2006 " + LybCopyRight + " All Rights Reserved</div></td></tr>";
		BottomInfo += "<tr height=\"20\"><td><div align=\"center\" class=\"foot\">QQ��" + AdminQQ + "��E-Mail��" + AdminMail + "��TEL��" + AdminPhone + "</div></td></tr>";
		BottomInfo += "<tr height=\"30\"><td><div align=\"center\" class=\"foot\">&nbsp;&nbsp;[Powered By <a href=\"http://wsp.hniuca.net\" target=\"_blank\">DreamTime</a>]</div></td></tr>";
		BottomInfo += "</table></td><tr></table><br>";
		return BottomInfo;
	}

	
	/***************************************************************
	��������Page
	��  �ã���ҳ��ʾ
	��  ����sPage: �ַ��ͣ���ǰҳ���ļ�·�� 
			���� sPage = request.getServletPath()�õ� 
	����ֵ����ʾ��ҳ���ַ���
	�����ã�out.println(Page(sPage);
	*****************************************************************/
	public String Page(String sPage)
	{
		s  = "<table width=\"100%\"  border=\"0\"><tr>";
		s += "<td width=\"82%\" height=\"30\" class=\"info\"><span class=\"info\">";
		s += "��ǰ��"+intPage+"ҳ/��"+ intPageCount+"ҳ,��"+intRowCount+"����¼,"+intPageSize+"��/ҳ"; 
		
		int showye = intPageCount;
		if(showye>20) showye=20;
		for(i=1;i<=showye;i++)
		{
			if(i==intPage)	s += " " + i + " ";
			else s += " <a href=\""+sPage+"?intPage="+i+"\">" +i+"</a> ";
		}
		
		s += "</span></td>";
		s += "<td width=\"18%\">";
		s += "<table width=\"100%\" border=\"0\">";
		s += "<tr><td><div align=\"right\"><span class=\"info\">��ת��";
		s += "<select name=\"ipage\" class=\"info\" onChange=\"MM_jumpMenu('parent',this,0)\">";
		s += "<option selected>��ѡ��</option>";
		
		for(i=1;i<=intPageCount;i++)
		{
			String sSelect = (i==intPage)?"SELECTED":"";
			s += "<option value=\"" + sPage + "?intPage=" + i + "\"" + sSelect + ">��" + i + "ҳ</option>";
		}
		
		s += "</select></span></div>";
		s += "</td></tr></table>";
		s += "</td></tr></table>";
		return s;
	}
	
%>

<%
	//��ȡϵͳ����������
	request.setCharacterEncoding("gb2312");								//���ñ��뷽ʽΪgb2312
	try{
		sql="select * from admin,config";				 				//����SQL���
		rs = stmt.executeQuery(sql);
		
	rs.next();
	//������Ա����
	AdminID=rs.getInt("AdminID");
	AdminUser=rs.getString("User");
	//AdminPwd=rs.getString("Pwd");
	AdminName=rs.getString("AdminName");
	AdminUid=rs.getString("AdminUid");
	AdminQQ=rs.getString("AdminQQ");
	AdminMail=rs.getString("AdminMail");
	AdminHomePage=rs.getString("AdminHomePage");
	AdminPhone=rs.getString("AdminPhone");
	AdminAddress=rs.getString("AdminAddress");
	AdminNote=rs.getString("AdminNote");

	//�����Ա�������Ϣ
	LybID=rs.getInt("LybID");
	LybTitle=rs.getString("LybTitle");
	LybHomePage=rs.getString("LybHomePage");
	LybPageSize=rs.getInt("LybPageSize");
	LybMaxByte=rs.getInt("LybMaxByte");
	LybCopyRight=rs.getString("LybCopyRight");
	LybVersion=rs.getString("LybVersion");
	OpenSecret=rs.getString("OpenSecret");
	OpenValidate=rs.getString("OpenValidate");
	OpenUBB=rs.getString("OpenUBB");
	OpenFace=rs.getString("OpenFace");
	EditInfo=rs.getString("EditInfo");
	ReplyInfo=rs.getString("ReplyInfo");
	NoReplyInfo=rs.getString("NoReplyInfo");
	SecretInfo=rs.getString("SecretInfo");
	LybSkin=rs.getInt("LybSkin");
	LybNote=rs.getString("LybNote");
	ReplyInfo1 = "����Ա " + AdminName + " �ظ��ڣ� "; 
	//�����Щ��ʾ��ϢΪ�գ����Ĭ��ֵ����ֹϵͳ����!
	if(EditInfo == null || EditInfo.equals("")) EditInfo = dEditInfo;
	if(ReplyInfo == null || ReplyInfo.equals("")) ReplyInfo = dReplyInfo;
	if(NoReplyInfo == null || NoReplyInfo.equals("")) NoReplyInfo = dNoReplyInfo;
	if(SecretInfo == null || SecretInfo.equals("")) SecretInfo = dSecretInfo;
	if(LybPageSize == 0) LybPageSize = 10;
	if(LybMaxByte == 0) LybMaxByte = 1200;
	intPageSize = LybPageSize;				//ÿҳ��ʾ�ļ�¼��
	
	isSecret=StringToBoolean(OpenSecret);
	isValidate=StringToBoolean(OpenValidate);
	isUBB=StringToBoolean(OpenUBB);
	isFace=StringToBoolean(OpenFace);
	
	}catch(SQLException e){
			out.println(e.getMessage());
			session.setAttribute("error",error2);
			//session.setAttribute("url",sPage);
			//response.sendRedirect("error.jsp");
			return;
			}


	//�ж��û��Ƿ��¼��	
	isLogin = StringToBoolean((String)session.getAttribute("Login"));
	
	sPage =	request.getServletPath();
	sPage = sPage.substring(1);
	//out.println(sPage);
%>



