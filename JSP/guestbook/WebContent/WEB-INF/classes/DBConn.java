/*
 *******  java����Access���ݿ����  *************
 *******      ʹ��Jdbc����Access,mysql,sqlserver���ݿ� *******
 *  Դ�ļ���:     DBConnAccess.java
 *
 *	���ߣ������껪
 *	Email:fanwsp@126.com
 *	HomePage:http://wsp.hniuca.net
 *  QQ:122142023 
 * 	CopyRight(c)2005-2006 by DreamTime 
 *
*/


package dreamtime.guestbook;			//ָ�������ڵİ�
import java.sql.*;						//�������ݿ��������

public class DBConn						//���췽������ʼ��
{

    private Connection conn;			//���Ӷ���
	private Statement stmt;				//������
	private ResultSet rs;				//���������
	
    private String accessdriver;		//����Access���������ַ���
    private String accessURL; 			//����Access�����ַ���			
   
    private String MySqldriver;			//MYSQL Server���������ַ���
    private String MySqlURL; 			//MYSQL Server�����ַ���
    
    private String sqldriver;			//SQL Server���������ַ���
    private String sqlURL; 				//SQL Server�����ַ���
	
    
    
    public DBConn()
    {
    	conn = null;
    }


	//�÷����Ӳ����õ����ݿ�·�������ӵ������ַ�������,Ȼ���ٽ�������
	//���� dbpath��Access���ݿ�·��
    public Connection getConnToAccess(String dbpath){
    	try{
    		//Access��������
        	accessdriver = "sun.jdbc.odbc.JdbcOdbcDriver";		
        	//�����ַ���
        	accessURL = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=";
    		accessURL=accessURL+dbpath;
	    	Class.forName(accessdriver);
	    	conn = DriverManager.getConnection(accessURL);
	    	}catch(Exception e){
	    		System.out.println("�������ݿ��������ϸ���1111111111");
	    		e.printStackTrace();
	    		//System.err.println(e.getMessage());
	    	}
	    return conn;
    }
     
     
    /******************************************************************************
	 *		   ��  org.gjt.mm.mysql.Driver ����  **********************************
	 *  �÷���ȡ������������ֲ�������������ַ�����Ȼ���ٽ�������
	 *  server;dbname,user,pass,port �ֱ��ʾMYSQL �������ĵ�ַ�����ݿ⣬�û��������룬�˿�
	 ********************************************************************************/
	 
     public Connection getConnToMySql(String server,String dbname,String user,String pass,String port){
    	try{
    		
    		//MYSQl��������
     		MySqldriver = "org.gjt.mm.mysql.Driver";	
        	MySqlURL = "jdbc:mysql://";  					//�����ַ���һ����
    		//�����������ַ���
        	MySqlURL =MySqlURL+server+":"+port+"/"+dbname+"?user="+user+"&password="+pass+"&useUnicode=true&characterEncoding=GB2312"; 
	    	Class.forName(MySqldriver);
	    	conn = DriverManager.getConnection(MySqlURL);
	    	}catch(Exception e){
	    		System.out.println("�������ݿ��������ϸ���2");
	    		//System.err.println(e.getMessage());
	    	}
	    return conn;
    } 
    
    
    /**************************************************************************
	 *		��net.sourceforge.jtds.jdbc.Driver   ******************************
 	 *				(http://jtds.sourceforge.net/)
 	 *		��Win2003Server�ϰ�װSQLSERVER2000�����밲װ����sp3
 	 *
	 *  �÷���ȡ������������ֲ�������������ַ�����Ȼ���ٽ�������
	 *  server;dbname,user,pass,port �ֱ��ʾSQL Server �������ĵ�ַ�����ݿ⣬�û��������룬�˿�
	 ********************************************************************************/
	 
     public Connection getConnToSql(String server,String dbname,String user,String pass,String port){     	
    	try{
    		//SQL Server����������net.sourceforge.jtds.jdbc.Driver
     		sqldriver = "net.sourceforge.jtds.jdbc.Driver";	
        	sqlURL = "jdbc:jtds:sqlserver://";  			//�����ַ���һ����
    		//�����������ַ���
        	sqlURL =sqlURL+server+":"+port+"/"+dbname+";USER="+user+";PASSWORD="+pass+""; 
	    	Class.forName(sqldriver);
	    	conn = DriverManager.getConnection(sqlURL);
	    	}catch(Exception e){
	    		System.out.println("�������ݿ��������ϸ���3");
	    		System.err.println(e.getMessage());
	    	}
	    return conn;
    }
    
    	
   //�ر����ݿ�����
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
