package bpmn;

import java.awt.Dimension;
import java.awt.Toolkit;

import javax.swing.JFrame;
import javax.swing.JLabel;

import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;

public class ResultForm {
	 public static void main(String[] args) {
		 
	 }
	 JFrame frame = new JFrame("审批结果");
	 JLabel name = new JLabel("您的请假没有得到批准");
	 public  void createAndShowGUI() {
	        // 确保一个漂亮的外观风格
	        JFrame.setDefaultLookAndFeelDecorated(true);
	        
	// 创建及设置窗口
	        
	        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	        //location.setEnabled(false);
	        name.setBounds(10, 10, 100, 20);
	        resultContext();
	        frame.add(name);
	     // 显示窗口
	        frame.setSize(340,200);
	        //frame.pack();
	        frame.setVisible(true);
	        
	        int windowWidth = frame.getWidth(); //获得窗口宽
	        int windowHeight = frame.getHeight(); //获得窗口高
	       Toolkit kit = Toolkit.getDefaultToolkit(); //定义工具包
	       Dimension screenSize = kit.getScreenSize(); //获取屏幕的尺寸
	       int screenWidth = screenSize.width; //获取屏幕的宽
	        int screenHeight = screenSize.height; //获取屏幕的高
	        frame.setLocation(screenWidth/2-windowWidth/2, screenHeight/2-windowHeight/2);//设置窗口居中显示
	 }
	 private void resultContext() {
		// TODO Auto-generated method stub
		 TaskService taskService =  ProcessEngineFactory.getProcessEngine().getTaskService();
		 Task taskOfStudent = taskService.createTaskQuery()
			        .taskCandidateGroup("student").singleResult();//查询deptleader需要审批的任务名字
		 boolean approved = (Boolean)taskService.getVariable(taskOfStudent.getId(), "approved");
		 System.out.println(approved);
		 if(approved)
			 name.setText("恭喜您，您的请假获得了辅导员的批准！！！！");
	}
	
	
}
