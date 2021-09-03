<%-- 
    Document   : suprimir_pieza
    Created on : 2/09/2021, 15:07:28
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
        <title>JSP Page</title>
    </head>
    <body>
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
            String tipoPieza=request.getParameter("tipo_pieza");
            st=cn.prepareStatement("DELETE FROM pieza where tipo_pieza='"+tipoPieza+"'");
            st.executeUpdate();
            response.sendRedirect("informacion_pieza.jsp");
        %>
    </body>
    
</html>
