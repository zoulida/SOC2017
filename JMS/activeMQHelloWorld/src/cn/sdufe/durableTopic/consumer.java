package cn.sdufe.durableTopic;

import javax.jms.*;

import org.apache.activemq.ActiveMQConnectionFactory;

public class consumer {

    public static void main(String []args) throws JMSException {
    	ActiveMQConnectionFactory factory = new ActiveMQConnectionFactory("tcp://localhost:61616");
	    Connection connection = factory.createConnection();
	    String clientID ="1";
	    connection.setClientID(clientID);//持久订阅需要设置这个，据说，负载情况下每个客户端id要不同，不然会报错
	    connection.start();
	    Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
	    Topic reciveDest =session.createTopic("topic.persistent");
	   
	    MessageConsumer consumer = session.createDurableSubscriber(reciveDest, clientID);
	    int i=0;
	    while(true) {
			Message msg = consumer.receive();
			if(msg instanceof TextMessage){
				String txt = ((TextMessage)msg).getText();
				System.out.println("收到的消息数："+(++i)+"收到的消息："+txt);
			}
	    }
    //connection.close();
    }
}
