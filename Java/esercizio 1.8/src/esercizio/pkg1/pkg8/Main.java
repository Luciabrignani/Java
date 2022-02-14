/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package esercizio.pkg1.pkg8;

import java.util.Scanner;

/**
 *
 * @author tss
 */
public class Main {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("inserisci il numero da utilizzare");
        int x = sc.nextInt();
        
        int n = 1;
        
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
