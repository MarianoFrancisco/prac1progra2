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
public class CrearUsuario {
    public static Usuario crearUsuario(String[] espacio){
        Usuario usuario=null;
        //creamos suario con datos      
        usuario = new Usuario(espacio[0],espacio[1],Integer.parseInt(espacio[2]));
        return usuario;
    }
}
