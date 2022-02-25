/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.tss.Clinica;

/**
 *
 * @author tss
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Clinica clinica= new Clinica();
        
        clinica.prenota("André", Specialista.OCULISTA);
        clinica.prenota2("Gianluca", Specialista.DIETOLOGO);
        clinica.prenota2("Lucia", Specialista.GINECOLOGO);
        clinica.prenota("Lucia", Specialista.OCULISTA);
        
        System.out.println(clinica.getPrenotati(Specialista.OCULISTA));
        
        clinica.cancellaPrenotazione("André", Specialista.OCULISTA);
        clinica.cancellaPrenotazione2("André", Specialista.OCULISTA);
        
         System.out.println(clinica.getPrenotati(Specialista.OCULISTA));
         
        
    }
    
}
