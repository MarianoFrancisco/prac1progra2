/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CreadorObjetos;

import Objetos.*;

/**
 *
 * @author Mariano
 */
public class CrearCliente {
    public static Cliente crearCliente(String[] espacio){
        Cliente cliente=null;
        //creamos mueble con datos  
        if(espacio.length>3){
           cliente = new Cliente(espacio[0],espacio[1],espacio[2],espacio[3],espacio[4]); 
        }else{
            cliente = new Cliente(espacio[0],espacio[1],espacio[2],null,null); 
        }    
        return cliente;
    }
}
