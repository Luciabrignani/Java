/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negozio;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author tss
 */
public class Catalogo<E extends Articolo> implements Iterable<E>{

    List<E> listaarticoli = new ArrayList<>();

    public void aggiungiArticolo(E art) {
        listaarticoli.add((E) art);

    }

    public List<E> GetArticoliSottoPrezzo(double prezzo) {
        return (List<E>) listaarticoli.stream()
                .filter(v -> v.getPrezzo()<= prezzo)
                .collect(Collectors.toList());

    }

    @Override
    public String toString() {
        return listaarticoli.stream()
                .map(E:: toString)
                .collect(Collectors.joining("\n"));
    }

    @Override
    public Iterator<E> iterator() {
        return listaarticoli.iterator();
    }


}
