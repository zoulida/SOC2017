//UBB�Զ���Ӻ���
function addBold()
{
	document.form.Content.value="[b]"+document.form.Content.value+"[/b]";
}

function addEm()
{
	document.form.Content.value="[i]"+document.form.Content.value+"[/i]";
}

function addUnder() 
{
	document.form.Content.value="[u]"+document.form.Content.value+"[/u]";
}

function addFly() 
{
	document.form.Content.value="[f]"+document.form.Content.value+"[/f]";
}

function addDate() 
{
	var today = new Date();
	var day = today.getDay();
	var week=new Array(7); 
	week[0]="��"; 
	week[1]="һ"; 
	week[2]="��"; 
	week[3]="��"; 
	week[4]="��"; 
	week[5]="��"; 
	week[6]="��"; 
	var date = today.getYear()+"-"+today.getMonth()+"-"+today.getDate()+"  ����"+week[today.getDay()];
	document.form.Content.value=document.form.Content.value+date;
}

function addCenter()
{
	document.form.Content.value="[center]"+document.form.Content.value+"[/center]";
}
function addLeft()
{
	document.form.Content.value="[left]"+document.form.Content.value+"[/left]";
}
function addRight()
{
	document.form.Content.value="[right]"+document.form.Content.value+"[/right]";
}
function addImages()
{
	var form=prompt("������������ͼƬ���ӵ�ַ:����http://wsp.hniuca.net/images/index1.jpg","�����ĵ�ַ");
	if(form!=null)
	{
		document.form.Content.value=document.form.Content.value+"[img]"+form+"[/img]";
	}
}

function addURL()
{
	var form=prompt("�����������ĵ�ַ:����http://wsp.hniuca.net","�����ĵ�ַ");
	if(form!=null)
	{
		document.form.Content.value=document.form.Content.value+"[url]"+form+"[/url]";
	}
}

function addEmail()
{
	var form=prompt("�������������ʼ���ַ:����fanwsp@126.com","�����ĵ�ַ");
	if(form!=null)
	{
		document.form.Content.value=document.form.Content.value+"[email]"+form+"[/email]";
	}
}

function addQuote()
{
	var form=prompt("���������õ�����","����");
	if(form!=null)
	{
		document.form.Content.value=document.form.Content.value+"[quote]"+form+"[/quote]";
	}
}

function setFont(font)
{
	if (font) {
		document.form.Content.value= '[font=' + font + ']'+ document.form.Content.value + '[/font]';
	}
}

function setSize(size)
{
		document.form.Content.value= '[size=' + size + ']'+ document.form.Content.value + '[/size]';
}

function setColor(color)
{
		document.form.Content.value='['+color+']'+document.form.Content.value+'[/'+color+']';
}

function addMood(mood)
{
	document.form.Content.value=document.form.Content.value+mood;
}

function ShowFace()
{
 	document.images.face.src="images/face/"+document.form.Sex.options[document.form.Sex.selectedIndex].value+""+document.form.Face.options[document.form.Face.selectedIndex].value+".gif";
}


function ShowSmile()
{
	for(var i=1;i<=95;i++)
	{
		if(i<10)
		{
			document.write("<a title=\"0"+i+"\" href=\"javascript:\" onClick=\"addMood(\':em0"+i+"\')\"><img src='images/ubbface/0"+i+".gif' border=0></a>");
		}
		else
		{
			document.write("<a title=\""+i+"\" href=\"javascript:\" onClick=\"addMood(\':em"+i+"\')\"><img src='images/ubbface/"+i+".gif' border=0></a>");
		}
		if(i%25 == 0)
		{
			document.write("<br>");
		}
	}
}
