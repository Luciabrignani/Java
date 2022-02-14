/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.tss.oo_dado_strut;

import java.util.Random;

/**
 *
 * @author tss
 */
public class Dado {
    private final int numeroFacce;
    private int ultimoLancio; 
    
public Dado(int nFacce){
     this.numeroFacce=nFacce;
 }
public void lancia(){
    Random rnd= new Random();
    ultimoLancio = rnd.nextInt(numeroFacce -1) + 1;
}

    public int getNumeroFacce() {
        return numeroFacce;
    }

    public int getUltimoLancio() {
        return ultimoLancio;
    }


}
