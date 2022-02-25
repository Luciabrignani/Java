package it.tss.AgendaAppuntamenti;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author tss
 */
public class Agenda {

    final ArrayList<Appuntamento> elencoappuntamenti = new ArrayList<>();

    public Appuntamento aggiungi(LocalDate data, LocalTime orainizio, LocalTime orafine, String luogo, String nome) {
        Appuntamento result = new Appuntamento(data, orainizio, orafine, luogo, nome);
        elencoappuntamenti.add(result);
        return result;
    }

    public void cancella(Appuntamento a) {
        elencoappuntamenti.remove(a);
    }

    public void cancella(LocalDate data) {
        elencoappuntamenti.removeIf(v -> v.getData().equals(data));
    }

    public List<Appuntamento> cerca(LocalDate data, String luogo, String nome) {
        Predicate<Appuntamento> bydate= v-> data==null || v.getData().equals(data);
        Predicate<Appuntamento> byluogo= v-> luogo==null || luogo.isBlank()|| v.getLuogo().equals(luogo);
        Predicate<Appuntamento> bynome= v-> nome==null || nome.isBlank() || v.getNome().equals(nome);
        return elencoappuntamenti.stream()
                .filter(bydate.and(byluogo).and(bynome))
                .collect(Collectors.toList());

    }

    public void stampa() {
        System.out.println("----------------Agenda-------------");
        //elencoappuntamenti.forEach(v -> System.out.println(v));
        elencoappuntamenti.forEach(System.out::println);
        elencoappuntamenti.forEach(this::stampaAppuntamento);
    }

    private void stampaAppuntamento(Appuntamento a) {
        String frase = String.format("%s alle %s fino alle %s ad %s con %s", a.getData().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")), a.getOranizio(), a.getOrafine(), a.getLuogo(), a.getNome());
        System.out.println(frase);
    }

}
