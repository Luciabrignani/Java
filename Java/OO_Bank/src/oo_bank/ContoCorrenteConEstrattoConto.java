package oo_bank;

import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author tss
 */
public class ContoCorrenteConEstrattoConto extends ContoCorrente{
    
private ArrayList<Integer> movimenti = new ArrayList<>();

public ContoCorrenteConEstrattoConto(String intestatario) {
        super(intestatario);
    }
    
public ArrayList<Integer> getMovimenti() {
       return new ArrayList (this.movimenti);
   }
   
   @Override
public void deposito (int somma){
       super.deposito(somma);
       movimenti.add(somma);
   }
   
public void prelievo(int somma){
    super.prelievo(somma);
    movimenti.add(-somma);
}
}
