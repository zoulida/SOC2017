package cn.sdufe.durableTopic;



import javax.jms.*;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQTopic;

public class Publisher {

    public static void main(String []args) throws Exception {
    
    	ActiveMQConnectionFactory factory = new ActiveMQConnectionFactory("tcp://localhost:61616");
	    Connection connection = factory.createConnection();
	    connection.start();
	    Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
	   
	    Topic topic= new ActiveMQTopic("topic.persistent");
	    //TopicImpl sendDest = new TopicImpl("topic.persistent");
	   
	    MessageProducer producer =session.createProducer(topic);
	    producer.setDeliveryMode(DeliveryMode.PERSISTENT);//设置持久
	    String txt ="abc"+System.currentTimeMillis();
	    TextMessage sendMsg = session.createTextMessage(txt);
	   
	    producer.send(sendMsg);
	    System.out.println("消息发出:"+txt);
	   
	    connection.close();
	    }

}