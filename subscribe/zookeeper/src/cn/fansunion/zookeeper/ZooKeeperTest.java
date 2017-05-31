
package cn.fansunion.zookeeper;
import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.ZooDefs.Ids;
import org.apache.zookeeper.ZooKeeper;
  
public class ZooKeeperTest {
  
    private static final int TIME_OUT = 30000;
    private static final String HOST = "localhost:2181";
    public static void main(String[] args) throws Exception{
 
 
        ZooKeeper zookeeper = new ZooKeeper(HOST, TIME_OUT, null);
        System.out.println("=========�����ڵ�===========");
        if(zookeeper.exists("/test", false) == null)
        {
           zookeeper.create("/test", "znode1".getBytes(), Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
        }
        System.out.println("=============�鿴�ڵ��Ƿ�װ�ɹ�===============");
        System.out.println(new String(zookeeper.getData("/test", false, null)));
         
        System.out.println("=========�޸Ľڵ������==========");
        String data = "zNode2";
        zookeeper.setData("/test", data.getBytes(), -1);
         
        System.out.println("========�鿴�޸ĵĽڵ��Ƿ�ɹ�=========");
        System.out.println(new String(zookeeper.getData("/test", false, null)));
         
        System.out.println("=======ɾ���ڵ�==========");
        zookeeper.delete("/test", -1);
         
        System.out.println("==========�鿴�ڵ��Ƿ�ɾ��============");
        System.out.println("�ڵ�״̬��" + zookeeper.exists("/test", false));
         
        zookeeper.close();
    } 
}