/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.provaboolean;

import javax.swing.JOptionPane; 

/**
 *
 * @author tss
 */
public class leezboolean {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int myvoto; 
        
        String vototx= JOptionPane.showInputDialog("inserisci la media dei voti da 0 a 10");
        //converto in intero la stringa votox
        boolean lode = 
                vototx.equalsIgnoreCase("10 e lode")
                ||
                vototx.equalsIgnoreCase("10 con lode")
                ||
                vototx.equalsIgnoreCase("10 lode");
                        
        
        
        if (!lode){
            myvoto= Integer.parseInt(vototx);
        }
        else {
        myvoto = 10; 
        }
        
        
        boolean outofrange= !(myvoto >= 0 && myvoto<= 10);
        
        /*
        if (myvoto < 0 || myvoto > 10){
            System.out.println("DATI FUORI DAL RANGE");
            return;
        }
        */                                                                                                                
        //if (!(myvoto >= 0 && myvoto<= 10)){
        if (outofrange)  {  
            System.out.println("DATI FUORI DAL RANGE");
            return;
        }
            
        
        //per essere ammesso almeno 5
        
        // se almeno 5 
        if (myvoto>=5){
            System.out.println("AMMESSO!!!");
           //fascia pericolante 5-6
        if (myvoto >=5 && myvoto<=6)//no graffe un solo comando 
               System.out.println("PERICOLANTE!!!");
        else {
            if(myvoto >=7 && myvoto <=8 )
                System.out.print("DISCRETO!!!");
            else{
                System.out.println("OTTIMO!!!");
                if(lode) System.out.println("CON LODE");
                    }
           }
       }
        //stampo ammesso
        //altrimenti 
        else {vototx.equalsIgnoreCase("10 e lode");
        
            System.out.println("NON AMMESSO!!!");
        }
        //stampo NON ammesso 
        
       
        
    }
    
}
 
