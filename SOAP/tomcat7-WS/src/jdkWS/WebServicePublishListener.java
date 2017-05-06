package jdkWS;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.xml.ws.Endpoint;


/**
 * @author gacl
 * ���ڷ���WebService�ļ�����
 */
//ʹ��Servlet3.0�ṩ��@WebListenerע�⽫ʵ����ServletContextListener�ӿڵ�WebServicePublishListener���עΪһ��Listener
@WebListener
public class WebServicePublishListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        //WebService�ķ�����ַ
        String address = "http://localhost:8081/WS_Server/WebService";
        //����WebService��WebServiceImpl����WebServie�ӿڵľ���ʵ����
        Endpoint.publish(address , new WebServiceImpl());
        System.out.println("ʹ��WebServicePublishListener����webservice�ɹ�!");
    }
}