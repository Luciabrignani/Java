/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negozio;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author tss
 */
public class ProvaMobile {

    List<Mobile> mobili = new ArrayList<>();

    public List<Mobile> scegliMobile(List<Mobile> catalogo, double prezzo, int larghezza, int altezza, int profondita) {
        return mobili.stream()
                .filter(v -> v.getPrezzo() < prezzo)
                .filter(v -> v.getLarghezza() < larghezza)
                .filter(v -> v.getAltezza() < altezza)
                .filter(v -> v.getProfondita() < profondita)
                .collect(Collectors.toList());

    }

    public void aggiungiMobile(Mobile mobile) {
        mobili.add(mobile);

    }

}
