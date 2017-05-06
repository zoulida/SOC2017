/*
 *******  java连接Access数据库代码  *************
 *******      使用Jdbc连接Access,mysql,sqlserver数据库 *******
 *  源文件名:     DBConnAccess.java
 *
 *	作者：梦想年华
 *	Email:fanwsp@126.com
 *	HomePage:http://wsp.hniuca.net
 *  QQ:122142023 
 * 	CopyRight(c)2005-2006 by DreamTime 
 *
*/


package dreamtime.guestbook;			//指定类所在的包
import java.sql.*;						//导入数据库操作的类

public class DBConn						//构造方法，初始化
{

    private Connection conn;			//连接对象
	private Statement stmt;				//语句对象
	private ResultSet rs;				//结果集对象
	
    private String accessdriver;		//保存Access驱动程序字符串
    private String accessURL; 			//保存Access连接字符串			
   
    private String MySqldriver;			//MYSQL Server驱动程序字符串
    private String MySqlURL; 			//MYSQL Server连接字符串
    
    private String sqldriver;			//SQL Server驱动程序字符串
    private String sqlURL; 				//SQL Server连接字符串
	
    
    
    public DBConn()
    {
    	conn = null;
    }


	//该方法从参数得到数据库路径，并加到连接字符串后面,然后再建立连接
	//参数 dbpath：Access数据库路径
    public Connection getConnToAccess(String dbpath){
    	try{
    		//Access驱动程序
        	accessdriver = "sun.jdbc.odbc.JdbcOdbcDriver";		
        	//连接字符串
        	accessURL = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=";
    		accessURL=accessURL+dbpath;
	    	Class.forName(accessdriver);
	    	conn = DriverManager.getConnection(accessURL);
	    	}catch(Exception e){
	    		System.out.println("操作数据库出错，请仔细检查1111111111");
	    		e.printStackTrace();
	    		//System.err.println(e.getMessage());
	    	}
	    return conn;
    }
     
     
    /******************************************************************************
	 *		   用  org.gjt.mm.mysql.Driver 驱动  **********************************
	 *  该方法取得连接所需各种参数，组成连接字符串，然后再建立连接
	 *  server;dbname,user,pass,port 分别表示MYSQL 服务器的地址，数据库，用户名，密码，端口
	 ********************************************************************************/
	 
     public Connection getConnToMySql(String server,String dbname,String user,String pass,String port){
    	try{
    		
    		//MYSQl驱动程序
     		MySqldriver = "org.gjt.mm.mysql.Driver";	
        	MySqlURL = "jdbc:mysql://";  					//连接字符串一部分
    		//完整的连接字符串
        	MySqlURL =MySqlURL+server+":"+port+"/"+dbname+"?user="+user+"&password="+pass+"&useUnicode=true&characterEncoding=GB2312"; 
	    	Class.forName(MySqldriver);
	    	conn = DriverManager.getConnection(MySqlURL);
	    	}catch(Exception e){
	    		System.out.println("操作数据库出错，请仔细检查2");
	    		//System.err.println(e.getMessage());
	    	}
	    return conn;
    } 
    
    
    /**************************************************************************
	 *		用net.sourceforge.jtds.jdbc.Driver   ******************************
 	 *				(http://jtds.sourceforge.net/)
 	 *		在Win2003Server上安装SQLSERVER2000，必须安装补丁sp3
 	 *
	 *  该方法取得连接所需各种参数，组成连接字符串，然后再建立连接
	 *  server;dbname,user,pass,port 分别表示SQL Server 服务器的地址，数据库，用户名，密码，端口
	 ********************************************************************************/
	 
     public Connection getConnToSql(String server,String dbname,String user,String pass,String port){     	
    	try{
    		//SQL Server驱动程序，用net.sourceforge.jtds.jdbc.Driver
     		sqldriver = "net.sourceforge.jtds.jdbc.Driver";	
        	sqlURL = "jdbc:jtds:sqlserver://";  			//连接字符串一部分
    		//完整的连接字符串
        	sqlURL =sqlURL+server+":"+port+"/"+dbname+";USER="+user+";PASSWORD="+pass+""; 
	    	Class.forName(sqldriver);
	    	conn = DriverManager.getConnection(sqlURL);
	    	}catch(Exception e){
	    		System.out.println("操作数据库出错，请仔细检查3");
	    		System.err.println(e.getMessage());
	    	}
	    return conn;
    }
    
    	
   //关闭数据库连接
    public void close()
    {
        try{
            //rs.close();
            //stmt.close();
            conn.close(); 
        }catch(SQLException sqlexception){
            sqlexception.printStackTrace();
        }
    }
    
}
