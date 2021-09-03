    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MySQL;
import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author Mariano
 */
public class ConexionBD {
    public Connection conexion(){
        String driver="com.mysql.cj.jdbc.Driver";
        String usuario ="root";
        String clave ="Ana1941";
        String url="jdbc:mysql://localhost:3306/practica1progra2?useTimezone=true&serverTimezone=GMT-6&allowPublicKeyRetrieval=true&useSSL=false";
        Connection cn=null;
        try{
            Class.forName(driver);
            try{
                cn = DriverManager.getConnection(url,usuario,clave);
            }catch(Exception e){
                JOptionPane.showMessageDialog(null, "Error al conectar base de datos"+e);
            }
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Driver no cargado"+e);
        }
        return cn;
        
    }
    Statement createStatement(){
        throw new UnsupportedOperationException("No soportado");
    }
}
