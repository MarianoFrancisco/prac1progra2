/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CreadorObjetos;

import Objetos.*;
import java.time.LocalDate;

/**
 *
 * @author Mariano
 */
public class CrearEnsamblar {
    public static Ensamblar crearEnsamblar(String[] espacio){
        Ensamblar ensamblar=null;
        //creamos ensamblar con datos   
        String fecha=espacio[2].replaceAll("\"", "");
        ensamblar = new Ensamblar(espacio[0],espacio[1],convertirFecha(fecha));
        return ensamblar;
    }
    public static LocalDate convertirFecha(String separadorFecha){
        //determinamos un local date con un valor tipo estring que castearemos para tener formato de importacion
        String[] valorFecha=separadorFecha.split("/");//establecemos que separe con / y pueda tener un string valor fecha
        //Integer nos servira para convertir en tipo string los enteros ingresados
        int valorDia = Integer.valueOf(valorFecha[0]);//posicion cero es el dia, primera posicion
        int valorMes = Integer.valueOf(valorFecha[1]);//posicion uno es el mes, segunda posicion
        int valorAnio = Integer.valueOf(valorFecha[2]);//posicion dos es el anio, tercera posicion
        return LocalDate.of(valorAnio, valorMes, valorDia);//convertimos los valores de string a local date
    }
}
