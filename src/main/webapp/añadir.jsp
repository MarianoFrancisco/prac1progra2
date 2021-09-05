<%-- 
    Document   : añadir
    Created on : 2/09/2021, 14:53:36
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
        <title>JSP Page</title>
        <link href="CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div class="container">
            <h1>Crear Pieza</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                Tipo Pieza:
                <input type="text" name="txtPieza" class="form-control"/><br>
                Costo:
                <input type="text" name="txtCosto" class="form-control"/>
                Cantidad:
                <input type="text" name="txtCantidad" class="form-control"/>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="informacion_pieza.jsp?usuarioInicial=<%=usuarioInicial%>">Regresar</a>
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
            String tipo_pieza,costo, cantidad;
            tipo_pieza=request.getParameter("txtPieza");
            costo=request.getParameter("txtCosto");
            cantidad=request.getParameter("txtCantidad");
            if(tipo_pieza!=null && costo!=null && cantidad!=null){
                st=cn.prepareStatement("INSERT INTO pieza (tipo_pieza,costo,cantidad) VALUES(?,?,?)");
                st.setString(1, tipo_pieza);
                st.setDouble(2, Double.parseDouble(costo));
                st.setInt(3, Integer.parseInt(cantidad));
                st.executeUpdate();
                JOptionPane.showMessageDialog(null, "agregamos");
                response.sendRedirect("informacion_pieza.jsp?usuarioInicial="+usuarioInicial);
            }
%>
