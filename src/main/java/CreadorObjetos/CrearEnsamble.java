/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CreadorObjetos;

import Objetos.*;
import javax.swing.JOptionPane;

/**
 *
 * @author Mariano
 */
public class CrearEnsamble {
    public static Ensamble crearEnsamble(String[] espacio){
        Ensamble ensamble=null;
        int espacio2=0;
        //creamos ensamble con datos
        try{
            espacio2=Integer.parseInt(espacio[2]);
            ensamble = new Ensamble(espacio[0],espacio[1],espacio2);
        }catch(NumberFormatException e){
            JOptionPane.showMessageDialog(null, "error no es numero "+e);
        }
        
        return ensamble;
    }
}
