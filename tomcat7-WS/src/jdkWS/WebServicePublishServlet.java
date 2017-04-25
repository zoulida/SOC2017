package jdkWS;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.xml.ws.Endpoint;


/**
 * @author gacl
 * ���ڷ���WebService��Servlet
 */
//ʹ��Servlet3.0�ṩ��@WebServletע�⽫�̳�HttpServlet�����ͨJava���עΪһ��Servlet
//��value��������Ϊ���ַ���������WebServicePublishServlet�Ͳ��ṩ������ʵ�·��
//loadOnStartup��������WebServicePublishServlet�ĳ�ʼ��ʱ��
@WebServlet(value="",loadOnStartup=0)
public class WebServicePublishServlet extends HttpServlet {

    /* (non-Javadoc)
     * @see javax.servlet.GenericServlet#init()
     * ��WebServicePublishServlet��ʼ��ʱ����WebService
     */
    public void init() throws ServletException {
        //WebService�ķ�����ַ
        String address = "http://localhost:8888/WebService";
        //����WebService��WebServiceImpl����WebServie�ӿڵľ���ʵ����
        Endpoint.publish(address , new WebServiceImpl());
        System.out.println("ʹ��WebServicePublishServlet����webservice�ɹ�!");
    }
}
