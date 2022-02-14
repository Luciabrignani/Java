/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.tss.esercizi;

/**
 *
 * @author tss
 */
public class Main {
    public static void main(String[] args) {
        
        if(args.length==0){
            System.out.println("devi passare un  un numero come parametro!!");
            System.exit(0);
        }
        
        int x = Integer.parseInt(args[0]);
        String risultato = analizza(x);
        System.out.print(x+" è "+ risultato);
    }
        
        
        
        
        
        
        public static String analizza(int x){
            String risultato;
            int n = 1;
        
        int sommaDivisori=0;
        
        while(n < x ){
            if(x%n ==0) {
                //sommaDivisori = sommaDivisori + n; 
                sommaDivisori += n; 
                
                
                //n = n+1;
                //n += 1;
                
            }
             n++;
        }
            
        if(sommaDivisori == x){
           risultato= "perfetto";
            
        }   else if (sommaDivisori > x){
            risultato= "abbondante";
            
        }   else {
            risultato= "difettivo";
        }
        
        return risultato;
            
        }
        
        
        
        
        
        
        
        
    }
    
