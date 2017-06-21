package bpmn;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;

public class InstructorForm implements ActionListener{

	public static void main(String[] args) {
		new InstructorForm().createAndShowGUI();
	}
	JLabel name = new JLabel("请假人姓名");
    JLabel locat = new JLabel("请假天数");
    JLabel nameapp = new JLabel("");
    JLabel locat2 = new JLabel("");
    JFrame frame = new JFrame("辅导员审批");	
    
    public  void createAndShowGUI() {
        // 确保一个漂亮的外观风格
        JFrame.setDefaultLookAndFeelDecorated(true);
        
// 创建及设置窗口
        
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //location.setEnabled(false);
        name.setBounds(10, 10, 100, 20);
        locat.setBounds(10, 40, 100, 20);
        nameapp.setBounds(80, 10, 90, 20);
        locat2.setBounds(80, 40, 50, 20);
        frame.setLayout(null);
        frame.add(locat);
        frame.add(name);
        //frame.add(location);
        frame.add(nameapp);
        frame.add(locat2); 
        
        setTest();
        
        
        JButton jbyes = new JButton("同意");
        jbyes.setBounds(10, 70, 90, 20);
        frame.add(jbyes);
        jbyes.addActionListener(this); 
        
        JButton jbno = new JButton("不同意");
        jbno.setBounds(80, 70, 90, 20);
        frame.add(jbno);
        jbno.addActionListener(this); 
        
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

	private void setTest() {
		TaskService taskService =  ProcessEngineFactory.getProcessEngine().getTaskService();
		Task taskOfDeptLeader = taskService.createTaskQuery()
                .taskCandidateGroup("instructor").singleResult();//查询deptleader需要审批的任务名字
        

        
        String name =(String) taskService.getVariable(taskOfDeptLeader.getId(), "applyUser");//“name”对应前面set的variableName  
       // System.out.println(name);
        String days = (String) taskService.getVariable(taskOfDeptLeader.getId(), "days");
        nameapp.setText(name);
        locat2.setText(days);
        
        
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		boolean result = false;
		if(e.getActionCommand().equals("同意")) {
			//System.out.println("同意");
			result = true;
		}
		// TODO Auto-generated method stub
		TaskService taskService =  ProcessEngineFactory.getProcessEngine().getTaskService();
		Task taskOfDeptLeader = taskService.createTaskQuery()
                .taskCandidateGroup("instructor").singleResult();//查询deptleader需要审批的任务名字
		System.out.println(taskOfDeptLeader);
		taskService.claim(taskOfDeptLeader.getId(), "leaderUser");
        HashMap<String, Object> variables = new HashMap<String, Object>();
        variables.put("approved", result);
        taskService.complete(taskOfDeptLeader.getId(), variables);
        
        this.frame.dispose();
        
        new ResultForm().createAndShowGUI();
	}
}
