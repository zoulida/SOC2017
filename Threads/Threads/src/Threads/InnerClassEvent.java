package Threads;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
class InnerClassEvent extends JFrame{
     JButton btn;
    public InnerClassEvent(){
    	//事件源
        super("Java事件监听机制");
         setLayout(new FlowLayout());
         setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
         btn=new JButton("点击");
         btn.addActionListener(new InnerClass());//绑定事件对象
         getContentPane().add(btn);
         setBounds(200,200,300,160);
         setVisible(true);
     }
    
    class InnerClass implements ActionListener{//监听器
        public void actionPerformed (ActionEvent e){
             Container c=getContentPane();
             c.setBackground(Color.red);
         }
     }
    
    public static void main(String args[]){
        new InnerClassEvent();
     }
}
