package Threads;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
class InnerClassEvent extends JFrame{
     JButton btn;
    public InnerClassEvent(){
    	//�¼�Դ
        super("Java�¼���������");
         setLayout(new FlowLayout());
         setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
         btn=new JButton("���");
         btn.addActionListener(new InnerClass());//���¼�����
         getContentPane().add(btn);
         setBounds(200,200,300,160);
         setVisible(true);
     }
    
    class InnerClass implements ActionListener{//������
        public void actionPerformed (ActionEvent e){
             Container c=getContentPane();
             c.setBackground(Color.red);
         }
     }
    
    public static void main(String args[]){
        new InnerClassEvent();
     }
}
