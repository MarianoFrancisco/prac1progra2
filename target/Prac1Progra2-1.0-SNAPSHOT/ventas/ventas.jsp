<%-- 
    Document   : ventas
    Created on : 5/09/2021, 10:04:20
    Author     : Mariano
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>      
        <title>Ventas</title>
        <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/style_fabrica.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div id="titulo"><h1>Ventas</h1></div>
                <a class="btn btn-success btn-lg " style="margin-left:0px;" href="vender_mueble.jsp?usuarioInicial=<%=usuarioInicial%>">Vender mueble</a> 
        <a class="btn btn-success btn-lg " style="margin-left:0px;" href="consulta_compras.jsp?usuarioInicial=<%=usuarioInicial%>">Consulta compras</a>
        <a class="btn btn-success btn-lg " style="margin-left:0px;" href="consulta_devoluciones.jsp?usuarioInicial=<%=usuarioInicial%>">Consulta devoluciones</a>
        <a class="btn btn-success btn-lg " style="margin-left:0px;" href="consulta_muebles_venta.jsp?usuarioInicial=<%=usuarioInicial%>">Consulta muebles venta</a>
        <a class="btn btn-success btn-lg " style="margin-left:0px;" href="consulta_factura.jsp?usuarioInicial=<%=usuarioInicial%>">Consulta factura</a>
        <a class="btn btn-success btn-lg " style="margin-left:0px;" href="consulta_ventas_dia.jsp?usuarioInicial=<%=usuarioInicial%>">Consulta ventas dia</a> 
        <a class="btn btn-danger btn-lg" style="margin-left:10px;" href="../index.jsp">Salir</a> 

    </body>
</html>
