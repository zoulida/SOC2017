package jdkWS;


import javax.xml.ws.Endpoint;



/**
 * @author zoulida
 *
 * ����Web Service
 */
public class WebServicePublish {
	//ע�⣬ֻ��jdk1.7�ſ������С�

    public static void main(String[] args) {
        //����WebService�ķ�����ַ�������ַ�����ṩ��������Webervice��URL��ַ��URL��ַ��ʽΪ��http://ip:�˿ں�/xxxx
        //String address = "http://192.168.1.100:8989/";���WebService������ַ��д���ǺϷ���
        //String address = "http://192.168.1.100:8989/Webservice";���WebService������ַ���ǺϷ���
        String address = "http://localhost:8989/WS_Server/Webservice";
        //ʹ��Endpoint���ṩ��publish��������WebService������ʱҪ��֤ʹ�õĶ˿ں�û�б�����Ӧ�ó���ռ��
        Endpoint.publish(address , new WebServiceImpl());
        System.out.println("����webservice�ɹ�!");
    }
}