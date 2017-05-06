<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ include file="inc/config.jsp"%>
<%@ include file="inc/style.jsp"%>
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
<title><%=LybTitle%> - 帮助信息</title>
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
                  <td height="27" background="images/bg<%=LybSkin%>.gif" class="info"><div align="center" class="title"><%=LybTitle%>帮助系统</div></td>
                </tr>
                <tr class="chinese" height="25">
                  <td><div align="center" class="chinese">
                    <table cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="middle"><div align="center"><br>
                        </div></td>
                      </tr>
                      <tr>
                        <td valign="top"><p class="title"><strong>一、欢迎使用<%=LybTitle%>帮助系统： </strong> </p>
                          <p class="chinese">1、用户在留言时不能在输入框中输入 ' &quot; | 等特殊字符，以影响系统正常运行。<br>
  2、不能冒充版主留言。<br>
  3、留言时请使用文明用语。<br>
  4、留言时姓名，主题，内容不能为空，太少，或太多。留言内容不能超过规定的最大字符数。<br>
  5、QQ，Email，HomePage等项可为空，但不可以乱输。<br>
  6、用户留言可以选择是否保密，如果选择是，则留言只有管理员可以看见。<br>
  7、支持UBB，表情符号。（如果管理员在后台关闭该功能，则不能使用）<br>
  8、默认情况用户发表的留言即可显示，如果管理员开启审核功能，则留言要通过管理员审核才可以看见。<br>
  9、如果可以，敬请保留版本号处的链接或后面的 


 [Powered  By <a href="http://wsp.hniuca.net">DreamTime</a>]  版权申明，也算是做个链接吧。<br>
  10、本版本个人用户可免费使用，但不得用于商业目的。商业用户请与我联系。<br>
  11、本程序欢迎复制和传播，但请保证程序的完整性，包括一切的相关文档。<br>
  12、程序作者 [<a href="http://wsp.hniuca.net">DreamTime</a>] 保留所有版权。</p>
                          <p><br>
                              <strong class="title">二、不得利用本留言簿进行以下活动： </strong></p>
                          <p class="chinese">（一）煽动抗拒、破坏宪法和法律、行政法规实施的； <br>
  （二）煽动颠覆国家政权，推翻社会主义制度的； <br>
  （三）煽动分裂国家、破坏国家统一的； <br>
  （四）煽动民族仇恨、民族歧视，破坏民族团结的； <br>
  （五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的； <br>
  （六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的； <br>
  （七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的； <br>
  （八）损害国家机关信誉的； <br>
  （九）其他违反宪法和法律行政法规的； <br>
  （十）进行商业广告行为的。</p>
                          <p class="title"><strong>三、UBB使用帮助：</strong></p>
                          <p align="left"><span class="chinese">[b]:字体加粗[/b]：在文字的位置可以任意加入您需要的字符，显示为粗体效果。 <br>
            [i]:字体倾斜[/i]：在文字的位置可以任意加入您需要的字符，显示为斜体效果。<br>
            [u]:字体加下划线[/u]:在文字的位置可以任意加入您需要的字符，显示为下划线效果。<br>
            [f]:移动字体[/f]:在文字的位置可以任意加入您需要的字符，显示为从右至左滚动。<br>
                            [img]:加入图片的链接（外部链接）[/img]：在图片的位置可以任意加入您需要的图片，显示为图片的链接效果。 <br>
                            [url]:加入超链接[/url]：在文字的位置可以任意加入您需要的链接，显示为链接效果。 <br>
                            [email]:加入邮件地址[/email]在邮件地址的位置可以任意加入您需要的邮件地址，显示为图片的邮件地址链接效果。 <br>
                            [red]:红色字体[red]：在文字的位置可以任意加入您需要的字符，显示为红色字体效果。 <br>
                            [blue]:兰色字体[blue]：在文字的位置可以任意加入您需要的字符，显示为兰色字体效果。 <br>
                            [green]:绿色字体[green]：在文字的位置可以任意加入您需要的字符，显示为绿色字体效果。 <br>
                            [yellow]:黄色字体[/yellow]：在文字的位置可以任意加入您需要的字符，显示为黄色字体效果。 <br>
                            [hr]:加入水平线[/hr]：加入水平线。 <br>
                            [h1]~[h6]:标题字体[/h1]~[/h6]：加入标题字体。 <br>
                            [font=宋体]:字体改为宋体[/font]输入您需要的字体，在标签的中间插入文字可以实现文字字体转换为宋体。 <br>
                            [font=黑体]:字体改为黑体[/font]输入您需要的字体，在标签的中间插入文字可以实现文字字体转换为黑体。 <br>
                            [font=隶书]:字体改为隶书[/font]输入您需要的字体，在标签的中间插入文字可以实现文字字体转换为隶书。<br>
                            [font=字体]:字体改为您设置的字体[/font]输入您需要的字体，字体可以为字体下拉列表中所有的字体。<br>
                            [size=x]:字体大小改为x=6，8，10，12，14，18，24，36[/size]：输入您的字体大小，在标签的中间插入文字可以实现文字大小改变。 <br>
                          [quote]这里是引用段[/quote]：加入引用段。 <br>
                          :em＋数字　可在正文里加入表情符号。如：:em01　加入01号表情。依此类推,最大为95。<br><br></span></p>                          
						  <% if(isLogin) { %>
						  <p align="left" class="title"><strong>四、管理员使用帮助：</strong></p>
                          <p align="left" class="chinese">一、留言管理</p>
                          <p align="left" class="chinese">　1、可以对用户的留言进行修改，回复，以及删除。<br>
                          　2、如果设置了留言审核，则所有的留言要通过验证才可以看到。<br>
                          　3、可以看到留言者的IP地址。</p>
                          <p align="left" class="chinese">二、参数设置</p>
                          <p align="left" class="chinese">　1、留言本名称：  设置留言本的名称。（如梦想年华留言本）<br>
                            　2、留言本网站首页网址： 设置留言本所在网站的的主页址。（如http://wsp.hniuca.net)<br>
                            　3、每页显示留言的条数： 设置前台留言主页显示的记录条数。(如10）<br>
                            　4、留言内容的最大字节数： 设置留言内容允许的最大字符数,包括编辑留言和回复留言。（如1200）<br>
                            　5、版权所有： 设置留言本版权信息。（如DramTime)<br>
                            　6、版本号： V1.0 该项不可设置和更改。（是系统自带的）<br>
                            　7、保密功能： 设置是否打开保密功能。（即悄悄话功能）<br>
                            　8、后台审核： 设置是否打开后台审核功能。（所有的留言都要经边管理员审核才会显示）<br>
                            　9、UBB 功能： 设置是否打开UBB功能。（默认打开）<br>
                            　10、表情符号：设置是否打开表情符号功能。（默认打开）<br>
                            　11、编辑留言时的提示信息：设置编辑后的留言在前台的提示信息。（如该留言已被梦想年华编辑过!）<br>
                            　12、回复留言时的提示信息：设置回复后的留言时的头信息信息。（如感谢您的留言：）<br>
                            　13、无回复时的提示信息： 设置没有回复的留言在显示时的提示信息。（如暂无回复）<br>
                            　14、悄悄话时提示的信息： 设置悄悄留言时显示的提示信息。（如该留言只有管理员可见）<br>
                          　15、留言本风格： 设置留言本的风格。</p>
                          <p align="left" class="chinese">三、系统管理</p>
                          <p align="left" class="chinese">　1、更改用户名。会显示当前的用户名信息，改为想要的用户名。（要和密码一起更改，默认为admin）<br>
                           　2、更改密码。输入旧密码，并输入二次想要的新密码，请及时更改。（默认为admin）</p>
                          <p align="left" class="chinese">四、版主资料</p>
                          <p align="left" class="chinese">　1、管理员的个人相关资料。<br>
                            　2、管理员留言ID为版主留言用，可显示版主，不要与版主名重复，也不要设置的太简单， 以防他人冒充。<br>
　如： <br>
　管理员名称（昵称、网名）：梦想年华<br>
　管理员留言ID:　　　　 呵呵<br>
　留言时你用的用户名为：呵呵<br>
　留言显示出来的是：梦想年华<br>
　不可用：梦想年华 为用户名来留言 <br>
　作用：防止他人冒充版主<br> 
 　3、其中管理员名称、管理员留言ID、QQ和E-mail为必填项。<br>
                          </p>
                          <p align="left" class="chinese">五、公告管理</p>
                          <p align="left" class="chinese">　1、设置留言本的公告信息。</p>
                          <p align="left" class="chinese">六、退出系统</p>
                          <p align="left" class="chinese">　1、该程序使用session验证。为了安全请您在登录以后，点击这里进行安全退出。</p>
                          <p align="left" class="chinese">七、帮助信息</p>
                          <p align="left" class="chinese">　1、本帮助信息。第四部分管理员信息只有登录以后方可见。访客只能看到前三项信息。<br>
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
