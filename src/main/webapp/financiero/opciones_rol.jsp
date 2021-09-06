<%-- 
    Document   : opciones_rol
    Created on : 5/09/2021, 14:53:29
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
        <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/style_informacion_pieza.css" rel="stylesheet" type="text/css"/>
        <title>Mueble venta</title>
    </head>
    <body>
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div id="titulo"><h1>Roles Usuario</h1></div>
        <hr>
        <%
            Connection cn=null;
            try{
                ConexionBD con = new ConexionBD();
                cn = con.conexion();
            }catch(Exception e){
                JOptionPane.showMessageDialog(null, "Error conectar a MySQL"+e);
            }
            
            Statement st=null;
            ResultSet rs=null;
        %> 
            <a class="btn btn-success btn-lg" href="financiero.jsp?usuarioInicial=<%=usuarioInicial%>">Regresar</a>
            <br>        
            <br> 
        <table class="table table-bordered">
        <thead>
            <tr>
            
            </tr><th >Usuario Tipo</th>
            <th class="text-center">Roles</th>
        </thead> 
        <tbody>
            
                <tr>
                    <th scope="row">1</th>
                    <td >Este usuario se encarga de la parte de fabrica donde puede:<br>
                        -Consultar muebles<br>
                        -Modificar muebles<br>
                        -Ensamblar muebles<br>
                        -Ordenar piezas<br>
                        -Ordenar muebles<br>
                        -Ver piezas por agotarse<br>
                        -Enviar muebles a la sala de ventas<br>
                    </td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td >Este usuario se encarga de la parte de ventas donde puede:<br>
                        -Registrar ventas<br>
                        -Registrar devoluciones<br>
                        -Reintegar muebles<br>
                        -Consultar de compras<br>
                        -Consultar de devoluciones<br>
                        -Consultar de muebles en venta<br>
                        -Enviar muebles a la sala de ventas<br>
                    </td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td >Este usuario se encarga de la parte de fabrica donde puede:<br>
                        -Crear y modificar muebles<br>
                        -Crear/Cancelar usuarios<br>
                        -Mostrar opciones para cada rol<br>
                        -Hacer reportes de devoluciones, ganancias, usuario mejor vendedor, muebles más vendidos y los menos vendidos<br>
                    </td>
                </tr>
        </tbody>
        </table>
    </body>
</html>

