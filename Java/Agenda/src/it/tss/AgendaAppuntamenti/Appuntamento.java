/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.tss.AgendaAppuntamenti;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Objects;

/**
 *
 * @author tss
 */
public class Appuntamento {

    private LocalDate data;
    private LocalTime oranizio;
    private LocalTime orafine;
    private String luogo;
    private String nome;

    public Appuntamento(LocalDate data, LocalTime oranizio, LocalTime orafine, String luogo, String nome) {
        this.data = data;
        this.oranizio = oranizio;
        this.orafine = orafine;
        this.luogo = luogo;
        this.nome = nome;
    }

    public LocalDate getData() {
        return data;
    }

    public LocalTime getOranizio() {
        return oranizio;
    }

    public LocalTime getOrafine() {
        return orafine;
    }

    public String getLuogo() {
        return luogo;
    }

    public String getNome() {
        return nome;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 11 * hash + Objects.hashCode(this.data);
        hash = 11 * hash + Objects.hashCode(this.oranizio);
        hash = 11 * hash + Objects.hashCode(this.luogo);
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
        final Appuntamento other = (Appuntamento) obj;
        if (!Objects.equals(this.luogo, other.luogo)) {
            return false;
        }
        if (!Objects.equals(this.data, other.data)) {
            return false;
        }
        if (!Objects.equals(this.oranizio, other.oranizio)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Appuntamento{" + "data=" + data + ", oranizio=" + oranizio + ", orafine=" + orafine + ", luogo=" + luogo + ", nome=" + nome + '}';
    }

    
    

}
