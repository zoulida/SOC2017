package bpmn;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.Map;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

public class Student2 {
	public static void main(String[] args) {
		
		new Student2().askforleave();
	}
	private void askforleave(){
		 ProcessEngine processEngine = ProcessEngineFactory.getProcessEngine();

	     RepositoryService repositoryService = processEngine.getRepositoryService();
	     String bpmnFileName = "bpmn/askforleave2.bpmn";
	     repositoryService
	             .createDeployment()
	             .addInputStream(
	                     "askforleave2.bpmn",
	                     this.getClass().getClassLoader()
	                             .getResourceAsStream(bpmnFileName)).deploy();

	     ProcessDefinition processDefinition = repositoryService
	             .createProcessDefinitionQuery().singleResult();
	     //assertEquals("SayHelloToLeave", processDefinition.getKey());

	     RuntimeService runtimeService = processEngine.getRuntimeService();

	     Map<String, Object> variables = new HashMap<String, Object>();
	    	 
	     ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(
	             "askforleave2", variables);
	     
	     StudentForm student = new StudentForm();
	    	student.createAndShowGUI();
	     //processEngine.getTaskService().setVariable("startevent1", "name", "我是menco"); 
	     //assertNotNull(processInstance);
	     //System.out.println("pid=" + processInstance.getId() + ", pdid="
	     //        + processInstance.getProcessVariables());
	     try {
			Thread.sleep(200000);
		} catch (InterruptedException e) {

			e.printStackTrace();
		}
	     /*
	     System.out.println("2222222222222");
	     
	     TaskService taskService = processEngine.getTaskService();
	        Task taskOfStudent = taskService.createTaskQuery()
	                .taskCandidateGroup("student").singleResult();//查询deptleader需要审批的任务名字
	        
	        //String name =(String) taskService.getVariable("usertask1", "name");//“name”对应前面set的variableName  
	        
	        // System.out.println(name);  
	        System.out.println(taskOfStudent);
	        
	        //assertNotNull(taskOfDeptLeader);
	        //assertEquals("领导审批", taskOfDeptLeader.getName());

	        Map<String, Object> variables2 = new HashMap<String, Object>();
	        taskService.claim(taskOfStudent.getId(), "leaderUser");
	        variables2 = new HashMap<String, Object>();
	        variables2.put("approved", true);
	        processEngine.getTaskService().setVariable(taskOfStudent.getId(), "name", "我是menco");
	        taskService.complete(taskOfStudent.getId(), variables);
	        
	        
	        
	        
	        Task taskOfDeptLeader = taskService.createTaskQuery()
	                .taskCandidateGroup("instructor").singleResult();//查询deptleader需要审批的任务名字
	        System.out.println(taskOfDeptLeader);

	        taskService.claim(taskOfDeptLeader.getId(), "leaderUser");
	        variables = new HashMap<String, Object>();
	        variables.put("approved", true);
	        String name =(String) taskService.getVariable(taskOfDeptLeader.getId(), "name");//“name”对应前面set的variableName  
	        System.out.println(name);  
	        taskService.complete(taskOfDeptLeader.getId(), variables);
	       */
	}
	

}
