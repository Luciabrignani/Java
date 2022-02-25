/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.tss.Clinica;

import java.util.Objects;

/**
 *
 * @author tss
 */
public class Prenotazione {

    private final String nomePaziente;
    private final Specialista specialista;

    public Prenotazione(String nomePaziente, Specialista specialista) {
        this.nomePaziente = nomePaziente;
        this.specialista = specialista;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 59 * hash + Objects.hashCode(this.nomePaziente);
        hash = 59 * hash + Objects.hashCode(this.specialista);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Prenotazione other = (Prenotazione) obj;
        if (!Objects.equals(this.nomePaziente, other.nomePaziente)) {
            return false;
        }
        if (this.specialista != other.specialista) {
            return false;
        }
        return true;
    }

    public String getNomePaziente() {
        return nomePaziente;
    }

    public Specialista getSpecialista() {
        return specialista;
    }

    @Override
    public String toString() {
        return "Prenotazione{" + "nomePaziente=" + nomePaziente + ", specialista=" + specialista + '}';
    }

    
    
}
