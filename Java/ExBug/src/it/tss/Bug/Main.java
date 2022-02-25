package it.tss.Bug;

import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author tss
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Bug bug1 = new Bug("finestra bloccata");
        bug1.assignTo("Lucia");
        Bug bug2 = new Bug ("problema con il mio computer");
        Bug bug3 = new Bug ("impossibile salvare il file");
        bug3.assignTo("Gianluca");
        
        System.out.println(Bug.getAssignedTo().size());
        
        System.out.println(bug1.getNome());
        List<Bug> unassigned = Bug.getUnassigned();
        System.out.println(unassigned.size());
    }

}
