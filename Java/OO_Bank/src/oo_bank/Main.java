/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oo_bank;

/**
 *
 * @author tss
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
    ContoCorrenteConEstrattoConto cc = new ContoCorrenteConEstrattoConto("Lucia");
    System.out.println(cc.getSaldo());
    cc.deposito(500);
    cc.prelievo(100);
    System.out.println("intestario: " + cc.getIntestatario() + "saldo: " + cc.getSaldo());
    System.out.println(cc.getMovimenti());
        
        
        
    }
    
}
