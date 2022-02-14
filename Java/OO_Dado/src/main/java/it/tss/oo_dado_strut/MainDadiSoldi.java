/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.tss.oo_dado_strut;

import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author tss
 */
public class MainDadiSoldi {

    static int soldi;
    
    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("inserisci i soldi:");
        soldi = sc.nextInt();
        int contaMani = 1;
        while(soldi>0){
            gioca(contaMani);
            contaMani++;
        }
    }

    private static void gioca(int numMano) {
        int dg = lanciaDado();
        int db = lanciaDado();
        System.out.println(
                String.format("mano numero %s banco=%s giocatore=%s",numMano,db,dg ));
        if(dg>db){
            soldi++;
            System.out.println("mano vinta dal giocatore soldi=" + soldi);
        }else{
            soldi--;
            System.out.println("mano vinta dal banco soldi=" + soldi);
        }
        System.out.println("--------------------------------------------------");
    }

    /**
     * lancio dado
     * @return intero tra 1 e 6
     */
    private static int lanciaDado() {
        Random rnd = new Random();
        return rnd.nextInt(5) + 1;
    }
}
 