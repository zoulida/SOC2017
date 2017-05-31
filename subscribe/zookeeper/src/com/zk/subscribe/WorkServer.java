
package com.zk.subscribe;
import org.I0Itec.zkclient.IZkChildListener;
import org.I0Itec.zkclient.IZkDataListener;
import org.I0Itec.zkclient.ZkClient;
import org.I0Itec.zkclient.exception.ZkNoNodeException;
import org.I0Itec.zkclient.exception.ZkNodeExistsException;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * ������������
 * workServer����������Ϣ
 *
 */
public class WorkServer{
	private String serversPath;
	private String configPath;
	private ZkClient zkClient;
	private ServerConfig config;
    private ServerData serverData;
    
	private IZkDataListener dataListener;//���ݼ�����
	
	
	/**
	 * 
	 * @param configPath ����config�ڵ��·��
	 * @param serversPath ����servers�ڵ��·��
	 * @param serverData   ����ǰ�������Ļ�����Ϣ
	 * @param zkClient     �ײ���zookeeper��Ⱥͨ�ŵ����
	 * @param initconfig   ��ǰ�������ĳ�ʼ����
	 */
	public WorkServer(String configPath,String serversPath,ServerData serverData,ZkClient zkClient, ServerConfig initconfig){
		
		this.configPath = configPath;
		this.serversPath = serversPath;
	    this.serverData = serverData;
		this.zkClient = zkClient;
		this.config = initconfig;
		
		/**
		 * dataListener ���ڼ���config�ڵ�����ݸı�
		 */
		this.dataListener = new IZkDataListener() {
			
			public void handleDataDeleted(String arg0) throws Exception {
				
			}
			
			/**
			 * �����ݵ�ֵ�ı�ʱ�����
			 * Object data,���data�ǽ�ServerConfig����ת��json�ַ�������
			 * ����ͨ�������е�Object data �õ���ǰ���ݽڵ����µ�������Ϣ
			 * �õ����data��Ϣ���������л���ServerConfig����Ȼ����µ��Լ���serverconfig������
			 */
			public void handleDataChange(String dataPath, Object data) throws Exception {
				String retJson = new String((byte[])data);
			    ServerConfig serverConfigLocal = (ServerConfig)JSON.parseObject(retJson,ServerConfig.class);
			    //��������
			    updateConfig(serverConfigLocal);
			    System.out.println("new work server config is:"+serverConfigLocal.toString());
			}
		};
		
	}
	
	/**
	 * ���������
	 */
	public void start(){
		System.out.println("work server start...");
		initRunning();
	}
	
	/**
	 * �����ֹͣ
	 */
	public void stop(){
		System.out.println("work server stop...");
		//ȡ������
		zkClient.unsubscribeDataChanges(configPath, dataListener);
	
	}
	
	/**
	 * �������ĳ�ʼ��
	 */
	private void initRunning(){
		registMeToZookeeper();
		//����config�ڵ�ĸı�
		zkClient.subscribeDataChanges(configPath, dataListener);
	}
	
	/**
	 * ����ʱ��zookeeperע���Լ�
	 */
	private void registMeToZookeeper(){
		//��zookeeper��ע���Լ��Ĺ�����ʵ������servers�ڵ���ע��һ����ʱ�ڵ�
		//������ʱ�ڵ�
		String mePath = serversPath.concat("/").concat(serverData.getAddress());
	    try{
	    	//�����ǽ�json���л�
			zkClient.createEphemeral(mePath, JSON.toJSONString(serverData).getBytes());	
	    } catch (ZkNoNodeException e) {
	    	//���ڵ㲻����
			zkClient.createPersistent(serversPath, true);
			registMeToZookeeper();
		}
		
	}
	
	/**
	 * ��������zookeeper��config�ڵ��������Ϣ�ı�ʱ��Ҫ��ȡ������Ϣ�������Լ���������Ϣ
	 */
	private void updateConfig(ServerConfig serverConfig){
		this.config = serverConfig;
	}
	
}

