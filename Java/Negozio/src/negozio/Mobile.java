/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negozio;

/**
 *
 * @author tss
 */
public class Mobile implements Articolo {

    private String nome;
    private double prezzo;
    private int larghezza;
    private int altezza;
    private int profondita;

    public Mobile(String nome, double prezzo, int larghezza, int altezza, int profondita) {
        this.nome = nome;
        this.prezzo = prezzo;
        this.larghezza = larghezza;
        this.altezza = altezza;
        this.profondita = profondita;
    }

    public int getLarghezza() {
        return larghezza;
    }

    public int getAltezza() {
        return altezza;
    }

    public int getProfondita() {
        return larghezza * altezza * profondita;
    }

    @Override
    public String getNome() {
        return nome;
    }

    @Override
    public double getPrezzo() {
        return prezzo;
    }

    @Override
    public String toString() {
        return "Mobile{" + "nome=" + nome + ", prezzo=" + prezzo + ", larghezza=" + larghezza + ", altezza=" + altezza + ", profondita=" + profondita + '}';
    }

}
