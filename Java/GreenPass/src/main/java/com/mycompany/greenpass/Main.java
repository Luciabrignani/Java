/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.greenpass;

/**
 *
 * @author tss
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
      //data oggi
      int oggi = 749;
      //dati ministero 
      int durata_v1 = 30;
      int durata_v2 = 120;
      int durata_v3 = 120;
      int durata_tampone = 2;
      int durata_covid = 180;
      
      int v1 = 0;
      int v2 = 0;
      int v3 = 0;
      int covid = 0;
      int tampone = 0;
      
      v1 = 400;
      int dv1 = oggi - v1;
      boolean okv1 = dv1 <= durata_v1;
      
      v2 = 350;
      int dv2 = oggi - v2;
      boolean okv2 = dv2 <= durata_v2;
      
      v3 = 700;
      int dv3 = oggi - v3;
      boolean okv3 = dv3 <= durata_v3;
    
      
      covid = 600;
      int dcovid = oggi - covid;
      boolean okcovid = dcovid <= durata_covid;
      
      
      tampone = 700;
      int dtampone = oggi - tampone;
      boolean oktampone = dtampone <= durata_tampone;
      
      boolean greenpass = okcovid || oktampone || okv1 || okv2 || okv3;
      
      if(greenpass) {
          System.out.println("GREEN PASS OK VALIDO");
      }
      else {
          System.out.println("GREEN PASS NON VALIDO");
      }
      
          
      }
}
