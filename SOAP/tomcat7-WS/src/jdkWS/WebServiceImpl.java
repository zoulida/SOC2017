package jdkWS;


import javax.jws.WebService;

/**
 * @author zoulida
 * SEI�ľ���ʵ��
 */
//ʹ��@WebServiceע���עWebServiceI�ӿڵ�ʵ����WebServiceImpl
@WebService
public class WebServiceImpl implements WebServiceI {

    public String sayHello(String name) {
        System.out.println("WebService sayHello "+name);
        return "sayHello "+name;
    }

    public String save(String name, String pwd) {
        System.out.println("WebService save "+name+"�� "+pwd);
        return "save Success";
    }
}