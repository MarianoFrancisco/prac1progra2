/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CreadorObjetos;

import java.time.LocalDate;

/**
 *
 * @author Mariano
 */
public class Almacenador {
    private String nombreUsuario;
    private String password;
    private int tipoUsuario;
    private String tipoPieza;
    private Double costoPieza;
    private int cantidadPieza;
    private String nombreMueble;
    private Double precioMueble;
    private int cantidadParaEnsamblar;
    LocalDate fechaEnsamble;
    private String nit;
    private String nombreCliente;
    private String direccion;
    private String municipio;
    private String departamento;
    public static Almacenador almacenador;
    
    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(int tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public String getTipoPieza() {
        return tipoPieza;
    }

    public void setTipoPieza(String tipoPieza) {
        this.tipoPieza = tipoPieza;
    }

    public Double getCostoPieza() {
        return costoPieza;
    }

    public void setCostoPieza(Double costoPieza) {
        this.costoPieza = costoPieza;
    }

    public int getCantidadPieza() {
        return cantidadPieza;
    }

    public void setCantidadPieza(int cantidadPieza) {
        this.cantidadPieza = cantidadPieza;
    }

    public String getNombreMueble() {
        return nombreMueble;
    }

    public void setNombreMueble(String nombreMueble) {
        this.nombreMueble = nombreMueble;
    }

    public Double getPrecioMueble() {
        return precioMueble;
    }

    public void setPrecioMueble(Double precioMueble) {
        this.precioMueble = precioMueble;
    }

    public int getCantidadParaEnsamblar() {
        return cantidadParaEnsamblar;
    }

    public void setCantidadParaEnsamblar(int cantidadParaEnsamblar) {
        this.cantidadParaEnsamblar = cantidadParaEnsamblar;
    }

    public LocalDate getFechaEnsamble() {
        return fechaEnsamble;
    }

    public void setFechaEnsamble(LocalDate fechaEnsamble) {
        this.fechaEnsamble = fechaEnsamble;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }
}
