/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.tss.blogapp;

import it.tss.blogapp.control.UserStore;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author tss
 */

@Named("indexCts")
public class IndexController {
    @Inject
    UserStore store;
    
}
