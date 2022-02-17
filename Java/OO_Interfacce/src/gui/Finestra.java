/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui;

import java.awt.Button;
import java.awt.HeadlessException;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 *
 * @author tss
 */
public class Finestra extends JFrame implements ActionListener{
    
    private Button btn;
   
    public Finestra(String title) throws HeadlessException {
        super(title);
        this.setBounds(100, 100, 400, 500);
        this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        this.btn = new Button("test");
        btn.setBounds(100,100,100, 50);
        this.getContentPane().setLayout(null);
        this.getContentPane().add(this.btn);
        
        this.btn.addActionListener(this);
        this.btn.addActionListener(new MioAscoltatore());
        this.addMouseMotionListener(new MioAscoltatore());
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        JOptionPane.showMessageDialog(this, "click intercettato da Finestra!!");
    }
    
    
}
