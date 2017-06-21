package bpmn;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;

public class StudentForm implements ActionListener{

	JFrame frame = new JFrame("学生请假");	
	JTextField nameField = new JTextField(30);
    
    JComboBox comboBox=new JComboBox();  
    
    
    //JTextField location = new JTextField("beyole", 10);
    JLabel name = new JLabel("输入姓名");
    JLabel locat = new JLabel("请假天数");
	public  void createAndShowGUI() {
        // 确保一个漂亮的外观风格
        JFrame.setDefaultLookAndFeelDecorated(true);

        // 创建及设置窗口
        
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        comboBox.addItem("1");  
        comboBox.addItem("2");  
        comboBox.addItem("3");  
        comboBox.addItem("7");
        
        //location.setEnabled(false);
        name.setBounds(10, 10, 100, 20);
        locat.setBounds(10, 40, 100, 20);
        nameField.setBounds(80, 10, 90, 20);
        comboBox.setBounds(80, 40, 50, 20);
        frame.setLayout(null);
        frame.add(locat);
        frame.add(name);
        //frame.add(location);
        frame.add(nameField);
        frame.add(comboBox); 
        
        JButton jb = new JButton("请假");
        jb.setBounds(10, 70, 90, 20);
        frame.add(jb);
        jb.addActionListener(this); 

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
	
	public   void usertask(){
		System.out.println(String.valueOf(comboBox.getSelectedItem()));
		
		try {
			ProcessEngine processEngine = ProcessEngineFactory.getProcessEngine();
			TaskService taskService = processEngine.getTaskService();
			Task taskOfStudent = taskService.createTaskQuery()
			        .taskCandidateGroup("student").singleResult();//查询deptleader需要审批的任务名字
			
			//String name =(String) taskService.getVariable("usertask1", "name");//“name”对应前面set的variableName  
			
			// System.out.println(name);  
			System.out.println(taskOfStudent);
			
			//assertNotNull(taskOfDeptLeader);
			//assertEquals("领导审批", taskOfDeptLeader.getName());

			Map<String, Object> variables2 = new HashMap<String, Object>();
			taskService.claim(taskOfStudent.getId(), "student1");
			variables2 = new HashMap<String, Object>();
			variables2.put("applyUser", nameField.getText());
			variables2.put("days", String.valueOf(comboBox.getSelectedItem()));
			processEngine.getTaskService().setVariable(taskOfStudent.getId(), "applyUser", nameField.getText());
			processEngine.getTaskService().setVariable(taskOfStudent.getId(), "days", String.valueOf(comboBox.getSelectedItem()));
			taskService.complete(taskOfStudent.getId(), variables2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
        this.frame.dispose();
        
        new InstructorForm().createAndShowGUI();
	}
	

	// static Student student ;
    public static void main(String[] args) {
    	StudentForm student = new StudentForm();
    	student.createAndShowGUI();
        // 显示应用 GUI
//        javax.swing.SwingUtilities.invokeLater(new Runnable() {
//            public void run() {
//                createAndShowGUI();
//            }
//        });
    }

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		System.out.println("开始请假");
		usertask();
	}	
}
