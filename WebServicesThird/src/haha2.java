import java.rmi.RemoteException;

import org.apache.axis2.AxisFault;

import cn.com.webxml.GetMobileCodeInfo;
import cn.com.webxml.GetMobileCodeInfoResponse;
import cn.com.webxml.MobileCodeWS;
import cn.com.webxml.MobileCodeWSStub;



public class haha2 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MobileCodeWS mys;
		try {
			mys = new MobileCodeWSStub("http://ws.webxml.com.cn/WebServices/MobileCodeWS.asmx?wsdl");
		
		
		long startTime = System.currentTimeMillis();//获取当前时间
		
		GetMobileCodeInfo sh = new GetMobileCodeInfo();
		sh.setMobileCode("13969113599");
		GetMobileCodeInfoResponse rsp = mys.getMobileCodeInfo(sh);
		System.out.println(rsp.getGetMobileCodeInfoResult());  
		
		long endTime = System.currentTimeMillis();
        System.out.println("程序运行时间："+(endTime-startTime)+"ms");
		} catch (AxisFault e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
