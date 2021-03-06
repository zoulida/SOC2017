
/*   梦想年华JSP版留言本MYSQL数据库角本 
     先安装好SQL服务器，然后打开查询分析器，
     在查询分析器时执行这个SQL角本即可。
*/
 


/****** Object:  Database DreamTimeGuestBook    Script Date: 2005-9-5 22:18:46 ******/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'DreamTimeGuestBook')
	DROP DATABASE [DreamTimeGuestBook]
GO

CREATE DATABASE [DreamTimeGuestBook]  COLLATE Chinese_PRC_CI_AS
GO

use [DreamTimeGuestBook]
GO

/****** Object:  Table [dbo].[admin]    Script Date: 2005-9-5 22:18:47 ******/
CREATE TABLE [dbo].[admin] (
	[AdminID] [decimal](10, 0) IDENTITY (1, 1) NOT NULL ,
	[User] [nvarchar] (32) COLLATE Chinese_PRC_CI_AS NULL ,
	[Pwd] [nvarchar] (32) COLLATE Chinese_PRC_CI_AS NULL ,
	[AdminName] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[AdminUid] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[AdminQQ] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[AdminMail] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[AdminHomePage] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[AdminPhone] [nvarchar] (12) COLLATE Chinese_PRC_CI_AS NULL ,
	[AdminAddress] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[AdminNote] [ntext] COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object: admin 表中的初始化数据  Script Date: 2005-9-5 22:18:48 ******/

INSERT INTO admin VALUES ('dream', '8812662DCF3E5DB0247C0F85909363FC', '梦想年华', '华年想梦', '122142023', 'fanwsp@126.com', 'http://wsp.hniuca.net', '0731-8087321', '耒阳', '欢迎使用梦想年华JSP版留言本。');
GO


/****** Object:  Table [dbo].[config]    Script Date: 2005-9-5 22:18:48 ******/
CREATE TABLE [dbo].[config] (
	[LybID] [decimal](10, 0) IDENTITY (1, 1) NOT NULL ,
	[LybTitle] [nvarchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[LybHomePage] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[LybPageSize] [smallint] NULL ,
	[LybMaxByte] [int] NULL ,
	[LybCopyRight] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[LybVersion] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[OpenSecret] [nchar] (3) COLLATE Chinese_PRC_CI_AS NULL ,
	[OpenValidate] [nchar] (3) COLLATE Chinese_PRC_CI_AS NULL ,
	[OpenUBB] [nchar] (3) COLLATE Chinese_PRC_CI_AS NULL ,
	[OpenFace] [nchar] (3) COLLATE Chinese_PRC_CI_AS NULL ,
	[EditInfo] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[ReplyInfo] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[NoReplyInfo] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[SecretInfo] [nvarchar] (40) COLLATE Chinese_PRC_CI_AS NULL ,
	[LybSkin] [tinyint] NULL ,
	[LybNote] [ntext] COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object: config 表中的初始化数据  Script Date: 2005-9-5 22:18:48 ******/

INSERT INTO config VALUES ('梦想年华留言本', 'http://wsp.hniuca.net', 10, 1200, 'DreamTime', 'V1.0', 'Yes', 'No', 'Yes', 'Yes', '该留言已被管理员梦想年华编辑过!', '非常感谢您的留言：', '暂无回复', '该留言只有管理员可见！', 3, '欢迎使用梦想年华JSP版留言本！');
GO

/****** Object:  Table [dbo].[guestbook]    Script Date: 2005-9-5 22:18:48 ******/
CREATE TABLE [dbo].[guestbook] (
	[ID] [decimal](10, 0) IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[QQ] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mail] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Sex] [nvarchar] (1) COLLATE Chinese_PRC_CI_AS NULL ,
	[HomePage] [nvarchar] (80) COLLATE Chinese_PRC_CI_AS NULL ,
	[ComeFrom] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Face] [nvarchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[IP] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[UpdateTime] [datetime] NULL ,
	[Title] [nvarchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[Content] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[ReContent] [ntext] COLLATE Chinese_PRC_CI_AS NULL ,
	[ReTime] [datetime] NULL ,
	[Secret] [nchar] (3) COLLATE Chinese_PRC_CI_AS NULL ,
	[EditTime] [datetime] NULL ,
	[Validate] [nchar] (3) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object: guestbook 表中的初始化数据  Script Date: 2005-9-5 22:18:48 ******/

INSERT INTO guestbook VALUES ('版主 [梦想年华]', '122142023', 'fanwsp@126.com', 'm', 'http://wsp.hniuca.net', '计网0304班', '09', '127.0.0.1', '2005-08-31 11:50:04', '测试', '梦想年华JSP版留言本正式测试!!!<br>梦想年华JSP版留言本正式测试!!!<br>梦想年华JSP版留言本正式测试!!!<br>梦想年华JSP版留言本正式测试!!!<br>梦想年华JSP版留言本正式测试!!!<br><br>', '', '2005-08-31 11:51:28', 'No', NULL, 'Yes');
INSERT INTO guestbook VALUES ('版主 [梦想年华]', '122142023', 'fanwsp@126.com', 'm', 'http://wsp.hniuca.net', 'net0304', '06', '172.16.166.51', '2005-08-31 13:17:27', '欢迎使用!', '欢迎使用!', '', '2005-08-31 13:17:27', 'No', NULL, 'Yes');
INSERT INTO guestbook VALUES ('flyying', '270963863', 'zhuyu2008@hongen.com', 'w', '', '湖南', '04', '172.16.195.106', '2005-08-31 21:39:12', '我留言', '做得不错啊，加油!相信你<img src="images/ubbface/12.gif"><img src="images/ubbface/79.gif">', '谢谢鼓励!', '2005-08-31 22:33:14', 'Yes', NULL, 'Yes');
INSERT INTO guestbook VALUES ('版主 [梦想年华]', '122142023', 'fanwsp@126.com', 'm', 'http://wsp.hniuca.net', '计网0304班', '10', '127.0.0.1', '2005-09-04 12:06:17', '留言本测试中', '梦想年华JSP版留言本MYSQL数据库测试中!!!<br>梦想年华JSP版留言本MYSQL数据库测试中!!!<br>梦想年华JSP版留言本MYSQL数据库测试中!!!<br>梦想年华JSP版留言本MYSQL数据库测试中!!!<br>梦想年华JSP版留言本MYSQL数据库测试中!!!<br><br><br>', '', NULL, 'No', NULL, 'Yes');
INSERT INTO guestbook VALUES ('版主 [梦想年华]', '122142023', 'fanwsp@126.com', 'm', 'http://wsp.hniuca.net', '计网0304班', '06', '127.0.0.1', '2005-09-04 18:43:09', 'MYSQL数据库测试完成!', '梦想年华JSP版留言本MYSQL数据库测试完成!!!<br>梦想年华JSP版留言本MYSQL数据库测试完成!!!<br>梦想年华JSP版留言本MYSQL数据库测试完成!!!<br>梦想年华JSP版留言本MYSQL数据库测试完成!!!<br>梦想年华JSP版留言本MYSQL数据库测试完成!!!', '', NULL, 'No', NULL, 'Yes');
INSERT INTO guestbook VALUES ('版主 [梦想年华]', '122142023', 'fanwsp@126.com', 'm', 'http://wsp.hniuca.net', '计网0304班', '06', '127.0.0.1', '2005-09-04 18:43:09', 'SQL Server 数据库测试中!', 'SQL&nbsp;Server&nbsp;数据库测试中!<br>SQL&nbsp;Server&nbsp;数据库测试中!<br>SQL&nbsp;Server&nbsp;数据库测试中!<br>SQL&nbsp;Server&nbsp;数据库测试中!', '', NULL, 'No', NULL, 'Yes');
GO


/****** Object:  Table [dbo].[lockip]    Script Date: 2005-9-5 22:18:48 ******/
CREATE TABLE [dbo].[lockip] (
	[IPID] [decimal](10, 0) IDENTITY (1, 1) NOT NULL ,
	[LockIP] [nvarchar] (15) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO



