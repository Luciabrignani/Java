/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package it.tss.blogapp.entity;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeAll;

/**
 *
 * @author tss
 */
public class NewEmptyJUnitTest {
   
    public NewEmptyJUnitTest() {
    }
   
    @BeforeAll
    static public void setUp1() {
        System.out.println("Test Inizializzato");
    }
   
   
    @BeforeEach
    public void setUp() {
        System.out.println("Test Inizializzato");
    }
   
    @Test
    public void test1(){
        System.out.println("Test1");
    }
   
    @Test
    public void test2(){
        System.out.println("Test2");
    }
}