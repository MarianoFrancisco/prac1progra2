/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.prac1progra2.Restricciones;

import CreadorObjetos.*;
import MySQL.ConexionBD;
import Objetos.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.time.LocalDate;
import javax.swing.JOptionPane;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Mariano
 */
public class CargarArchivos {
    ArrayList<Cliente> clientes = new ArrayList<>();
    ArrayList<Ensamblar> ensamblarS = new ArrayList<>();
    ArrayList<Ensamble> ensambles = new ArrayList<>();
    ArrayList<Mueble> muebles = new ArrayList<>();
    ArrayList<Pieza> piezas = new ArrayList<>();
    ArrayList<Usuario> usuarios = new ArrayList<>();
    Connection cn=null;
    String linea;
    public void leer(InputStream fileContent) throws IOException, ParseException{
        try{
            //open connetcion
            
            try{
                ConexionBD con = new ConexionBD();
                cn = con.conexion();
                
            }catch(Exception e){
                JOptionPane.showMessageDialog(null, "Error conectar a MySQL"+e);
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        PreparedStatement subirBaseDatos;
        Statement st;
        Statement st2;
        BufferedReader leerTextoArchivo = new BufferedReader(new InputStreamReader(fileContent,StandardCharsets.UTF_8));//bufferedReader para leer texto de archivos
        while ((linea = leerTextoArchivo.readLine()) != null) {   
            //con la linea leida, separamos los campos
            String[] espacio = separarEspacio(linea);
            //pasamadLine()) != null) {   
            //con la linea leida, separamos los camposos el texto a objeto
            if (linea.startsWith("USUARIO(")) {
                Usuario usuario=CrearUsuario.crearUsuario(espacio);//creamos un usuario
                if (usuario != null) {
                    usuarios.add(usuario);//agregamos un usuario
                    try {
                    subirBaseDatos = cn.prepareStatement("INSERT INTO usuario(nombre_usuario,contraseña,tipo) VALUES(?,?,?)");//Nos permite acercarnos a mysql
                    subirBaseDatos.setString(1, usuario.getNombre().replaceAll("\"", ""));
                    subirBaseDatos.setString(2, usuario.getPassword().replaceAll("\"", ""));
                    try{
                        subirBaseDatos.setInt(3, usuario.getTipo());
                    }catch(NumberFormatException e){
                        JOptionPane.showMessageDialog(null, "error no es numero "+e);
                    }
                    
                    subirBaseDatos.executeUpdate();//cambios
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex);
                }
                }
                
            } else if (linea.startsWith("PIEZA")) {
                Pieza pieza=CrearPieza.crearPieza(espacio);//creamos una pieza
                if (pieza != null) {
                    piezas.add(pieza);//agregamos una pieza                
                    try {
                        subirBaseDatos = cn.prepareStatement("INSERT INTO pieza(tipo_pieza,costo,cantidad) VALUES(?,?,?)");//Nos permite acercarnos a mysql
                        subirBaseDatos.setString(1, pieza.getTipo().replaceAll("\"", ""));
                        subirBaseDatos.setDouble(2, pieza.getCosto());
                        subirBaseDatos.setInt(3, 1);
                        subirBaseDatos.executeUpdate();//cambios        
                    } catch (SQLException ex) {
                        try {
                            String prueba="SELECT count(*) FROM pieza WHERE tipo_pieza='"+pieza.getTipo().replaceAll("\"", "")+"'";
                            String sumatoria="SELECT cantidad FROM pieza WHERE tipo_pieza='"+pieza.getTipo().replaceAll("\"", "")+"'";
                            ;
                            st = cn.createStatement();
                            st2 = cn.createStatement();
                            ResultSet rs = st.executeQuery(prueba);
                            ResultSet rs1 = st2.executeQuery(sumatoria);
                            while(rs.next()&&rs1.next()){
                                //JOptionPane.showMessageDialog(null, Integer.parseInt(rs2.getString("cantidad")));
                                if(Integer.parseInt(rs.getString(1))==1){
                                    int cantidadSumar=(1+Integer.parseInt(rs1.getString(1)));
                                    subirBaseDatos = cn.prepareStatement("UPDATE pieza SET cantidad="+cantidadSumar+" WHERE tipo_pieza='"+pieza.getTipo().replaceAll("\"", "")+"'");//Nos permite acercarnos a mysql
                                    subirBaseDatos.executeUpdate();//cambios

                                }
                            }
                        } catch (SQLException ex1) {
                            Logger.getLogger(CargarArchivos.class.getName()).log(Level.SEVERE, null, ex1);
                        }
                    }
                    
                } 
            } else if (linea.startsWith("MUEBLE")) {
                Mueble mueble=CrearMueble.crearMueble(espacio);//creamos un mueble
                if (mueble != null) {
                        try{
                            muebles.add(mueble);//agregamos un mueble   
                            subirBaseDatos = cn.prepareStatement("INSERT INTO mueble(nombre_mueble,precio) VALUES(?,?)");//Nos permite acercarnos a mysql
                            subirBaseDatos.setString(1, mueble.getNombre().replaceAll("\"", ""));
                            subirBaseDatos.setDouble(2, mueble.getPrecio());
                            subirBaseDatos.executeUpdate();//cambios
                        }catch(SQLException ex){
                            Logger.getLogger(CargarArchivos.class.getName()).log(Level.SEVERE,null, ex);
                        }         
                }
                
            } else if (linea.startsWith("ENSAMBLE_PIEZAS")) {
                Ensamble ensamble=CrearEnsamble.crearEnsamble(espacio);//creamos un ensamble
                if (ensamble != null) {
                    ensambles.add(ensamble);//agregamos un ensamble
                    try {
                    subirBaseDatos = cn.prepareStatement("INSERT INTO ensamble(nombre_mueble,tipo_pieza,cantidad) VALUES(?,?,?)");//Nos permite acercarnos a mysql
                    subirBaseDatos.setString(1, ensamble.getNombreMueble().replaceAll("\"", ""));
                    subirBaseDatos.setString(2, ensamble.getTipoPieza().replaceAll("\"", ""));
                    try{
                        subirBaseDatos.setInt(3, ensamble.getCantidad());
                    }catch(NumberFormatException e){
                        JOptionPane.showMessageDialog(null, "error no es numero "+e);
                    }
                    subirBaseDatos.executeUpdate();//cambios
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex);
                }
                }
            } else if (linea.startsWith("ENSAMBLAR_MUEBLE")) {
                Ensamblar ensamblar=CrearEnsamblar.crearEnsamblar(espacio);//creamos un ensamblar
                if (ensamblar != null) {
                    LocalDate.parse("12/2000/2");
                    ensamblarS.add(ensamblar);//agregamos un ensamblar       
                try {                   
                    subirBaseDatos = cn.prepareStatement("INSERT INTO ensamblar(nombre_mueble,nombre_usuario,fecha) VALUES(?,?,?)");//Nos permite acercarnos a mysql
                    subirBaseDatos.setString(1, ensamblar.getNombreMueble().replaceAll("\"", ""));
                    subirBaseDatos.setString(2, ensamblar.getNombreUsuario());
                    subirBaseDatos.setDate(3, (java.sql.Date.valueOf(ensamblar.getFechaEnsamble())));
                    
                    subirBaseDatos.executeUpdate();//cambios
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex);
                }
                }
            } else if (linea.startsWith("CLIENTE")) {
                Cliente cliente=CrearCliente.crearCliente(espacio);//creamos cliente
                if (cliente != null) {
                    clientes.add(cliente);//agregamos un mueble
                try {
                    if(espacio.length>3){
                        subirBaseDatos = cn.prepareStatement("INSERT INTO cliente(nit,nombre_cliente,direccion_cliente,municipio,departamento) VALUES(?,?,?,?,?)");//Nos permite acercarnos a mysql
                        subirBaseDatos.setString(1, espacio[1].replaceAll("\"", ""));
                        subirBaseDatos.setString(2, espacio[0].replaceAll("\"", ""));
                        subirBaseDatos.setString(3, espacio[2].replaceAll("\"", ""));
                        subirBaseDatos.setString(4, espacio[3].replaceAll("\"", ""));
                        subirBaseDatos.setString(5, espacio[4].replaceAll("\"", ""));
                        subirBaseDatos.executeUpdate();//cambios
                    }else{
                        subirBaseDatos = cn.prepareStatement("INSERT INTO cliente(nit,nombre_cliente,direccion_cliente) VALUES(?,?,?)");//Nos permite acercarnos a mysql
                        subirBaseDatos.setString(1, espacio[1].replaceAll("\"", ""));
                        subirBaseDatos.setString(2, espacio[0].replaceAll("\"", ""));
                        subirBaseDatos.setString(3, espacio[2].replaceAll("\"", ""));
                        subirBaseDatos.executeUpdate();//cambios
                    } 
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex);
                }
                }
            }             
        }
        leerTextoArchivo.close();
    }
    private String[] separarEspacio(String renglon) {
        if (renglon.startsWith("USUARIO(")) {
            String inicioUsuario = "USUARIO(";
            String renglonDeEspacios = renglon.substring(inicioUsuario.length(), renglon.length() - 1);
            String[] espacios = renglonDeEspacios.split(",");
            return espacios;
        } else if (renglon.startsWith("PIEZA(")) {
            String inicioPieza = "PIEZA(";
            String renglonDeEspacios = renglon.substring(inicioPieza.length(), renglon.length() - 1);
            String[] espacios = renglonDeEspacios.split(",");
            return espacios;
        } else if (renglon.startsWith("MUEBLE(")) {
            String inicioMueble = "MUEBLE(";
            String renglonDeEspacios = renglon.substring(inicioMueble.length(), renglon.length() - 1);
            String[] espacios = renglonDeEspacios.split(",");
            return espacios;
        } else if (renglon.startsWith("ENSAMBLE_PIEZAS(")) {
            String inicioEnsamble = "ENSAMBLE_PIEZAS(";
            String renglonDeEspacios = renglon.substring(inicioEnsamble.length(), renglon.length() - 1);
            String[] espacios = renglonDeEspacios.split(",");
            return espacios;
        } else if (renglon.startsWith("ENSAMBLAR_MUEBLE(")) {
            String inicioEnsamblar = "ENSAMBLAR_MUEBLE(";
            String renglonDeEspacios = renglon.substring(inicioEnsamblar.length(), renglon.length() - 1);
            String[] espacios = renglonDeEspacios.split(",");
            return espacios;
        } else if (renglon.startsWith("CLIENTE(")) {
            String inicioCliente = "CLIENTE(";
            String renglonDeEspacios = renglon.substring(inicioCliente.length(), renglon.length() - 1);
            String[] espacios = renglonDeEspacios.split(",");
            return espacios;
        }
        return null;

    }
}
