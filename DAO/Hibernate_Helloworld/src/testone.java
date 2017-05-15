import java.util.List;  
  
import org.hibernate.Query;  
import org.hibernate.Session;  
import org.hibernate.SessionFactory;  
import org.hibernate.Transaction;

import org.hibernate.cfg.Configuration;  
  
public class testone {  
      
    //����  
    public static void all()  
    {  
        Query q = session.createQuery("select c.id,c.username from TestDb as c");  
          
        List l = q.list();  
        for(int i=0;i<l.size();i++)  
        {  
            //TestDb user = (TestDb)l.get(i);  
            //System.out.println(user.getUsername());  
  
              Object[] row = (Object[])l.get(i);;  
              Long id = (Long)row[0];  
              String name = (String)row[1];    
              System.out.println(id+" "+name);  
        }  
    }  
      
    //��ȡ  
    public static void load()  
    {  
        Customer obj = (Customer) session.load(Customer.class, new Integer(4));  
        System.out.println(obj.getUsername());  
    }  
      
    //����  
    public static void update()  
    {  
    	Customer obj = (Customer) session.load(Customer.class, new Integer(4));  
        obj.setUsername("cg5");  
    }  
      
    //����  
    public static void insert()  
    {  
    	Customer user = new Customer();  
        user.setUsername("ok");  
  
        session.save(user);  
    }  
      
    static SessionFactory sessionFactory;  
    static Session session ;  
    static Transaction tx ;  
      
    private static void init()  
    {  
    	//new AnnotationConfiguration().configure().buildSessionFactory(); 
    	sessionFactory = new Configuration().configure().buildSessionFactory();  
        session = sessionFactory.openSession();  
        tx = session.beginTransaction();  
    }  
      
    private static void close()  
    {  
        tx.commit();  
        session.close();  
        sessionFactory.close();  
    }  
      
    public static void main(String[] args)   
    {  
        init(); 
        //insert();
        update();  
        close();  
    }  
}  