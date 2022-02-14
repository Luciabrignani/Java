/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.tss.oo_dado_strut;

/**
 *
 * @author tss
 */
public class Main {

    public static void main(String[] args) {
        Giocatore g = new Giocatore(10,15,5);
        Dado dadoG = new Dado(6);
        Dado dadoB = new Dado(6);
        int conta = 1;
        do {
            dadoG.lancia();
            dadoB.lancia();
            stampaMano(conta,dadoG.getUltimoLancio(),dadoB.getUltimoLancio());
            if (dadoG.getUltimoLancio() > dadoB.getUltimoLancio()) {
                g.incrementaSoldi();
                stampaGiocatore(g.getSoldi());
            } else {
                g.decrementaSoldi();
                stampaGiocatore(g.getSoldi());
            }
            conta++;
        } while (g.isContinua());
    }

    private static void stampaMano(int conta, int lancioG, int lancioB) {
        String msg = String.format("mano numero %s banco=%s giocatore=%s",conta,lancioB,lancioG );
        System.out.println(msg);
    }

    private static void stampaGiocatore(int soldi) {
        System.out.println("soldi giocatore: " + soldi);
    }
}
