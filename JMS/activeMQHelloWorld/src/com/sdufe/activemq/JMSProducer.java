package com.sdufe.activemq;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnection;
import org.apache.activemq.ActiveMQConnectionFactory;
/**
 * ��Ϣ�������ߣ������ߣ� 
 
 *
 */
public class JMSProducer {

	//Ĭ�������û���
	private static final String USERNAME = ActiveMQConnection.DEFAULT_USER;
	//Ĭ����������
	private static final String PASSWORD = ActiveMQConnection.DEFAULT_PASSWORD;
	//Ĭ�����ӵ�ַ
	private static final String BROKEURL = ActiveMQConnection.DEFAULT_BROKER_URL;
	//���͵���Ϣ����
	private static final int SENDNUM = 10;
	
	public static void main(String[] args) {
		//���ӹ���
		ConnectionFactory connectionFactory;
		//����
		Connection connection = null;
		//�Ự ���ܻ��߷�����Ϣ���߳�
		Session session;
		//��Ϣ��Ŀ�ĵ�
		Destination destination;
		//��Ϣ������
		MessageProducer messageProducer;
		//ʵ�������ӹ���
		connectionFactory = new ActiveMQConnectionFactory(JMSProducer.USERNAME, JMSProducer.PASSWORD, JMSProducer.BROKEURL);
		
		try {
			//ͨ�����ӹ�����ȡ����
			connection = connectionFactory.createConnection();
			//��������
			connection.start();
			//����session
			session = connection.createSession(true, Session.AUTO_ACKNOWLEDGE);
			//����һ������ΪHelloWorld����Ϣ����
			destination = session.createQueue("sdufe");
			//������Ϣ������
			messageProducer = session.createProducer(destination);
			//������Ϣ
			sendMessage(session, messageProducer);
			
			session.commit();
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(connection != null){
				try {
					connection.close();
				} catch (JMSException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	/**
	 * ������Ϣ
	 * @param session
	 * @param messageProducer  ��Ϣ������
	 * @throws Exception
	 */
	public static void sendMessage(Session session,MessageProducer messageProducer) throws Exception{
		for (int i = 0; i < JMSProducer.SENDNUM; i++) {
			//����һ���ı���Ϣ 
			TextMessage message = session.createTextMessage("ActiveMQ ������Ϣ" +i);
			System.out.println("������Ϣ��Activemq ������Ϣ" + i);
			//ͨ����Ϣ�����߷�����Ϣ 
			messageProducer.send(message);
		}
		
	}
}
