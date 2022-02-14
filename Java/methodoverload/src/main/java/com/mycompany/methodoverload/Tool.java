/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.methodoverload;

import javax.swing.JOptionPane;

/**
 *
 * @author tss
 */
public class Tool {

    public static float insNumero() {
        float ris = 0;
        String txtnumero = JOptionPane.showInputDialog("Inserisci numero");
        txtnumero = txtnumero.replaceAll(",", ",");
        try {
            ris = Float.parseFloat(txtnumero);
        } catch (Exception errore) {
            JOptionPane.showMessageDialog(null, "ERRORE assegnato 0/n" + errore.getMessage());

        }
        return ris;
    }

    public static float insNumero(String messaggio) {
        float ris = 0;
        String txtnumero = JOptionPane.showInputDialog(messaggio);
        try {
            ris = Float.parseFloat(txtnumero);
        } catch (Exception errore) {
            JOptionPane.showMessageDialog(null, "ERRORE assegnato 0/n" + errore.getMessage());

        }
        return ris;
    }

    public static float insNumero(String messaggio, int numero_decimali) {
        float ris = 0;
        boolean ok = false;
        //finchè non è ok chiedo il numero
        while (!ok) {

            String txtnumero = JOptionPane.showInputDialog(messaggio);
            txtnumero = txtnumero.replaceAll("", "");
            try {
                ris = Float.parseFloat(txtnumero);
                ok = true;

            } catch (Exception errore) {
                JOptionPane.showMessageDialog(null, "ERRORE ritenta!!/n" + errore.getMessage());

            }
        }

        //arrotondare a numero_decimali
        //0-->1  1-->10  2-->100  3-->1000
        float potenza = (float) Math.pow(10, numero_decimali);
        ris = Math.round(ris * potenza) / potenza;
        return ris;

    }

    /**
     * metodo per chiedere tramite messaggio un numero che verrà arrontondato
     * alla seconda cifra decimale
     *
     * @param messaggio domanda da porre all'utente
     * @return numero float arrotondato alla seconda cifra decimale
     */
    public static float insValuta(String messaggio) {
        return insNumero(messaggio, 2);

    }

    public static String giornoSettimana(int day) {

        String giorno = "";
        switch (day) {
            case 1:
                giorno = "Lunedì";
                break;
            case 2:
                giorno = "Martedì";

                break;
            case 3:
                giorno = "Mercoledì";

                break;
            case 4:
                giorno = "Giovedì";

                break;
            case 5:
                giorno = "Venerdì";

                break;
            case 6:
                giorno = "Sabato";

                break;
            case 7:
                giorno = "Domenica";

                break;

        }

        return giorno;

    }

    public static float distanza3D(float x, float y, float z) {
        float ris = 0;
        double calcolo = x * x + y * y + z * z;
        calcolo = Math.sqrt(calcolo);
        ris = (float) calcolo;

        return ris;

    }

    /**
     * carica dati random in array
     *
     * @param ar
     * @param range valore massimo del dato 1 .. range
     * @return array caricato di numeri rando 1..10
     */

    public static int[] loadDataInt(int[] ar, int range) {
        for (int i = 0; i < ar.length; i++) {
            double caso = Math.random();
            caso = caso * range;
            int valore = (int) caso;
            ar[i] = (int) (caso);
        }
        return ar;
    }

    public static int[] concatArrays(int[] ar1, int[] ar2) {
        int dim1 = ar1.length;
        int dim2 = ar2.length;
        int dimOk = dim1 + dim2;
        int[] arOk = new int[dimOk];
        //0 con 0 1 con 1 2 con 2 etc.. per ar1 e arOk
        for (int i = 0; i < dim1; i++) {
            arOk[i] = ar1[i];
        }
        //inserimento secondo array da ultima posizine precedente
        //0 in 5 1 in 6 2 in 7
        //0 in 5+0 1n in 5+1 2 in 5+2
        for (int i = 0; i < dim2; i++) {
            arOk[i + dim1] = ar2[i];
        }

        return arOk;

    }

    public static int cercaVirus(int[] ar1, int[] virus) {
        int pos = -1;
        //controllo virus su prima posizione
        //eseguo n controlli quanto è lungo il virus
        int vlen = virus.length;
        // 4 5 3 5 7
        // 3 5 7

        int numControlli = ar1.length - vlen;
        for (int k = 0; k < numControlli; k++) {
            
            
        //ciclo controllo sequenza
        boolean ok = true;
        for (int i = 0; i < vlen; i++) {
            if (virus[i] != ar1[i+k]) {
                ok = false;
                break;
                 }
        

        }
        //fine controllo virus in posizione
        
        if(ok){ //trova virus
               pos=k;
               break;
               }
        //passo al prossimo controllo e mi sposto di k
        }
        return pos;
    }
}
