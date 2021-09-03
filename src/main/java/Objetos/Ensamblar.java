/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

import java.time.LocalDate;

/**
 *
 * @author Mariano
 */
public class Ensamblar {
    String nombreMueble;
    String nombreUsuario;
    LocalDate fechaEnsamble;

    public Ensamblar(String nombreMueble, String nombreUsuario, LocalDate fechaEnsamble) {
        this.nombreMueble = nombreMueble;
        this.nombreUsuario = nombreUsuario;
        this.fechaEnsamble = fechaEnsamble;
    }

    public String getNombreMueble() {
        return nombreMueble;
    }

    public void setNombreMueble(String nombreMueble) {
        this.nombreMueble = nombreMueble;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public LocalDate getFechaEnsamble() {
        return fechaEnsamble;
    }

    public void setFechaEnsamble(LocalDate fehcaEnsamble) {
        this.fechaEnsamble = fehcaEnsamble;
    }
    
    
    
}
