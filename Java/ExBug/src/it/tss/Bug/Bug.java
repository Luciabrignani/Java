package it.tss.Bug;

import java.util.ArrayList;
import java.util.List;
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
public class Bug {

    private String nome;
    private String descrizione;
    static ArrayList<Bug> listbug = new ArrayList<>();
    

    public Bug(String descrizione) {
        this.descrizione = descrizione;
        this.nome = "";
        listbug.add(this);
    }

    public String getNome() {
        return nome;
    }

    public String getDescrizione() {
        return descrizione;
    }

    private void setNome(String nome) {
        this.nome = nome;
    }
    public void assignTo(String nome){
        setNome(nome);
    }
    public static List<Bug> getUnassigned(){
        
        return listbug.stream()
                .filter(v -> v.getNome().equalsIgnoreCase(""))
                .collect(Collectors.toList());
                
        
    }
    
    public static List<Bug> getAssignedTo(){
        
        return listbug.stream()
                .filter(v -> !v.getNome().equalsIgnoreCase(""))
                .collect(Collectors.toList());
                
        
    }
            
            

}
