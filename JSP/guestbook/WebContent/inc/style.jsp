<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%!
String bordercolor;      	//表格边框色
String bgcolor;     	 	//背景色
String chinesecolor;     	//文字颜色
String titlecolor;		 	//各标题颜色
String footcolor;    	 	//版权信息颜色
String infocolor;		 	//其它信息颜色
String linkcolor;           //有链接的颜色
String hovercolor;          //移上链接的颜色
String activecolor;			//激活链接的颜色
String visitedcolor;		//访问以后链接的颜色
String arrow;           	// 滚动条三角形箭头颜色
String trackcolor;      	// 滚动条背景颜色
String basecolor;       	// 滚动条颜色

%>


<%
	switch(LybSkin)
	{
		case 1: 			//淡蓝风格
			linkcolor = "#677FA9";
			hovercolor = "#6600FF";
			visitedcolor = "#677FA9";
			activecolor = "#FF0000";
			bgcolor = "#F2F8FF";
			bordercolor = "#677FA9";
			chinesecolor = "#333333";
			titlecolor = "#677FA9";
			footcolor = "#677FA9";
			infocolor = "#677FA9";
			arrow = "#FFFFFF";
			trackcolor = "#D5E6FB";
			basecolor = "#AEC6F0";
			break;
		
		case 2:			//淡红风格
			linkcolor = "#FA605E";
			hovercolor = "#6600FF";
			visitedcolor = "#FA605E";
			activecolor = "#FF0000";
			bgcolor = "#FAD9D9";
			bordercolor = "#FA605E";
			chinesecolor = "#333333";
			titlecolor = "#FA605E";
			footcolor = "#FA605E";
			infocolor = "#FA605E";
			arrow = "#FFFFFF";
			trackcolor = "#F9CDCD";
			basecolor = "#F8A7A7";
			break;
			
		case 3:			//深蓝风格
			linkcolor = "#457FFC";
			hovercolor = "#6600FF";
			visitedcolor = "#457FFC";
			activecolor = "#FF0000";
			bgcolor = "#DBE6FE";
			bordercolor = "#457FFC";
			chinesecolor = "#333333";
			titlecolor = "#457FFC";
			footcolor = "#457FFC";
			infocolor = "#457FFC";
			arrow = "#FFFFFF";
			trackcolor = "#C9DAFD";
			basecolor = "#91B2FA";
			break;
			
		case 4:			//淡绿风格
			linkcolor = "#029D02";
			hovercolor = "#6600FF";
			visitedcolor = "#029D02";
			activecolor = "#FF0000";
			bgcolor = "#E8FBE8";
			bordercolor = "#029D02";
			chinesecolor = "#333333";
			titlecolor = "#029D02";
			footcolor = "#029D02";
			infocolor = "#029D02";
			arrow = "#FFFFFF";
			trackcolor = "#DFFCDF";
			basecolor = "#B8EAB8";
			break;
			
		case 5:			//淡黄风格
			linkcolor = "#F9A30B";
			hovercolor = "#6600FF";
			visitedcolor = "#F9A30B";
			activecolor = "#FF0000";
			bgcolor = "#FCF5EC";
			bordercolor = "#F9A30B";
			chinesecolor = "#333333";
			titlecolor = "#F9A30B";
			footcolor = "#F9A30B";
			infocolor = "#F9A30B";
			arrow = "#FFFFFF";
			trackcolor = "#FBEFDE";
			basecolor = "#FAE2C4";
			break;
			
		case 6:			//淡紫风格
			linkcolor = "#8C63A4";
			hovercolor = "#6600FF";
			visitedcolor = "#8C63A4";
			activecolor = "#DBA8F8";
			bgcolor = "#DACBE1";
			bordercolor = "#8C63A4";
			chinesecolor = "#333333";
			titlecolor = "#8C63A4";
			footcolor = "#8C63A4";
			infocolor = "#8C63A4";
			arrow = "#FFFFFF";
			trackcolor = "#D4B7E1";
			basecolor = "#B181C7";
			break;
		
		case 7:			//橘色风格
			linkcolor = "#F97722";
			hovercolor = "#6600FF";
			visitedcolor = "#F97722";
			activecolor = "#DBA8F8";
			bgcolor = "#FEC5A0";
			bordercolor = "#F97722";
			chinesecolor = "#333333";
			titlecolor = "#F97722";
			footcolor = "#F97722";
			infocolor = "#F97722";
			arrow = "#FFFFFF";
			trackcolor = "#FEBB90";
			basecolor = "#F58B45";
			break;
		
		case 8:			//灰色风格
			linkcolor = "#555555";
			hovercolor = "#6600FF";
			visitedcolor = "#555555";
			activecolor = "#DBA8F8";
			bgcolor = "#D8D8D8";
			bordercolor = "#555555";
			chinesecolor = "#333333";
			titlecolor = "#555555";
			footcolor = "#555555";
			infocolor = "#555555";
			arrow = "#FFFFFF";
			trackcolor = "#C7C5C5";
			basecolor = "#918F8F";
			break;
	}
%>





<style>
A:link {
	COLOR: <%=linkcolor%>; TEXT-DECORATION: none; font-family: "宋体"; font-size: 9pt
}
A:visited {
	COLOR: <%=visitedcolor%>; TEXT-DECORATION: none; font-family: "宋体"; font-size: 9pt
}
A:active {
	COLOR: <%=activecolor%>; TEXT-DECORATION: none; font-family: "宋体"; font-size: 9pt
}
A:hover {
	COLOR: <%=hovercolor%>; TEXT-DECORATION: underline; font-family: "宋体"; font-size: 9pt
}

.chinese
{
    FONT-SIZE: 12px;
    FONT-FAMILY: "宋体";
	color:<%=chinesecolor%>;
}

.title {
	font-size:12pt;
	font-family: "宋体";
	color:<%=titlecolor%>;
	}
	
.foot{
	font-family:"宋体";
	color:<%=footcolor%>;
	font-size:12px;
	}
	
.button
{
    BORDER-RIGHT: #636163 1px solid;
    BORDER-TOP: #c6c3c6 1px solid;
    FONT-SIZE: 12px;
    BORDER-LEFT: #c6c3c6 1px solid;
    BORDER-BOTTOM: #636163 1px solid;
    FONT-FAMILY: "宋体";
    HEIGHT: 20px;
    BACKGROUND-COLOR: #f7f7f7;
    TEXT-DECORATION: none
}

.info 
{ 
	color:<%=infocolor%>;
    font-size:12px;
}

body {
	background-color: <%=bgcolor%>;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	SCROLLBAR-HIGHLIGHT-COLOR: ;
	SCROLLBAR-ARROW-COLOR:<%=arrow%>;
	SCROLLBAR-TRACK-COLOR:<%=trackcolor%>;
	SCROLLBAR-BASE-COLOR:<%=basecolor%>;
}

table { 
	background-color:<%=bgcolor%>;
	border-color:<%=bordercolor%>;
	border-collapse:collapse;
	border-top-color:<%=bordercolor%>;
	border-right-color:<%=bordercolor%>;
	border-left-color:<%=bordercolor%>;
	border-bottom-color:<%=bordercolor%>;
	}
	
tr { border-color:<%=bordercolor%>; }
td { border-color:<%=bordercolor%>; }	

</style>

