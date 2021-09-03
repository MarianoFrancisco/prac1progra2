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
public class CrearMueble {
    public static Mueble crearMueble(String[] espacio){
        Mueble mueble=null;
        double espacio1 = 0;
        //creamos mueble con datos
        try{
            espacio1=Double.parseDouble(espacio[1]);
            mueble = new Mueble(espacio[0],espacio1);
        }catch(NumberFormatException e){
            JOptionPane.showMessageDialog(null, "error no es numero "+e);
        }
        
        
        return mueble;
    }
}
