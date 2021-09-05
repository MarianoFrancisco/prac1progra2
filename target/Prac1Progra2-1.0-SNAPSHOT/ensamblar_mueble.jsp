<%-- 
    Document   : ensamblar_mueble
    Created on : 2/09/2021, 17:17:10
    Author     : Mariano
--%>

<%@page import="CreadorObjetos.Almacenador"%>
<%@page import="Servlet.LoginServlet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="MySQL.ConexionBD"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.LocalDate"%>
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
            <h1>Ensamble de mueble</h1>
            <hr>
            <form action="ProcesoEnsamble?usuarioInicial=<%=usuarioInicial%>" method="post" class="form-control" style="width: 500px; height: 400px">
                Nombre Mueble:
                <input type="text" name="txtMueble" class="form-control"/><br>
                Precio Mueble:
                <input type="text" name="txtPrecio" class="form-control"/><br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="fabrica.jsp?usuarioInicial=<%=usuarioInicial%>>Regresar</a>
            </form>
        </div>
        
        
    </body>
</html>
