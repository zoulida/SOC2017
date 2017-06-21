package bpmn;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngineConfiguration;

public class ProcessEngineFactory {  

    // 定义一个私有的构造方法
    private ProcessEngineFactory() {  
    }  

     // 将自身的实例对象设置为一个属性,并加上Static和final修饰符
    //private static final ProcessEngineFactory instance = new ProcessEngineFactory();  
    private static ProcessEngine processEngine = ProcessEngineConfiguration
	             .createStandaloneInMemProcessEngineConfiguration()
	             .buildProcessEngine();
    // 静态方法返回该类的实例
    public static ProcessEngine getProcessEngine() {  
    	
        return processEngine;  
    }  
  
}