/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.gestionescuola;

/**
 *
 * @author tss
 */
public class Anagrafica {
   private int id_anagrafica;
   private String nome;
   private String cognome;
   private String mail;

    public Anagrafica(int id_anagrafica, String nome, String cognome, String mail) {
        this.id_anagrafica = id_anagrafica;
        this.nome = nome;
        this.cognome = cognome;
        this.mail = mail;
    }

    public Anagrafica(String nome, String cognome) {
        this.nome = nome;
        this.cognome = cognome;
        this.id_anagrafica = id_anagrafica;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public int getId_anagrafica() {
        return id_anagrafica;
    }
    
    String getCSV() {    // 
        String ris = "";
        //ris += "nomecorso;durataore;descrizione;datainizio;link\n";
        ris =  String.valueOf(id_anagrafica) + ";" + cognome + ";" + nome 
                + ";" + mail + "\n" ;
          return ris;
    }

    
}
