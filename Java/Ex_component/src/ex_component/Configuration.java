/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ex_component;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;

/**
 *
 * @author tss
 */
public class Configuration {

    List<Component> componenti = new ArrayList<>();

    public boolean add(Component a) {
        for (Component b : componenti) {
            if (b.getDescrizione().equalsIgnoreCase(a.getDescrizione()) || b.getTipologia().equals(a.getTipologia())) {
                return false;
            }

            for (Component c : b.incompatibili) {
                if (c.equals(a)) {
                    return false;
                }

            }

        }
        componenti.add(a);
        return true;

    }

    public boolean add1(Component a) {

        return componenti.stream().noneMatch(v -> v.incompatibili.contains(a))
                && componenti.add(a);
    }

   
}
