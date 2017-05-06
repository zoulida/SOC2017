package jdkWS;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.xml.ws.Endpoint;


/**
 * @author gacl
 * 用于发布WebService的监听器
 */
//使用Servlet3.0提供的@WebListener注解将实现了ServletContextListener接口的WebServicePublishListener类标注为一个Listener
@WebListener
public class WebServicePublishListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        //WebService的发布地址
        String address = "http://localhost:8081/WS_Server/WebService";
        //发布WebService，WebServiceImpl类是WebServie接口的具体实现类
        Endpoint.publish(address , new WebServiceImpl());
        System.out.println("使用WebServicePublishListener发布webservice成功!");
    }
}