/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negozio;

import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author tss
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        Catalogo catalogo = new Catalogo();

        Prodotto a = new Prodotto("Telefono", 500);
        Prodotto b = new Prodotto("Pc", 800);
        Prodotto c = new Prodotto("Tastiera", 20);

        catalogo.aggiungiArticolo(a);
        catalogo.aggiungiArticolo(b);
        catalogo.aggiungiArticolo(c);

        //System.out.println(catalogo.GetArticoliSottoPrezzo(100).toString());
        
        Catalogo catMobile = new Catalogo();
        
        ProvaMobile mobile = new ProvaMobile();
        
        
        Mobile d = new Mobile("scrivania", 120, 50, 45, 60);
        Mobile e = new Mobile("mobile antico", 1200, 20, 30, 45);
        Mobile f = new Mobile("tavolo", 95, 70, 60, 45);
       
        
        catMobile.aggiungiArticolo(d);
        catMobile.aggiungiArticolo(e);
        catMobile.aggiungiArticolo(f);
        
        
        
        mobile.scegliMobile(catMobile.listaarticoli, 100, 10, 100, 200);
        
        System.out.println(catMobile.listaarticoli.toString());
        

    }

}
