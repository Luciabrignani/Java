/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oo_interfacce;

/**
 *
 * @author tss
 */
public interface B extends A {
    public default void m3(){
        System.out.println("m3");
    }
    
}
