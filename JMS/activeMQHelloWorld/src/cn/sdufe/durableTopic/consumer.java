package cn.sdufe.durableTopic;

import javax.jms.*;

import org.apache.activemq.ActiveMQConnectionFactory;

public class consumer {

    public static void main(String []args) throws JMSException {
    	ActiveMQConnectionFactory factory = new ActiveMQConnectionFactory("tcp://localhost:61616");
	    Connection connection = factory.createConnection();
	    String clientID ="1";
	    connection.setClientID(clientID);//�־ö�����Ҫ�����������˵�����������ÿ���ͻ���idҪ��ͬ����Ȼ�ᱨ��
	    connection.start();
	    Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
	    Topic reciveDest =session.createTopic("topic.persistent");
	   
	    MessageConsumer consumer = session.createDurableSubscriber(reciveDest, clientID);
	    int i=0;
	    while(true) {
			Message msg = consumer.receive();
			if(msg instanceof TextMessage){
				String txt = ((TextMessage)msg).getText();
				System.out.println("�յ�����Ϣ����"+(++i)+"�յ�����Ϣ��"+txt);
			}
	    }
    //connection.close();
    }
}
