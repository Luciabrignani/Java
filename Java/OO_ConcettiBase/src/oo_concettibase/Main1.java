/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oo_concettibase;

import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author tss
 */
public class Main1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
        ArrayList<A> list = new ArrayList<>();
        list.add(new A());
        list.add(new B());
        list.add(new A());
        list.add(new B());
        list.add(new C());
        eseguiM2(list);
    }
       
    public static void eseguiM2(ArrayList<A> list){
        for(A a : list){
            a.m2();
        }
    }
   
}
