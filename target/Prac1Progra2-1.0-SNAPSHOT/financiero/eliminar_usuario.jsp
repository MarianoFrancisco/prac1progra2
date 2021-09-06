<%-- 
    Document   : eliminar_usuario
    Created on : 6/09/2021, 01:10:00
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
            String nombre_usuario=request.getParameter("nombre_usuario");
            st=cn.prepareStatement("DELETE FROM usuario where nombre_usuario='"+nombre_usuario+"'");
            st.executeUpdate();
            response.sendRedirect("modificar_usuario.jsp?usuarioInicial="+usuarioInicial);
        %>
    </body>
    
</html>
