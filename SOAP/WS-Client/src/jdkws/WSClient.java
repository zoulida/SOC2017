package jdkws;



/**
 * @author gacl
 * ����WebService�Ŀͻ���
 */
public class WSClient {

    public static void main(String[] args) {
        //����һ�����ڲ���WebServiceImplʵ���Ĺ�����WebServiceImplService����wsimport�������ɵ�
        WebServiceImplService factory = new WebServiceImplService();
        //ͨ����������һ��WebServiceImplʵ����WebServiceImpl��wsimport�������ɵ�
        WebServiceImpl wsImpl = factory.getWebServiceImplPort();
        
        long startTime = System.currentTimeMillis();//��ȡ��ǰʱ��
        
        
        //����WebService��sayHello����
        String resResult = wsImpl.sayHello("SOC");
        System.out.println("����WebService��sayHello�������صĽ���ǣ�"+resResult);
        System.out.println("---------------------------------------------------");
        
        long endTime = System.currentTimeMillis();
        System.out.println("��������ʱ�䣺"+(endTime-startTime)+"ms");
        
        //����WebService��save����
        resResult = wsImpl.save("haha","123");
        System.out.println("����WebService��save�������صĽ���ǣ�"+resResult);
    }
}