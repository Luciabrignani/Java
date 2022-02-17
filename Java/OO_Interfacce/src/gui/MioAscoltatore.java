/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import javax.swing.JOptionPane;

/**
 *
 * @author tss
 */
public class MioAscoltatore extends MouseAdapter implements ActionListener  {

    @Override
    public void actionPerformed(ActionEvent e) {
        JOptionPane.showMessageDialog(null, "click intercettato da MioAscoltatore");
    }

    @Override
    public void mouseMoved(MouseEvent e) {
         System.out.println("movimento mouse " + e.getX());
    }

    
    
}
