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
class ContoCorrente {
    private String intestatario;
    private int saldo;

    public ContoCorrente(String intestatario) {
        if(intestatario==null || intestatario.isBlank()){
            throw new IllegalArgumentException("intestatario vuoto");
        }
        this.intestatario = intestatario;
    }

    public String getIntestatario() {
        return intestatario;
    }

    public int getSaldo() {
        return saldo;
    }
    
    public void deposito (int somma){
        if(somma <=0){
            throw new IllegalArgumentException("somma uguale o minore di zero");
        }
        this.saldo += somma;
    }
    
    public void prelievo (int somma){
        if(somma <=0){
            throw new IllegalArgumentException("somma uguale o minore di zero");
        }
        
       if(somma > saldo){
       throw new IllegalArgumentException("somma non disponibile");   
       }
        this.saldo -= somma;
    }
    
   
}
