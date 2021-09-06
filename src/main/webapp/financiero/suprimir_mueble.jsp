<%-- 
    Document   : suprimir_mueble
    Created on : 5/09/2021, 17:09:45
    Author     : Mariano
--%>

<%@page import="MySQL.ConexionBD"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Suprimir</title>
    </head>
    <body>
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <%
           //conectamos
            Connection cn=null;
            try{
                ConexionBD con = new ConexionBD();
                cn = con.conexion();
            }catch(Exception e){
                JOptionPane.showMessageDialog(null, "Error conectar a MySQL"+e);
            }
            
            PreparedStatement st=null;
            int numero_asignacion=Integer.parseInt(request.getParameter("numero_asignacion"));
            st=cn.prepareStatement("DELETE FROM ensamble where numero_asignacion="+numero_asignacion);
            st.executeUpdate();
            response.sendRedirect("informacion_mueble.jsp?usuarioInicial="+usuarioInicial);
        %>
    </body>
    
</html>