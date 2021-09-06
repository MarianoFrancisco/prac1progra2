<%-- 
    Document   : añadir_mueble
    Created on : 5/09/2021, 17:09:26
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
        <title>Crear pieza</title>
        <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div class="container">
            <h1>Crear Pieza</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                TIPO MUEBLE:
                <input type="text" name="txtMueble" class="form-control"/><br>
                PATA NECESARIA:
                <input type="text" name="txtPata" class="form-control"/>
                CANTIDAD:
                <input type="text" name="txtCantidad" class="form-control"/>
                PRECIO:
                <input type="text" name="txtPrecio" class="form-control"/>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="informacion_mueble.jsp?usuarioInicial=<%=usuarioInicial%>">Regresar</a>
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
            PreparedStatement st=null;
            PreparedStatement st1=null;
            String tipo_mueble,pata, cantidad,precio;
            tipo_mueble=request.getParameter("txtMueble");
            pata=request.getParameter("txtPata");
            cantidad=request.getParameter("txtCantidad");
            precio=request.getParameter("txtPrecio");
            if(tipo_mueble!=null && pata!=null && cantidad!=null){
                st=cn.prepareStatement("INSERT INTO mueble (nombre_mueble,precio) VALUES(?,?)");
                st.setString(1, tipo_mueble);
                st.setDouble(2, Double.parseDouble(precio));
                st.close();
                st1=cn.prepareStatement("INSERT INTO ensamble (nombre_mueble,tipo_pieza,cantidad) VALUES(?,?,?)");
                st1.setString(1, tipo_mueble);
                st1.setString(2, pata);
                st1.setInt(3, Integer.parseInt(cantidad));
                st1.executeUpdate();
                st1.close();
                response.sendRedirect("informacion_mueble.jsp?usuarioInicial="+usuarioInicial);
            }
           
%>
