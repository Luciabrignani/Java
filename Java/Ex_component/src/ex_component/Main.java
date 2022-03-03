/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ex_component;

/**
 *
 * @author tss
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Component cpu1 = new Component(Type.CPU, "CORE i7"),
                  cpu2 = new Component(Type.CPU, "CORE i5"),
                  board1= new Component(Type.BOARD, "Prime_X470"),
                  board2= new Component(Type.BOARD, "Prime_Z370"),
                  ram= new Component(Type.RAM, "8 GB");
        
        cpu1.setIncompatible(board2);
        board1.setIncompatible(cpu2);
        board2.setIncompatible(cpu1);
        
        Configuration pc= new Configuration();
        System.out.println(pc.add(cpu1));
        System.out.println(pc.add(cpu2));
        System.out.println(pc.add(board2));
        System.out.println(pc.add(board1));
        System.out.println(pc.add(ram));
                  
                  
    }
    
}
