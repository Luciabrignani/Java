/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bkm.boundary;

import javax.validation.constraints.NotBlank;

/**
 *
 * @author tss
 */
public class Credential {
    @NotBlank
    public String usr;
    @NotBlank
    public String pwd;
}
