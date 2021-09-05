<%-- 
    Document   : fabrica
    Created on : 27/08/2021, 04:25:27
    Author     : Mariano
--%>


<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>      
        <title>Fábrica</title>
        <link href="CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/style_fabrica.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div id="titulo"><h1>Fabrica</h1></div>
        <a class="btn btn-success btn-lg " style="margin-left:50px;" href="InformacionPiezas?usuarioInicial=<%=usuarioInicial%>">Informacion de Piezas</a>
        <a class="btn btn-success btn-lg " style="margin-left:50px;" href="EnsamblarMueble?usuarioInicial=<%=usuarioInicial%>">Ensamblar Mueble</a>
        <a class="btn btn-success btn-lg " style="margin-left:50px;" href="consulta_pieza.jsp?usuarioInicial=<%=usuarioInicial%>">Consulta Piezas</a>
        <a class="btn btn-success btn-lg " style="margin-left:50px;" href="consulta_mueble.jsp?usuarioInicial=<%=usuarioInicial%>">Consulta Muebles</a>
        <a class="btn btn-success btn-lg " style="margin-left:50px;" href="pieza_agotarse.jsp?usuarioInicial=<%=usuarioInicial%>">Piezas a agotarse</a> 
        <form action="LectorArchivo" method="POST" enctype="multipart/form-data">
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
            <input class="btn btn-warning" style="margin-left:500px;" type="file" name="file" />          
            <input class="btn btn-primary" style="margin-left:570px;" type="submit" value="Procesar informacion"/>         
        </form>
    </body>
</html>
