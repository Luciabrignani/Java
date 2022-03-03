/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ex_component;


import java.util.Objects;
import java.util.Set;
import java.util.TreeSet;


/**
 *
 * @author tss
 */
public class Component implements Comparable<Component> {

    Set<Component> incompatibili = new TreeSet<>();

    Type tipologia;
    String descrizione;

    public Component(Type tipologia, String descrizione) {
        this.tipologia = tipologia;
        this.descrizione = descrizione;
    }

    public Type getTipologia() {
        return tipologia;
    }

    public String getDescrizione() {
        return descrizione;
    }
  
    
    public boolean setIncompatible(Component a){
        return incompatibili.add(a);
        
    }
    
    
    @Override
    public int hashCode() {
        int hash = 5;
        hash = 97 * hash + Objects.hashCode(this.tipologia);
        hash = 97 * hash + Objects.hashCode(this.descrizione);
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
        final Component other = (Component) obj;
        if (!Objects.equals(this.descrizione, other.descrizione)) {
            return false;
        }
        if (this.tipologia != other.tipologia) {
            return false;
        }
        return true;
    }

    @Override
    public int compareTo(Component b) {
        if (incompatibili.contains(b))
            return 0;
        else
            return 1;
    }

    
}
