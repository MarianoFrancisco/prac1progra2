/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

/**
 *
 * @author Mariano
 */
public class Ensamble {
    private String nombreMueble;
    private String tipoPieza;
    private int cantidad;

    public Ensamble(String nombreMueble, String tipoPieza, int cantidad) {
        this.nombreMueble = nombreMueble;
        this.tipoPieza = tipoPieza;
        this.cantidad = cantidad;
    }

    public String getNombreMueble() {
        return nombreMueble;
    }

    public void setNombreMueble(String nombreMueble) {
        this.nombreMueble = nombreMueble;
    }

    public String getTipoPieza() {
        return tipoPieza;
    }

    public void setTipoPieza(String tipoPieza) {
        this.tipoPieza = tipoPieza;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}
