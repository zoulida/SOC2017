package com;

public class test {
	public static void main(String[] args) throws Exception {  
		MyService mys = new MyServiceStub("http://localhost:8080/axis2/services/MyService.MyServiceHttpEndpoint");
		
		long startTime = System.currentTimeMillis();//获取当前时间
		
		SayHello sh = new SayHello();
		sh.setName("Bob");
		SayHelloResponse rsp = mys.sayHello(sh);
		System.out.println(rsp.get_return());  
		
		long endTime = System.currentTimeMillis();
        System.out.println("程序运行时间："+(endTime-startTime)+"ms");
	}
}
