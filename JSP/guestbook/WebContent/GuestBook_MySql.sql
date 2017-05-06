
-- 
-- �����껪JSP�����Ա�MYSQL���ݿ�Ǳ�
-- ���Ȱ�װ��MYSQL��������Ȼ����뱾�Ǳ��ļ����ڵ�Ŀ¼
-- ��MYSQL��ʾ����ִ����� \. GuestBook_MySql.sql 
-- 
-- ִ���Ժ��MYSQL���ݿ����� DreamTimeGuestBook ���ݿ⡣
--
-- 
-- ���ݿ�: `DreamTimeGuestBook`
-- 
DROP DATABASE `DreamTimeGuestBook`;
CREATE DATABASE `DreamTimeGuestBook`;
USE DreamTimeGuestBook;

-- --------------------------------------------------------

-- 
-- ��Ľṹ `admin`
-- 

CREATE TABLE admin (
  AdminID int(11) NOT NULL auto_increment,
  User varchar(32) default NULL,
  Pwd varchar(32) default NULL,
  AdminName varchar(20) default NULL,
  AdminUid varchar(20) default NULL,
  AdminQQ varchar(10) default NULL,
  AdminMail varchar(40) default NULL,
  AdminHomePage varchar(40) default NULL,
  AdminPhone varchar(12) default NULL,
  AdminAddress varchar(50) default NULL,
  AdminNote longtext,
  PRIMARY KEY  (AdminID),
  KEY AdminID (AdminUid)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- �������е����� `admin`
-- 

INSERT INTO admin (AdminID, User, Pwd, AdminName, AdminUid, AdminQQ, AdminMail, AdminHomePage, AdminPhone, AdminAddress, AdminNote) VALUES (1, 'dream', '8812662DCF3E5DB0247C0F85909363FC', '�����껪', '��������', '122142023', 'fanwsp@126.com', 'http://wsp.hniuca.net', '0731-8087321', '����', '��ӭʹ�������껪JSP�����Ա���');

-- --------------------------------------------------------

-- 
-- ��Ľṹ `config`
-- 

CREATE TABLE config (
  LybID int(11) NOT NULL auto_increment,
  LybTitle varchar(30) NOT NULL default '',
  LybHomePage varchar(50) default NULL,
  LybPageSize smallint(6) default '0',
  LybMaxByte int(11) default '0',
  LybCopyRight varchar(50) default NULL,
  LybVersion varchar(20) default NULL,
  OpenSecret char(3) default NULL,
  OpenValidate char(3) default NULL,
  OpenUBB char(3) default NULL,
  OpenFace char(3) default NULL,
  EditInfo varchar(40) default NULL,
  ReplyInfo varchar(40) default NULL,
  NoReplyInfo varchar(40) default NULL,
  SecretInfo varchar(40) default NULL,
  LybSkin tinyint(3) unsigned default '0',
  LybNote longtext,
  PRIMARY KEY  (LybTitle),
  KEY LybID (LybID)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- �������е����� `config`
-- 

INSERT INTO config (LybID, LybTitle, LybHomePage, LybPageSize, LybMaxByte, LybCopyRight, LybVersion, OpenSecret, OpenValidate, OpenUBB, OpenFace, EditInfo, ReplyInfo, NoReplyInfo, SecretInfo, LybSkin, LybNote) VALUES (1, '�����껪���Ա�', 'http://wsp.hniuca.net', 10, 1200, 'DreamTime', 'V1.0', 'Yes', 'No', 'Yes', 'Yes', '�������ѱ�����Ա�����껪�༭��!', '�ǳ���л�������ԣ�', '���޻ظ�', '������ֻ�й���Ա�ɼ���', 3, '��ӭʹ�������껪JSP�����Ա���');

-- --------------------------------------------------------

-- 
-- ��Ľṹ `guestbook`
-- 

CREATE TABLE guestbook (
  ID int(11) NOT NULL auto_increment,
  Name varchar(20) default NULL,
  QQ varchar(10) default NULL,
  Mail varchar(50) default NULL,
  Sex char(1) default NULL,
  HomePage varchar(80) default NULL,
  ComeFrom varchar(50) default NULL,
  Face varchar(20) default NULL,
  IP varchar(15) default NULL,
  UpdateTime datetime default NULL,
  Title varchar(50) default NULL,
  Content longtext,
  ReContent longtext,
  ReTime datetime default NULL,
  Secret char(3) default NULL,
  EditTime date default NULL,
  Validate char(3) default NULL,
  PRIMARY KEY  (ID)
) TYPE=MyISAM AUTO_INCREMENT=6 ;

-- 
-- �������е����� `guestbook`
-- 

INSERT INTO guestbook (ID, Name, QQ, Mail, Sex, HomePage, ComeFrom, Face, IP, UpdateTime, Title, Content, ReContent, ReTime, Secret, EditTime, Validate) VALUES (1, '���� [�����껪]', '122142023', 'fanwsp@126.com', 'm', 'http://wsp.hniuca.net', '����0304��', '09', '127.0.0.1', '2005-08-31 11:50:04', '����', '�����껪JSP�����Ա���ʽ����!!!\r<br>�����껪JSP�����Ա���ʽ����!!!\r<br>�����껪JSP�����Ա���ʽ����!!!\r<br>�����껪JSP�����Ա���ʽ����!!!\r<br>�����껪JSP�����Ա���ʽ����!!!\r<br>\r<br>', '', '2005-08-31 11:51:28', 'No', NULL, 'Yes');
INSERT INTO guestbook (ID, Name, QQ, Mail, Sex, HomePage, ComeFrom, Face, IP, UpdateTime, Title, Content, ReContent, ReTime, Secret, EditTime, Validate) VALUES (2, '���� [�����껪]', '122142023', 'fanwsp@126.com', 'm', 'http://wsp.hniuca.net', 'net0304', '06', '172.16.166.51', '2005-08-31 13:17:27', '��ӭʹ��!', '��ӭʹ��!', '', '2005-08-31 13:17:27', 'No', NULL, 'Yes');
INSERT INTO guestbook (ID, Name, QQ, Mail, Sex, HomePage, ComeFrom, Face, IP, UpdateTime, Title, Content, ReContent, ReTime, Secret, EditTime, Validate) VALUES (3, 'flyying', '270963863', 'zhuyu2008@hongen.com', 'w', '', '����', '04', '172.16.195.106', '2005-08-31 21:39:12', '������', '���ò���������!������<img src="images/ubbface/12.gif"><img src="images/ubbface/79.gif">', 'лл����!', '2005-08-31 22:33:14', 'Yes', NULL, 'Yes');
INSERT INTO guestbook (ID, Name, QQ, Mail, Sex, HomePage, ComeFrom, Face, IP, UpdateTime, Title, Content, ReContent, ReTime, Secret, EditTime, Validate) VALUES (4, '���� [�����껪]', '122142023', 'fanwsp@126.com', 'm', 'http://wsp.hniuca.net', '����0304��', '10', '127.0.0.1', '2005-09-04 12:06:17', '���Ա�������', '�����껪JSP�����Ա�MYSQL���ݿ������!!!\r<br>�����껪JSP�����Ա�MYSQL���ݿ������!!!\r<br>�����껪JSP�����Ա�MYSQL���ݿ������!!!\r<br>�����껪JSP�����Ա�MYSQL���ݿ������!!!\r<br>�����껪JSP�����Ա�MYSQL���ݿ������!!!\r<br>\r<br>\r<br>', '', NULL, 'No', NULL, 'Yes');
INSERT INTO guestbook (ID, Name, QQ, Mail, Sex, HomePage, ComeFrom, Face, IP, UpdateTime, Title, Content, ReContent, ReTime, Secret, EditTime, Validate) VALUES (5, '���� [�����껪]', '122142023', 'fanwsp@126.com', 'm', 'http://wsp.hniuca.net', '����0304��', '06', '127.0.0.1', '2005-09-04 18:43:09', 'MYSQL���ݿ�������!', '�����껪JSP�����Ա�MYSQL���ݿ�������!!!\r<br>�����껪JSP�����Ա�MYSQL���ݿ�������!!!\r<br>�����껪JSP�����Ա�MYSQL���ݿ�������!!!\r<br>�����껪JSP�����Ա�MYSQL���ݿ�������!!!\r<br>�����껪JSP�����Ա�MYSQL���ݿ�������!!!', '', NULL, 'No', NULL, 'Yes');
INSERT INTO guestbook VALUES (6,'���� [�����껪]', '122142023', 'fanwsp@126.com', 'm', 'http://wsp.hniuca.net', '����0304��', '06', '127.0.0.1', '2005-09-04 18:43:09', 'SQL Server ���ݿ������!', 'SQL&nbsp;Server&nbsp;���ݿ������!<br>SQL&nbsp;Server&nbsp;���ݿ������!<br>SQL&nbsp;Server&nbsp;���ݿ������!<br>SQL&nbsp;Server&nbsp;���ݿ������!', '', NULL, 'No', NULL, 'Yes');

-- --------------------------------------------------------

-- 
-- ��Ľṹ `lockip`
-- 

CREATE TABLE lockip (
  IPID int(11) NOT NULL auto_increment,
  LockIP varchar(15) default NULL,
  PRIMARY KEY  (IPID),
  KEY IPID (IPID)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- �������е����� `lockip`
-- 

        