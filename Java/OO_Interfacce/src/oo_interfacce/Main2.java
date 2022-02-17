/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oo_interfacce;

import java.awt.List;
import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author tss
 */
public class Main2 {
    public static void main(String[] args) {
        List<Anafgrafica> elenco = new ArrayList<>();
        elenco.add(new Anagrafica("mario","rossi"));
        elenco.add(new Anagrafica("marco", "bianchi"));
        
        System.out.println(elenco);
        
        Collections.sort(elenco);
        
        System.out.println(elenco);
        
        
    }
}