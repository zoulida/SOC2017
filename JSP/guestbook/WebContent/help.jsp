<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="inc/config.jsp"%>
<%@ include file="inc/style.jsp"%>
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
<title><%=LybTitle%> - ������Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  
</head>

<%=TopInfo(isLogin)%>
<body>
<table width="100%" height="23%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="176" align="left" valign="top">
      <table width="640"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="69" valign="top"><br>
 			 <table width="640"  border="1" align="center" cellpadding="6" cellspacing="1">
                <tr class="chinese" height="25">
                  <td height="27" background="images/bg<%=LybSkin%>.gif" class="info"><div align="center" class="title"><%=LybTitle%>����ϵͳ</div></td>
                </tr>
                <tr class="chinese" height="25">
                  <td><div align="center" class="chinese">
                    <table cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="middle"><div align="center"><br>
                        </div></td>
                      </tr>
                      <tr>
                        <td valign="top"><p class="title"><strong>һ����ӭʹ��<%=LybTitle%>����ϵͳ�� </strong> </p>
                          <p class="chinese">1���û�������ʱ����������������� ' &quot; | �������ַ�����Ӱ��ϵͳ�������С�<br>
  2������ð��������ԡ�<br>
  3������ʱ��ʹ���������<br>
  4������ʱ���������⣬���ݲ���Ϊ�գ�̫�٣���̫�ࡣ�������ݲ��ܳ����涨������ַ�����<br>
  5��QQ��Email��HomePage�����Ϊ�գ������������䡣<br>
  6���û����Կ���ѡ���Ƿ��ܣ����ѡ���ǣ�������ֻ�й���Ա���Կ�����<br>
  7��֧��UBB��������š����������Ա�ں�̨�رոù��ܣ�����ʹ�ã�<br>
  8��Ĭ������û����������Լ�����ʾ���������Ա������˹��ܣ�������Ҫͨ������Ա��˲ſ��Կ�����<br>
  9��������ԣ����뱣���汾�Ŵ������ӻ����� 


 [Powered  By <a href="http://wsp.hniuca.net">DreamTime</a>]  ��Ȩ������Ҳ�����������Ӱɡ�<br>
  10�����汾�����û������ʹ�ã�������������ҵĿ�ġ���ҵ�û���������ϵ��<br>
  11��������ӭ���ƺʹ��������뱣֤����������ԣ�����һ�е�����ĵ���<br>
  12���������� [<a href="http://wsp.hniuca.net">DreamTime</a>] �������а�Ȩ��</p>
                          <p><br>
                              <strong class="title">�����������ñ����Բ��������»�� </strong></p>
                          <p class="chinese">��һ��ɿ�����ܡ��ƻ��ܷ��ͷ��ɡ���������ʵʩ�ģ� <br>
  ������ɿ���߸�������Ȩ���Ʒ���������ƶȵģ� <br>
  ������ɿ�����ѹ��ҡ��ƻ�����ͳһ�ģ� <br>
  ���ģ�ɿ�������ޡ��������ӣ��ƻ������Ž�ģ� <br>
  ���壩�������������ʵ��ɢ��ҥ�ԣ������������ģ� <br>
  ����������⽨���š����ࡢɫ�顢�Ĳ�����������ɱ���ֲ�����������ģ� <br>
  ���ߣ���Ȼ�������˻���������ʵ�̰����˵ģ����߽����������⹥���ģ� <br>
  ���ˣ��𺦹��һ��������ģ� <br>
  ���ţ�����Υ���ܷ��ͷ�����������ģ� <br>
  ��ʮ��������ҵ�����Ϊ�ġ�</p>
                          <p class="title"><strong>����UBBʹ�ð�����</strong></p>
                          <p align="left"><span class="chinese">[b]:����Ӵ�[/b]�������ֵ�λ�ÿ��������������Ҫ���ַ�����ʾΪ����Ч���� <br>
            [i]:������б[/i]�������ֵ�λ�ÿ��������������Ҫ���ַ�����ʾΪб��Ч����<br>
            [u]:������»���[/u]:�����ֵ�λ�ÿ��������������Ҫ���ַ�����ʾΪ�»���Ч����<br>
            [f]:�ƶ�����[/f]:�����ֵ�λ�ÿ��������������Ҫ���ַ�����ʾΪ�������������<br>
                            [img]:����ͼƬ�����ӣ��ⲿ���ӣ�[/img]����ͼƬ��λ�ÿ��������������Ҫ��ͼƬ����ʾΪͼƬ������Ч���� <br>
                            [url]:���볬����[/url]�������ֵ�λ�ÿ��������������Ҫ�����ӣ���ʾΪ����Ч���� <br>
                            [email]:�����ʼ���ַ[/email]���ʼ���ַ��λ�ÿ��������������Ҫ���ʼ���ַ����ʾΪͼƬ���ʼ���ַ����Ч���� <br>
                            [red]:��ɫ����[red]�������ֵ�λ�ÿ��������������Ҫ���ַ�����ʾΪ��ɫ����Ч���� <br>
                            [blue]:��ɫ����[blue]�������ֵ�λ�ÿ��������������Ҫ���ַ�����ʾΪ��ɫ����Ч���� <br>
                            [green]:��ɫ����[green]�������ֵ�λ�ÿ��������������Ҫ���ַ�����ʾΪ��ɫ����Ч���� <br>
                            [yellow]:��ɫ����[/yellow]�������ֵ�λ�ÿ��������������Ҫ���ַ�����ʾΪ��ɫ����Ч���� <br>
                            [hr]:����ˮƽ��[/hr]������ˮƽ�ߡ� <br>
                            [h1]~[h6]:��������[/h1]~[/h6]������������塣 <br>
                            [font=����]:�����Ϊ����[/font]��������Ҫ�����壬�ڱ�ǩ���м�������ֿ���ʵ����������ת��Ϊ���塣 <br>
                            [font=����]:�����Ϊ����[/font]��������Ҫ�����壬�ڱ�ǩ���м�������ֿ���ʵ����������ת��Ϊ���塣 <br>
                            [font=����]:�����Ϊ����[/font]��������Ҫ�����壬�ڱ�ǩ���м�������ֿ���ʵ����������ת��Ϊ���顣<br>
                            [font=����]:�����Ϊ�����õ�����[/font]��������Ҫ�����壬�������Ϊ���������б������е����塣<br>
                            [size=x]:�����С��Ϊx=6��8��10��12��14��18��24��36[/size]���������������С���ڱ�ǩ���м�������ֿ���ʵ�����ִ�С�ı䡣 <br>
                          [quote]���������ö�[/quote]���������öΡ� <br>
                          :em�����֡�������������������š��磺:em01������01�ű��顣��������,���Ϊ95��<br><br></span></p>                          
						  <% if(isLogin) { %>
						  <p align="left" class="title"><strong>�ġ�����Աʹ�ð�����</strong></p>
                          <p align="left" class="chinese">һ�����Թ���</p>
                          <p align="left" class="chinese">��1�����Զ��û������Խ����޸ģ��ظ����Լ�ɾ����<br>
                          ��2�����������������ˣ������е�����Ҫͨ����֤�ſ��Կ�����<br>
                          ��3�����Կ��������ߵ�IP��ַ��</p>
                          <p align="left" class="chinese">������������</p>
                          <p align="left" class="chinese">��1�����Ա����ƣ�  �������Ա������ơ����������껪���Ա���<br>
                            ��2�����Ա���վ��ҳ��ַ�� �������Ա�������վ�ĵ���ҳַ������http://wsp.hniuca.net)<br>
                            ��3��ÿҳ��ʾ���Ե������� ����ǰ̨������ҳ��ʾ�ļ�¼������(��10��<br>
                            ��4���������ݵ�����ֽ����� ����������������������ַ���,�����༭���Ժͻظ����ԡ�����1200��<br>
                            ��5����Ȩ���У� �������Ա���Ȩ��Ϣ������DramTime)<br>
                            ��6���汾�ţ� V1.0 ��������ú͸��ġ�����ϵͳ�Դ��ģ�<br>
                            ��7�����ܹ��ܣ� �����Ƿ�򿪱��ܹ��ܡ��������Ļ����ܣ�<br>
                            ��8����̨��ˣ� �����Ƿ�򿪺�̨��˹��ܡ������е����Զ�Ҫ���߹���Ա��˲Ż���ʾ��<br>
                            ��9��UBB ���ܣ� �����Ƿ��UBB���ܡ���Ĭ�ϴ򿪣�<br>
                            ��10��������ţ������Ƿ�򿪱�����Ź��ܡ���Ĭ�ϴ򿪣�<br>
                            ��11���༭����ʱ����ʾ��Ϣ�����ñ༭���������ǰ̨����ʾ��Ϣ������������ѱ������껪�༭��!��<br>
                            ��12���ظ�����ʱ����ʾ��Ϣ�����ûظ��������ʱ��ͷ��Ϣ��Ϣ�������л�������ԣ���<br>
                            ��13���޻ظ�ʱ����ʾ��Ϣ�� ����û�лظ�����������ʾʱ����ʾ��Ϣ���������޻ظ���<br>
                            ��14�����Ļ�ʱ��ʾ����Ϣ�� ������������ʱ��ʾ����ʾ��Ϣ�����������ֻ�й���Ա�ɼ���<br>
                          ��15�����Ա���� �������Ա��ķ��</p>
                          <p align="left" class="chinese">����ϵͳ����</p>
                          <p align="left" class="chinese">��1�������û���������ʾ��ǰ���û�����Ϣ����Ϊ��Ҫ���û�������Ҫ������һ����ģ�Ĭ��Ϊadmin��<br>
                           ��2���������롣��������룬�����������Ҫ�������룬�뼰ʱ���ġ���Ĭ��Ϊadmin��</p>
                          <p align="left" class="chinese">�ġ���������</p>
                          <p align="left" class="chinese">��1������Ա�ĸ���������ϡ�<br>
                            ��2������Ա����IDΪ���������ã�����ʾ��������Ҫ��������ظ���Ҳ��Ҫ���õ�̫�򵥣� �Է�����ð�䡣<br>
���磺 <br>
������Ա���ƣ��ǳơ��������������껪<br>
������Ա����ID:�������� �Ǻ�<br>
������ʱ���õ��û���Ϊ���Ǻ�<br>
��������ʾ�������ǣ������껪<br>
�������ã������껪 Ϊ�û��������� <br>
�����ã���ֹ����ð�����<br> 
 ��3�����й���Ա���ơ�����Ա����ID��QQ��E-mailΪ�����<br>
                          </p>
                          <p align="left" class="chinese">�塢�������</p>
                          <p align="left" class="chinese">��1���������Ա��Ĺ�����Ϣ��</p>
                          <p align="left" class="chinese">�����˳�ϵͳ</p>
                          <p align="left" class="chinese">��1���ó���ʹ��session��֤��Ϊ�˰�ȫ�����ڵ�¼�Ժ󣬵��������а�ȫ�˳���</p>
                          <p align="left" class="chinese">�ߡ�������Ϣ</p>
                          <p align="left" class="chinese">��1����������Ϣ�����Ĳ��ֹ���Ա��Ϣֻ�е�¼�Ժ󷽿ɼ����ÿ�ֻ�ܿ���ǰ������Ϣ��<br>
                            <br>
                          </p>
						  <% } %>
					    </td>
                      </tr>
                    </table>
                     </div></td>
                </tr>
                <tr>
                  <td background="images/bg<%=LybSkin%>.gif" height="25" valign="middle"></td>
                </tr>
            </table>
          </td>
        </tr>
    </table></td>
  </tr>
</table>
<br>
<%=BottomInfo()%>
</body>
</html>