
import java.util.Random;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author tss
 */
public class MainRicerca {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int[] input = generaArrayCasuale(10,10);
        ArraysTools.stampa(input);
        System.out.println("ricerca 5: " + ArraysTools.ricerca(input, 5));
        System.out.println("MAX: " + ArraysTools.max(input));
        System.out.println("MIN: " + ArraysTools.min(input));
        System.out.println("SOMMA: " + ArraysTools.somma(input));
        System.out.println("MEDIA: " + ArraysTools.media(input));
        ArraysTools.ordinaBubble(input);
        System.out.println("------------------------------------------------------------");
        ArraysTools.stampa(input);
        int[] copied;
        copied=ArraysTools.copia(input);
        System.out.println("------------------------------------------------------------");
        ArraysTools.stampa(copied);
        
        //   ArraysTools.contieneSequenza(a, b);
        int[] a = new int[]{1,2,3,4,5,6,7,8,9};
        int[] b = new int[]{1,2,3,4,5,6,7,8,9};
        
       // intersezione
       ArraysTools.intersezione(a, b);
       System.out.println("INTERSEZIONE: " + ArraysTools.intersezione(a, b));
       
       // contiene valori
       ArraysTools.contieneValori(a, b);
       System.out.println("CONTIENE VALORI: " + ArraysTools.contieneValori(a,b));
       
       
       
       
    }

    /**
     * 
     * @param ncelle numero di celle dell'array
     * @param max massimo intero contenuto nell'array
     * @return 
     */
    private static int[] generaArrayCasuale(int ncelle, int max) {
        int[] ris = new int[ncelle];
        for (int i = 0; i < ris.length; i++) {
            ris[i] = generaNumeroCasuale(max);
        }
        return ris;
    }

    private static int generaNumeroCasuale(int max) {
        Random random = new Random();
        return random.nextInt(max);
    }


}