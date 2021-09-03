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
public class CrearPieza {

    public static Pieza crearPieza(String[] espacio){
        Pieza pieza=null;
        //creamos pieza con datos  
        double espacio1=0; 
        try{
            espacio1=Double.parseDouble(espacio[1]);
            pieza = new Pieza(espacio[0],espacio1,1);
        }catch(NumberFormatException e){
            JOptionPane.showMessageDialog(null, "error no es numero "+e);
        }
        return pieza;
    }
}
