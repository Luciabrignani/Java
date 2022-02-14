package it.tss.esercizi;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author tss
 */
public class Main {
    public static void main(String[] args) {
        
        
        if(args.length!=1){
            System.out.println("devi passare un numero come parametro!!");
            System.exit(0);
        }else{
            System.out.println("siamo qui");
        }
        
        int x= Integer.parseInt(args[0]);
        int n= 1; 
    
        
        int sommaDivisori=0;
        
        while(n < x ){
            if(x % n ==0) {
                //sommaDivisori = sommaDivisori + n; 
                sommaDivisori += n; 
                
                
                //n = n+1;
                //n += 1;
                n++;
            }
        }
            
        if(sommaDivisori == x){
            System.out.println(x+ "perfetto");
            
        }   else if (sommaDivisori > x){
            System.out.println(x+ "abbondante");
            
        }   else {
            System.out.println(x+ "difettivo");
        }
    }
}