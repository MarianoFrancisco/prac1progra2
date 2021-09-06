/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CondicionalesFabrica;

import MySQL.ConexionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class IngresarSalaVentas extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet IngresarSalaVentas</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IngresarSalaVentas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
                //conectamos
                Connection cn=null;
                try{
                    ConexionBD con = new ConexionBD();
                    cn = con.conexion();
                }catch(Exception e){
                    JOptionPane.showMessageDialog(null, "Error conectar a MySQL"+e);
                }
                PreparedStatement st=null;
                PreparedStatement ps=null;
                Statement st1=cn.createStatement();
                String nombre_mueble,usuarioInicial;
                double precio;
                int decision,id;
                id=Integer.parseInt(request.getParameter("id"));
                nombre_mueble=request.getParameter("nombre_mueble");
                decision=Integer.parseInt(request.getParameter("decision"));
                precio=Double.parseDouble(request.getParameter("precio"));
                usuarioInicial=request.getParameter("usuarioInicial");
                if(decision==0){
                    ps=cn.prepareStatement("DELETE FROM mueble where nombre_mueble='"+nombre_mueble+"'");
                    ps.executeUpdate();
                    ps.close();
                    st = cn.prepareStatement("INSERT INTO mueble_venta(nombre_mueble_venta,precio_venta) VALUES(?,?)");//Nos permite acercarnos a mysql
                    st.setString(1, nombre_mueble);
                    st.setDouble(2, precio);
                    st.executeUpdate();
                    st.close();
                    response.sendRedirect("fabrica/enviar_sala_ventas.jsp?usuarioInicial="+usuarioInicial);
                }else if(decision==1){
                    ps=cn.prepareStatement("DELETE FROM ensamblar where numero_ensamble="+id);
                    ps.executeUpdate();
                    ps.close();
                    st = cn.prepareStatement("INSERT INTO mueble_venta(nombre_mueble_venta,precio_venta) VALUES(?,?)");//Nos permite acercarnos a mysql
                    st.setString(1, nombre_mueble);
                    st.setDouble(2, precio);
                    st.executeUpdate();
                    st.close();
                    response.sendRedirect("fabrica/enviar_sala_ventas.jsp?usuarioInicial="+usuarioInicial);
                }
                /**
                 * Returns a short description of the servlet.
                 *
                 * @return a String containing servlet description
                 */
            }catch(SQLException ex){
                Logger.getLogger(ProcesoEnsamble.class.getName()).log(Level.SEVERE,null, ex);
            }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}