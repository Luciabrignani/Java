/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jee.start.resources;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import javax.ws.rs.BadRequestException;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author tss
 */
@Path("ping")
public class Ping {
    
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String ping(@QueryParam("language") String ln){
        if(ln == null){
        //throw new BadRequestException("parametro language mancante");  
         throw new BadRequestException(Response
                 .status(Response.Status.BAD_REQUEST)
                 .header("motivo", "parametro language mancant")
                 .build());
        }
        
        DateTimeFormatter df= DateTimeFormatter.ISO_LOCAL_DATE_TIME;
        switch(ln){
            case "it" :
                df= DateTimeFormatter.ofPattern("dd/MM/yyyy hh:mm:ss", Locale.ITALY);
                return "ping ok!!" + LocalDateTime.now().format(df);
            case "en" :
                df= DateTimeFormatter.ofPattern("yyyy-MM-dd hh.mm.ss", Locale.ENGLISH);
                return "ping ok!!" + LocalDateTime.now().format(df);
            default: 
                return "ping ok!! " + LocalDateTime.now().format(df);
        }
        
                
        
    }
    @GET
    @Path("{id}")
    @Produces(MediaType.TEXT_PLAIN)
    public String ping1(@PathParam("id") String id){
        return "ping1 ok!!" + "parametro:" + id + "" + LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
    }
    
}
