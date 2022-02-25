package it.tss.Clinica;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author tss
 */
public class Clinica {

    ArrayList<Prenotazione> elencoprenotazioni = new ArrayList<>();

    public void prenota(String nomePaziente, Specialista specialista) {
        Prenotazione p = new Prenotazione(nomePaziente, specialista);
        for (Prenotazione prenotazione : elencoprenotazioni) {
            if (p.equals(prenotazione)) {
                JOptionPane.showMessageDialog(null, "PAZIENTE GIÀ INSERITO!!");
                return;
            }
        }

        elencoprenotazioni.add(p);

    }

    public void prenota2(String nomePaziente, Specialista specialista) {
        Prenotazione p = new Prenotazione(nomePaziente, specialista);

        if (elencoprenotazioni.stream()
                .filter(v -> v.equals(p))
                .count() > 0) {
            JOptionPane.showMessageDialog(null, "Già presente");
        } else {
            elencoprenotazioni.add(p);
        }

    }

    public void cancellaPrenotazione(String nomePaziente, Specialista specialista) {
        Prenotazione p = new Prenotazione(nomePaziente, specialista);
        for (Prenotazione prenotazione : elencoprenotazioni) {
            if (p.equals(prenotazione)) {
                JOptionPane.showMessageDialog(null, "PRENOTAZIONE CANCELLATA CORRETTAMENTE");
                elencoprenotazioni.remove(p);
                return;
            }
        }

        JOptionPane.showMessageDialog(null, "PAZIENTE NON TROVATO!");

    }

    public void cancellaPrenotazione2(String nomePaziente, Specialista specialista) {
        Prenotazione p = new Prenotazione(nomePaziente, specialista);
        if (elencoprenotazioni.stream()
                .filter(v -> v.equals(p))
                .count() > 0) {
            elencoprenotazioni.remove(p);
        } else {
            JOptionPane.showMessageDialog(null, "Non c'è nulla da rimuovere!");
        }

    }

    public Collection<Prenotazione> getPrenotati(Specialista specialista) {
        return elencoprenotazioni.stream()
                .filter(v -> v.getSpecialista() == specialista)
                .collect(Collectors.toList());
    }

    
    public void stampa() {
        System.out.println("----------------Agenda-------------");
        //elencoappuntamenti.forEach(v -> System.out.println(v));
        elencoprenotazioni.forEach(System.out::println);
    }
    
    
}
