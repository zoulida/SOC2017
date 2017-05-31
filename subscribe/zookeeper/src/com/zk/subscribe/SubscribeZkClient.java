
package com.zk.subscribe;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.I0Itec.zkclient.ZkClient;
import org.I0Itec.zkclient.serialize.BytesPushThroughSerializer;


public class SubscribeZkClient {
	    
	    //��Ҫ���ٸ�workserver
	    private static final int  CLIENT_QTY = 5;

	    private static final String  ZOOKEEPER_SERVER = "localhost:2181";
	    //�ڵ��·��
	    private static final String  CONFIG_PATH = "/config";//���ýڵ�
	    private static final String  COMMAND_PATH = "/command";//����ڵ�
	    private static final String  SERVERS_PATH = "/servers";//�������б�ڵ�
	       
	    public static void main(String[] args) throws Exception
	    {
	    	//�����洢���е�clients
			List<ZkClient> clients = null;
			//�����洢���е�workservers
			List<WorkServer> workServers = null;
			ManagerServer manageServer;
			try {
				clients = new ArrayList<ZkClient>();
				workServers = new ArrayList<WorkServer>();
				manageServer = null;
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

	        try
	        {
	        	ServerConfig initConfig = new ServerConfig();
	        	initConfig.setDbPwd("123456");
	        	initConfig.setDbUrl("jdbc:mysql://localhost:3306/mydb");
	        	initConfig.setDbUser("root");
	        	
	        	ZkClient clientManage = new ZkClient(ZOOKEEPER_SERVER, 5000, 5000, new BytesPushThroughSerializer());
	        	manageServer = new ManagerServer(SERVERS_PATH, COMMAND_PATH,CONFIG_PATH,clientManage,initConfig);
	        	manageServer.start();
	        	
	        	//���ݶ����work���������������������ע�ᣬȻ������
	            for ( int i = 0; i < CLIENT_QTY; ++i )
	            {
	                ZkClient client = new ZkClient(ZOOKEEPER_SERVER, 5000, 5000, new BytesPushThroughSerializer());
	                clients.add(client);
	                ServerData serverData = new ServerData();
	                serverData.setId(i);
	                serverData.setName("WorkServer#"+i);
	                serverData.setAddress("192.168.1."+i);

	                WorkServer  workServer = new WorkServer(CONFIG_PATH, SERVERS_PATH, serverData, client, initConfig);
	                workServers.add(workServer);
	                workServer.start();	                
	                
	            }	            
	            System.out.println("�ûس����˳���\n");
	            new BufferedReader(new InputStreamReader(System.in)).readLine();
	            
	        }finally{
	        	//��workserver��client���ر�
	        	
	            System.out.println("Shutting down...");

	            for ( WorkServer workServer : workServers )
	            {
	            	try {
	            		workServer.stop();
					} catch (Exception e) {
						e.printStackTrace();
					}           	
	            }
	            for ( ZkClient client : clients )
	            {
	            	try {
	            		client.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
	            	
	            }
	        }
	    }	

}

