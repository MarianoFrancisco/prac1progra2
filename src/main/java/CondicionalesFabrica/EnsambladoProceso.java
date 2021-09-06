/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CondicionalesFabrica;

import MySQL.ConexionBD;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Mariano
 */
public class EnsambladoProceso extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try{
                //conectamos base de datos
                Connection cn=null;
                try{
                    ConexionBD con = new ConexionBD();
                    cn = con.conexion();
                }catch(Exception e){
                    
                }
                PreparedStatement st=null;
                PreparedStatement ps=null;
                Statement st1=cn.createStatement();
                String nombre_mueble,precio,usuarioInicial;
                nombre_mueble=request.getParameter("txtMueble");
                precio=request.getParameter("txtPrecio");
                usuarioInicial=request.getParameter("usuarioInicial");
                ResultSet rs1=st1.executeQuery("select * from ensamble where nombre_mueble='"+nombre_mueble+"'");
                LocalDate.now();
                    String datosPieza[]= new String[3];
                    String datosMueble[]= new String[3];
                    while(rs1.next()){    
                        datosMueble[0]=rs1.getString(2);//NOMBREMUEBLE
                        datosMueble[1]=rs1.getString(3);//TIPOPIEZA
                        datosMueble[2]=rs1.getString(4);//CANTIDAD_NECESARIA
                        ResultSet rs=st1.executeQuery("select * from pieza where tipo_pieza='"+datosMueble[1]+"'");
                        while(rs.next()){
                            datosPieza[0]=rs.getString(2);//COSTO
                            datosPieza[1]=rs.getString(3);//CANTIDAD_DISPONIBLE
                            if(Integer.parseInt(datosPieza[1])>=Integer.parseInt(datosMueble[2])){
                                int procesoResta=Integer.parseInt(datosPieza[1])-Integer.parseInt(datosMueble[2]);
                                ps=cn.prepareStatement("UPDATE pieza SET cantidad="+procesoResta+" WHERE tipo_pieza='"+datosMueble[1]+"'"); 
                                ps.executeUpdate();
                                st=cn.prepareStatement("INSERT INTO ensamblar(nombre_mueble,nombre_usuario,precio,fecha) VALUES(?,?,?,?)");
                                st.setString(1, nombre_mueble);
                                st.setString(2, usuarioInicial);
                                st.setDouble(3, Double.parseDouble(precio));
                                st.setDate(4, (java.sql.Date.valueOf(LocalDate.now())));     
                                st.executeUpdate();          
                                response.sendRedirect("fabrica/fabrica.jsp?usuarioInicial="+usuarioInicial);
                            }else{
                                response.sendRedirect("fabrica/fabrica.jsp?usuarioInicial="+usuarioInicial);
                            }
                        }
                        }
                    
                
                /**
                 * Returns a short description of the servlet.
                 *
                 * @return a String containing servlet description
                 */
            }catch(SQLException ex){
                Logger.getLogger(ProcesoEnsambles.class.getName()).log(Level.SEVERE,null, ex);
            }

}
    }
