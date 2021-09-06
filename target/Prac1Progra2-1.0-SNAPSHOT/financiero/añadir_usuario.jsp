<%-- 
    Document   : añadir_usuario
    Created on : 6/09/2021, 00:46:17
    Author     : Mariano
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="MySQL.ConexionBD"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Añadir Usuario</title>
        <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div class="container">
            <h1>Añadir Usuario</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                NOMBRE:
                <input type="text" name="txtNombre" class="form-control"/><br>
                PASSWORD:
                <input type="text" name="txtPassword" class="form-control"/>
                TIPO:
                <input type="text" name="txtTipo" class="form-control"/>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="modificar_usuario.jsp?usuarioInicial=<%=usuarioInicial%>">Regresar</a>
            </form>
        </div>
        
        
    </body>
</html>

<%
           //conectamos
            Connection cn=null;
            try{
                ConexionBD con = new ConexionBD();
                cn = con.conexion();
            }catch(Exception e){
                JOptionPane.showMessageDialog(null, "Error conectar a MySQL"+e);
            }
            PreparedStatement st1=null;
            String nombre_usuario,contraseña, tipo;
            nombre_usuario=request.getParameter("txtNombre");
            contraseña=request.getParameter("txtPassword");
            tipo=request.getParameter("txtTipo");
            if(nombre_usuario!=null && contraseña!=null && tipo!=null){
                st1=cn.prepareStatement("INSERT INTO usuario(nombre_usuario,contraseña,tipo) VALUES(?,?,?)");
                st1.setString(1, nombre_usuario);
                st1.setString(2, contraseña);
                st1.setInt(3, Integer.parseInt(tipo));
                st1.executeUpdate();
                st1.close();
                response.sendRedirect("modificar_usuario.jsp?usuarioInicial="+usuarioInicial);
            }
           
%>