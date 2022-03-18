/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.tss.jee.start.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.bind.annotation.JsonbDateFormat;
import javax.json.bind.annotation.JsonbProperty;
import javax.json.bind.annotation.JsonbPropertyOrder;
import javax.json.bind.annotation.JsonbTransient;

/**
 *
 * @author tss
 */
@JsonbPropertyOrder({"id", "nome", "cognome", "eta", "dataCreazione"})
public class Person implements Serializable {
    @JsonbTransient
    private int id;
    @JsonbProperty(value = "first_name")
    private String nome;
    @JsonbProperty(value = "last_name")
    private String cognome;
    @JsonbProperty(value = "age")
    private int eta;
    @JsonbProperty(value = "creation_date")
    @JsonbDateFormat(value = "dd/MM/yyyy", locale = "it")
    private LocalDate dataCreazione;

    public Person() {

    }

    public Person(int id, String nome, String cognome, int eta ) {
        this.id = id;
        this.nome = nome;
        this.cognome = cognome;
        this.eta = eta;
        this.dataCreazione = LocalDate.now();
    }
    
    public JsonObject toJsonMin(){
      return Json.createObjectBuilder()
              .add("last_name", this.cognome)
              .add("eta", this.eta)
              .build();
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getCognome() {
        return cognome;
    }

    public int getEta() {
        return eta;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public void setEta(int eta) {
        this.eta = eta;
    }

    public LocalDate getDataCreazione() {
        return dataCreazione;
    }

    public void setDataCreazione(LocalDate dataCreazione) {
        this.dataCreazione = dataCreazione;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 37 * hash + this.id;
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
        final Person other = (Person) obj;
        return this.id == other.id;
    }

    @Override
    public String toString() {
        return "Person{" + "id=" + id + ", nome=" + nome + ", cognome=" + cognome + ", eta=" + eta + ", dataCreazione=" + dataCreazione + '}';
    }

}
