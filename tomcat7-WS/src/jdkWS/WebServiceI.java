package jdkWS;


import javax.jws.WebMethod;
import javax.jws.WebService;

/**
 * @author zoulida
 * ����SEI(WebService EndPoint Interface(�ն�))
 */
//ʹ��@WebServiceע���עWebServiceI�ӿ�
@WebService
public interface WebServiceI {

    //ʹ��@WebMethodע���עWebServiceI�ӿ��еķ���
    @WebMethod
    String sayHello(String name);
    
    @WebMethod
    String save(String name,String pwd);
}