import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
public class helloworld {  
    private Connection conn = null;  
    PreparedStatement statement = null;  
    // connect to MySQL  
    void connSQL() {  
        String urle = "jdbc:mysql://localhost:3306/testdb";//port：3306 database:testdb  
        String username = "root";//user  
        String password = "root";//password  
        try {   
            Class.forName("org.gjt.mm.mysql.Driver" );//加载驱动，连接数据库  
            conn = DriverManager.getConnection(urle,username, password );   
            }  
        //捕获加载驱动程序异常  
         catch ( ClassNotFoundException cnfex ) {  
             System.err.println(  
             "装载 JDBC/ODBC 驱动程序失败。" );  
             cnfex.printStackTrace();   
         }   
         //捕获连接数据库异常  
         catch ( SQLException sqlex ) {  
             System.err.println( "无法连接数据库" );  
             sqlex.printStackTrace();  
         }  
    }  
  
    // disconnect to MySQL  
    void deconnSQL() {  
        try {  
            if (conn != null)  
                conn.close();  
        } catch (Exception e) {  
            System.out.println("关闭数据库问题 ：");  
            e.printStackTrace();  
        }  
    }  
  
    // execute selection language  
    ResultSet selectSQL(String sql) {  
        ResultSet rs = null;  
        try {  
            statement = conn.prepareStatement(sql);  
            rs = statement.executeQuery(sql);  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }  
        return rs;  
    }  
  
    // execute insertion language  
    boolean insertSQL(String sql) {  
        try {  
            statement = conn.prepareStatement(sql);  
            statement.executeUpdate();  
            return true;  
        } catch (SQLException e) {  
            System.out.println("插入数据库时出错：");  
            e.printStackTrace();  
        } catch (Exception e) {  
            System.out.println("插入时出错：");  
            e.printStackTrace();  
        }  
        return false;  
    }  
    //execute delete language  
    boolean deleteSQL(String sql) {  
        try {  
            statement = conn.prepareStatement(sql);  
            statement.executeUpdate();  
            return true;  
        } catch (SQLException e) {  
            System.out.println("插入数据库时出错：");  
            e.printStackTrace();  
        } catch (Exception e) {  
            System.out.println("插入时出错：");  
            e.printStackTrace();  
        }  
        return false;  
    }  
    //execute update language  
    boolean updateSQL(String sql) {  
        try {  
            statement = conn.prepareStatement(sql);  
            statement.executeUpdate();  
            return true;  
        } catch (SQLException e) {  
            System.out.println("插入数据库时出错：");  
            e.printStackTrace();  
        } catch (Exception e) {  
            System.out.println("插入时出错：");  
            e.printStackTrace();  
        }  
        return false;  
    }  
    // show data in ju_users  
    void layoutStyle2(ResultSet rs) {  
        System.out.println("-----------------");  
        System.out.println("执行结果如下所示:");  
        System.out.println("-----------------");  
        System.out.println(" id" + "\t\t" + "name" +"\t\t" + "age" + "\t\t" +"work"+ "\t\t" + "others");  
        System.out.println("-----------------");  
        try {  
            while (rs.next()) {  
                System.out.println(rs.getInt("_id") + "\t\t"  
                        + rs.getString("name") + "\t\t"  
                        +rs.getInt("age") + "\t\t"  
                        + rs.getString("work")+ "\t\t"  
                        + rs.getString("others"));  
            }  
        } catch (SQLException e) {  
            System.out.println("显示时数据库出错。");  
            e.printStackTrace();  
        } catch (Exception e) {  
            System.out.println("显示出错。");  
            e.printStackTrace();  
        }  
    }  
  
    public static void main(String args[]) {  
  
        helloworld h = new helloworld();  
        h.connSQL();  
        String s = "select * from name_table";  
  
        String insert = "insert into name_table(_id,name,age,work,others) values("+15+",'csdn',"+24+",'M.S.','nupt')";  
        String update = "update name_table set age =19 where name= 'zhb'";  
        String delete = "delete from name_table where name= 'csdn'";  
  
        if (h.insertSQL(insert) == true) {  
            System.out.println("insert successfully");  
            ResultSet resultSet = h.selectSQL(s);  
            h.layoutStyle2(resultSet);  
        }  
        if (h.updateSQL(update) == true) {  
            System.out.println("update successfully");  
            ResultSet resultSet = h.selectSQL(s);     
            h.layoutStyle2(resultSet);  
        }  
        if (h.insertSQL(delete) == true) {  
            System.out.println("delete successfully");  
            ResultSet resultSet = h.selectSQL(s);  
            h.layoutStyle2(resultSet);  
        }  
        h.deconnSQL();  
    }  
}