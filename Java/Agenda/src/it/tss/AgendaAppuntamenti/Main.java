/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.tss.AgendaAppuntamenti;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author tss
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Agenda agenda = new Agenda();
        Appuntamento p = agenda.aggiungi(LocalDate.now(), LocalTime.of(14, 30), LocalTime.of(15, 30), "Ivrea", "Persona p");
        //System.out.print(p);
        
        Appuntamento p1 = agenda.aggiungi(LocalDate.now(), LocalTime.of(16, 00), LocalTime.of(18, 30), "Rivarolo", "Persona c");
        agenda.stampa();
        
        Appuntamento p2 = agenda.aggiungi(LocalDate.now(), LocalTime.of(13, 00), LocalTime.of(14, 30), "Quassolo", "Persona b");
        agenda.cancella(LocalDate.now());
        agenda.stampa();
        agenda.cerca(LocalDate.now(), "Ivrea", null).forEach(System.out::println);
    }

}
