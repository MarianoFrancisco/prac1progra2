<%-- 
    Document   : financiero
    Created on : 27/08/2021, 04:25:48
    Author     : Mariano
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>      
        <title>Financiero</title>
        <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/style_fabrica.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div id="titulo"><h1>Financiero</h1></div>
                <a class="btn btn-success btn-lg " style="margin-left:20px;" href="informacion_mueble.jsp?usuarioInicial=<%=usuarioInicial%>">Información Mueble</a> 
        <a class="btn btn-success btn-lg " style="margin-left:20px;" href="modificar_usuario.jsp?usuarioInicial=<%=usuarioInicial%>">Crear/Cancelar Usuarios</a>
        <a class="btn btn-success btn-lg " style="margin-left:20px;" href="opciones_rol.jsp?usuarioInicial=<%=usuarioInicial%>">Opciones por Rol</a>
        <a class="btn btn-success btn-lg " style="margin-left:20px;" href="reporte_devoluciones.jsp?usuarioInicial=<%=usuarioInicial%>">Reporte Devoluciones</a>
        <a class="btn btn-success btn-lg " style="margin-left:20px;" href="reporte_mejor_vendedor.jsp?usuarioInicial=<%=usuarioInicial%>">Reporte Mejor Vendedor</a>
        <a class="btn btn-danger btn-lg" style="margin-left:10px;" href="../index.jsp">Salir</a> 
        <br>
        <br>
        <a class="btn btn-success btn-lg " style="margin-left:200px;" href="reporte_mueble_menos_vendido.jsp?usuarioInicial=<%=usuarioInicial%>">Reporte Muebles Mas Vendidos</a> 
        <a class="btn btn-success btn-lg " style="margin-left:200px;" href="reporte_muebles_mas_vendido.jsp?usuarioInicial=<%=usuarioInicial%>">Reporte Muebles Menos Vendidos</a> 


    </body>
</html>

