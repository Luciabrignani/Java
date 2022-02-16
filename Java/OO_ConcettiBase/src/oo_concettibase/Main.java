package oo_concettibase;

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

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       A a= new A();
       a.m1();
       B b= new B();
       b.m3();
       
       A aa= new B(); // SÌ
       
       if(a instanceof B){
           System.out.println("contiene un oggetto di tipo B");
       } else{
              System.out.println(" non contiene un oggetto di tipo B");
       }
        
       
       ((B)a).m3();
       // B bb= new A(); //NO
    
       aa.m2();
       aa = new C();
       aa.m2();
       
       
 }   
}
