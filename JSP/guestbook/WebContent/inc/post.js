// JavaScript Document

//���༭����Χ���ж����ֽ�
function CheckLength()
{
	MessageLength=document.form.Content.value.length;
	alert("������������ "+MessageLength+" �ֽ�");
}

function PressKey(eventobject)
{
	if(event.ctrlKey && window.event.keyCode==13)
	{
		if(Check())  this.document.form.submit();
	}
}

function PressKey1(eventobject)
{
	if(event.ctrlKey && window.event.keyCode==13)
	{
		if(ReplyCheck())  this.document.form.submit();
	}
}

function Replac()
{
	txt2=prompt("��������","");
	if (txt2 != "") {
		txt=prompt("�滻Ϊ��",txt2)
		}
	else 
	{
		Replac()
		}
	var Otext = txt2; var Itext = txt; 
	document.form.Content.value = eval('form.Content.value.replace(/'+Otext+'/'+'g'+',"'+Itext+'")')
}


function Copy(theField) 
{
	var tempval=eval("document."+theField)
	tempval.focus()
	tempval.select()
	therange=tempval.createTextRange()
	therange.execCommand("Copy")
}

//������ҳ
function MM_jumpMenu(targ,selObj,restore){ 		//v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}



/*****************************************************  
 *  ��������	DateCheck()
 *  ��  �ã�����ַ����Ƿ���ָ���Ĵ�С��Χ�ں��Ƿ��зǷ��ַ�
 *	��  ����date: Ҫ�����ַ���
 *          minum:  �ַ���С�ĳ���
 *  		maxnum: �ַ����ĳ���
 *  ����ֵ��True:   ���ݲ���ָ����Χ�ڻ��зǷ��ַ�
 *			False:  ������ָ����Χ���Ҳ����зǷ��ַ�
 ******************************************************
*/
function DateCheck(date,minnum,maxnum)
{
	if (date.length < minnum || date.length > maxnum ){
		window.alert("�������ݵĳ��Ȳ������� " + minnum + " λ���Ҳ��ܴ��� " + maxnum + " λ!");
		return true;
	}

	 a = date.indexOf("'");
	 b = date.indexOf("|");
	 c = date.indexOf("\"");
	 
	 if (a != -1||b != -1 ||c != -1){
	   window.alert("�������뺬�������ַ������������룡");
	   return true;
	  	}
	return false;
}


/*****************************************************  
 *  ��������	IsNum()
 *  ��  �ã�����ַ��Ƿ��Ǵ�����
 *	��  ����str: Ҫ�����ַ���  
 *  ����ֵ��True:   ������
 *			False:  ���Ǵ�����
 ******************************************************
*/
function IsNum(str)
{
	return !/\D/.test(str)
}


/*****************************************************  
 *  ��������	IsStr()
 *  ��  �ã�����ַ��Ƿ����ַ�
 *	��  ����str: Ҫ�����ַ�  
 *  ����ֵ��True:   ���ַ�
 *			False:  ���Ǵ��ַ�
 ******************************************************
*/
function IsStr(str)
{      
����if (/[^\x00-\xff]/g.test(str))
	{
		return false;
	}
����else 
	{
		return true;
	}
}


/*****************************************************  
 *  ��������	IsEmail()
 *  ��  �ã����Email��ַ�Ƿ�Ϸ�
 *	��  ����date: Ҫ����Email��ַ  
 *  ����ֵ��True: Email ��ַ�Ϸ�
 *          False:Email ��ַ���Ϸ�
 *****************************************************
*/
function IsEmail(vEMail)
{
	var regInvalid=/(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/;
	var regValid=/^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/;
	return (!regInvalid.test(vEMail)&&regValid.test(vEMail));
}


/*****************************************************  
 *  ��������	Check()
 *  ��  �ã��ύ���Ա�������֤
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 ******************************************************
*/
function Check(){
    var check = false;
	var Name = document.form.Name.value;
	if ( Name =="") {
	    alert("�㲻��������Ҳ�������!");
	    document.form.Name.focus();
	    return false;
	  }
	
	if(DateCheck(Name,4,16)){
		document.form.Name.focus();
		document.form.Name.value = "";
		return false;
	}
	
	var UserEmail = document.form.Mail.value;
	if(UserEmail!="")
	{
		if(!isEmail(UserEmail))
		{
			alert("��������ȷ�ĵ����ʼ���ʽ��");			
			document.form.Mail.focus();
			return false;
		}
	 }
	
	var QQ = document.form.QQ.value;
	if (QQ != "") {
		if(!IsNum(QQ))
		{
			alert("�������QQ���Ǵ�����,���û��QQ�벻Ҫ��д!");
			document.form.QQ.focus();
			document.form.QQ.value = "";
			return false;
		}
		if(DateCheck(QQ,4,10))
		{
			document.form.QQ.focus();
			document.form.QQ.value = "";
			return false;
		}
	}
		
	
	var ComeFrom = document.form.ComeFrom.value;
	if(ComeFrom != "")
	{	
		if(DateCheck(ComeFrom,2,50)){
			document.form.ComeFrom.focus();
			document.form.ComeFrom.value = "";
			return false;
		}
	}
		
	
	var HomePage = document.form.HomePage.value;
	if (HomePage!=""){
	   if(HomePage.indexOf("http://") == -1){
			alert("�ⲻ����Ч����ҳ��ַ!");
			document.form.HomePage.focus();
			document.form.HomePage.value = "";
			return false;
		}
	}

	var Title = document.form.Title.value;
	if (Title=="")
	{
	   alert("��������������!");
	   document.form.Title.focus();
	   return false;
	 }
	
	if(DateCheck(Title,2,50))
	{
		document.form.Title.focus();
		document.form.Title.value = "";
		return false;
	}

	Content=document.form.Content.value;
	if (Content=="")
	{
	   alert("��������������!");
	   document.form.Content.focus();
	   return false;
	}
	
	if (document.form.Content.value.length < 2){
	   alert("���Ե����ݲ�����ô�ٰ�!");
	   document.form.Content.focus();
	   return false;
	}
  	return true;
}


/*****************************************************  
 *  ��������	ReplyCheck()
 *  ��  �ã��ظ����Ա�������֤
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 *****************************************************
*/
function ReplyCheck(){
    var check = false;
	if (document.form.Content.value==""){
	   alert("�������ݵĳ��Ȳ���Ϊ��!");
	   document.form.Content.focus();
	   return false;
	}
	
	if (document.form.Content.value.length < 2){
	   alert("�������ݵĳ��Ȳ�������2λ!");
	   document.form.Content.focus();
	   return false;
	}
  return true;
}


function go(src,q)
{
	var ret;
	ret = confirm(q);
	if(ret!=false)window.location=src;
}



/*****************************************************  
 *  ��������	ModPwdCheck()
 *  ��  �ã��޸������������֤
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 *****************************************************
*/
function ModPwdCheck()
{
	var ModPwdcheck = false;
	var User = document.form.User.value;
	if (User == "") {
	alert("����������û���!");
	document.form.User.focus();
		return false;
	}
	
	if(DateCheck(User,4,16)){
		document.form.User.focus();
		document.form.User.value = "";
		return false;
	}
	
	var Pwd = document.form.Pwd.value;
	if (Pwd == "") {
	alert("��������ľ�����!");
	document.form.Pwd.focus();
		return false;
	}
	
	if(DateCheck(Pwd,4,16)){
		document.form.Pwd.focus();
		document.form.Pwd.value = "";
		return false;
	}
	
	var NewPwd = document.form.NewPwd.value;
	if (NewPwd == "") {
	alert("�����벻��Ϊ�գ�");
	document.form.NewPwd.focus();	
		return false;
	} 
	
	if(DateCheck(NewPwd,4,16)){
		document.form.NewPwd.focus();
		document.form.NewPwd.value = "";
		return false;
	}
	
	var NewPwd2 = document.form.NewPwd2.value; 
	if (NewPwd2 == "") {
	alert("��ȷ�������룡");
	document.form.NewPwd2.focus();		
		return false;
      }
	  
	if(DateCheck(NewPwd2,4,16)){
		document.form.NewPwd2.focus();
		document.form.NewPwd2.value = "";
		return false;
	}
	 
	if (NewPwd != NewPwd2) {
	alert("��������������벻һ�£��������룡");
	document.form.NewPwd.focus();	
	document.form.NewPwd.value = "";
	document.form.NewPwd2.value = "";
		return false;
	}
	 
  return true;
  }    
 
 
/*****************************************************  
 *  ��������	LoginCheck()
 *  ��  �ã���¼��������֤
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 *****************************************************
*/
 function LoginCheck()
 {
	var LoginCheck = false;
	var User = document.form.User.value;
	if (User == "") {
	alert("����������û���!");
	document.form.User.focus();
		return false;
	}
	
	if(DateCheck(User,4,16)){
		document.form.User.focus();
		document.form.User.value = "";
		return false;
	}
	
	var Pwd = document.form.Pwd.value;
	if (Pwd == "") {
	alert("�������������!");
	document.form.Pwd.focus();
		return false;
	}
	
	if(DateCheck(Pwd,4,16)){
		document.form.Pwd.focus();
		document.form.Pwd.value = "";
		return false;
	}
	
	var VerifyCode = document.form.VerifyCode.value;
	if (VerifyCode == "" || VerifyCode.length != 4) {
	alert("��������ȷ����֤��!");
	document.form.VerifyCode.focus();
		return false;
	}
  return true;
  }  
  

/*****************************************************  
 *  ��������	AdminInfoCheck()
 *  ��  �ã�����Ա��Ϣ��������֤
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 *****************************************************
*/
function AdminInfoCheck()
 {
	var AdminInfoCheck = false;
	var AdminName = document.form.AdminName.value;
	if (AdminName == "") {
	alert("���������Ա����!");
	document.form.AdminName.focus();
		return false;
	}
	
	if(DateCheck(AdminName,4,16)){
		document.form.AdminName.focus();
		document.form.AdminName.value = "";
		return false;
	}
	
	var AdminUid = document.form.AdminUid.value;
	if (AdminUid == "") {
	alert("���������Ա����ID!");
	document.form.AdminUid.focus();
		return false;
	}
	
	if(DateCheck(AdminUid,4,16)){
		document.form.AdminUid.focus();
		document.form.AdminUid.value = "";
		return false;
	}
	
	var AdminMail = document.form.AdminMail.value;
	if(AdminMail =="")
	{
		alert("������������䣡");
		document.form.AdminMail.focus();
		document.form.AdminMail.value = "";
		return false;
	}
		
	if(!IsEmail(AdminMail))
	{
		alert("��������ȷ�ĵ������䣡");
		document.form.AdminMail.focus();
		document.form.AdminMail.value = "";
		return false;
	}
	
	var AdminQQ = document.form.AdminQQ.value;
	if(AdminQQ =="")
	{
		alert("����������QQ��");
		document.form.AdminQQ.focus();
		document.form.AdminQQ.value = "";
		return false;
	}
		
	if (DateCheck(AdminQQ,4,10))
	{
		document.form.AdminQQ.focus();
		document.form.AdminQQ.value = "";
		return false;
	}
	
	if (!IsNum(AdminQQ))
	{
		alert("�����QQ����Ϊ���֣�");
		document.form.AdminQQ.focus();
		document.form.AdminQQ.value = "";
		return false;
	}

  return true;
  }  
 
 
/*****************************************************  
 *  ��������	AdminConfigCheck()
 *  ��  �ã��������ñ�������֤
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 *****************************************************
*/ 
function AdminConfigCheck()
 {
	var AdminConfigCheck = false;
	var LybTitle = document.form.LybTitle.value;
	if (LybTitle == "") {
	alert("���������Ա�����!");
	document.form.LybTitle.focus();
		return false;
	}
	
	if(DateCheck(LybTitle,4,20)){
		document.form.LybTitle.focus();
		document.form.LybTitle.value = "";
		return false;
	}
	
	var LybPageSize = document.form.LybPageSize.value;
	if (LybPageSize == "") {
		alert("������ÿҳ��ʾ��������!");
		document.form.LybPageSize.focus();
		return false;
	}
	
	if(DateCheck(LybPageSize,1,2)){
		document.form.LybPageSize.focus();
		document.form.LybPageSize.value = "";
		return false;
	}
	
	if(!IsNum(LybPageSize))
	{
		alert("ÿҳ��ʾ������������Ϊ���֣�");
		document.form.LybPageSize.focus();
		document.form.LybPageSize.value = "";
		return false;
	}
	
	var LybMaxByte = document.form.LybMaxByte.value;
	if(LybMaxByte =="")
	{
		alert("���������Ե�����ַ�����");
		document.form.LybMaxByte.focus();
		document.form.LybMaxByte.value = "";
		return false;
	}
	
	if(DateCheck(LybMaxByte,3,5)){
		document.form.LybMaxByte.focus();
		document.form.LybMaxByte.value = "";
		return false;
	}
	
	if(!IsNum(LybMaxByte))
	{
		alert("���Ե�����ַ�������Ϊ���֣�");
		document.form.LybMaxByte.focus();
		document.form.LybMaxByte.value = "";
		return false;
	}
  return true;
  }  
  
  
  

