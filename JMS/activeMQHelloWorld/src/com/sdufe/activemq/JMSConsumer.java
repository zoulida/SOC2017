package com.sdufe.activemq;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageConsumer;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnection;
import org.apache.activemq.ActiveMQConnectionFactory;
/**
 * ��Ϣ�������ߣ������ߣ�
 * 
 *
 */
public class JMSConsumer {

	private static final String USERNAME = ActiveMQConnection.DEFAULT_USER;//Ĭ�������û���
	private static final String PASSWORD = ActiveMQConnection.DEFAULT_PASSWORD;//Ĭ����������
	private static final String BROKEURL = ActiveMQConnection.DEFAULT_BROKER_URL;//Ĭ�����ӵ�ַ
	
	public static void main(String[] args) {
		ConnectionFactory connectionFactory;//���ӹ���
		Connection connection = null;//����
		
		Session session;//�Ự ���ܻ��߷�����Ϣ���߳�
		Destination destination;//��Ϣ��Ŀ�ĵ�
		
		MessageConsumer messageConsumer;//��Ϣ��������
		
		//ʵ�������ӹ���
		connectionFactory = new ActiveMQConnectionFactory(JMSConsumer.USERNAME, JMSConsumer.PASSWORD, JMSConsumer.BROKEURL);
		
		try {
			//ͨ�����ӹ�����ȡ����
			connection = connectionFactory.createConnection();
			//��������
			connection.start();
			//����session
			session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
			//����һ������HelloWorld����Ϣ����
			destination = session.createQueue("sdufe");
			//������Ϣ������
			messageConsumer = session.createConsumer(destination);
			
			while (true) {
				TextMessage textMessage = (TextMessage) messageConsumer.receive(100000);
				if(textMessage != null){
					System.out.println("�յ�����Ϣ:" + textMessage.getText());
				}else {
					break;
				}
			}
			
			
		} catch (JMSException e) {
			e.printStackTrace();
		}
		
	}
}
