package cn.sdufe.topic;


import javax.jms.Connection;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.jms.Topic;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.broker.BrokerService;
import org.apache.activemq.command.ActiveMQTopic;

public class TopicTest {

public static void main(String[] args) throws Exception {
        ActiveMQConnectionFactory factory = new ActiveMQConnectionFactory("tcp://localhost:61616");
        Connection connection = factory.createConnection();
        connection.start();
        
        
        
        //创建一个Topic
        Topic topic= new ActiveMQTopic("zhangsan");
        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
        

        //创建一个生产者，然后发送多个消息。
        MessageProducer producer = session.createProducer(topic);
        for(int i=0; i<10; i++){
        	String messege = "sdufe:" + i;
        	System.out.println("发送消息 " + messege);
            producer.send(session.createTextMessage(messege));
        }
        
    }
}