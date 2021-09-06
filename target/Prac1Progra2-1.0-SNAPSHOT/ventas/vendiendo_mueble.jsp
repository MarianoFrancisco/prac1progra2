<%-- 
    Document   : vendiendo_mueble
    Created on : 5/09/2021, 14:23:13
    Author     : Mariano
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="MySQL.ConexionBD"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Vendiendo mueble</title>
        <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <%
            String precio=request.getParameter("precio_llamar");
            String nombre_mueble=request.getParameter("mueble_venta");
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div class="container">
            <h1>Vendiendo mueble</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                NIT:
                <input type="text" name="txtNit" class="form-control"/><br>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="vender_mueble.jsp?usuarioInicial=<%=usuarioInicial%>">Regresar</a>
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
                response.sendRedirect("vender_mueble.jsp?usuarioInicial="+usuarioInicial);
            }
            PreparedStatement st1=null;
            String nit;
            nit=request.getParameter("txtNit");
            try{
            if(nit!=null){
                int cantidad=1;
                st1=cn.prepareStatement("INSERT INTO factura(nombre_usuario,nombre_mueble,nit,cantidad,total_pago,fecha) VALUES(?,?,?,?,?,?)");
                st1.setString(1, usuarioInicial);
                st1.setString(2, nombre_mueble);
                st1.setString(3, nit);
                st1.setInt(4, cantidad);
                st1.setDouble(5, Double.parseDouble(precio));
                st1.setDate(6, (java.sql.Date.valueOf(LocalDate.now())));
                st1.executeUpdate();
                st1.close();
                response.sendRedirect("vender_mueble.jsp?usuarioInicial="+usuarioInicial);
            }
            }catch(Exception e){
                response.sendRedirect("vender_mueble.jsp?usuarioInicial="+usuarioInicial);
            }
            
           
%>
