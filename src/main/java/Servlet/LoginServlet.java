/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;


import MySQL.ConexionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Mariano
 */
public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String usuario=request.getParameter("usuarioInicial");
        String password = request.getParameter("password");
        try{
            //open connetcion
            Connection cn=null;
            try{
                ConexionBD con = new ConexionBD();
                cn = con.conexion();
                JOptionPane.showMessageDialog(null, "Conectamos exitosamente a MySQL");
            }catch(Exception e){
                JOptionPane.showMessageDialog(null, "Error conectar a MySQL"+e);
            }
            Statement st=cn.createStatement();
            ResultSet rs=st.executeQuery("select * from usuario where nombre_usuario='"+usuario+"'");
            String datos[]= new String[3];
            //
            if(rs.next()){       
                datos[0]=rs.getString(1);
                datos[1]=rs.getString(2);
                datos[2]=rs.getString(3);
                if(Integer.parseInt(datos[2])==1&&datos[1].equals(password)){
                    response.sendRedirect("fabrica/fabrica.jsp?usuarioInicial="+usuario);
                }else if(Integer.parseInt(datos[2])==2&&datos[1].equals(password)){
                    response.sendRedirect("ventas/ventas.jsp?usuarioInicial="+usuario);
                }else if(Integer.parseInt(datos[2])==3&&datos[1].equals(password)){
                    response.sendRedirect("financiero/financiero.jsp?usuarioInicial="+usuario);
                }else{
                    out.println("error");
                }
            }else{
                out.println("error");
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
}
