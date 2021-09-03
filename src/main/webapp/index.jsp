<%-- 
    Document   : index
    Created on : 22/08/2021, 13:11:25
    Author     : Mariano
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>
        <title>Mi mueblería</title>
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <body> 
        <div id="titulo"><h1>Bienvenidos a "Mi mueblería"</h1></div>
        <div id="datosUsuario">   
            <h1>Inicio de Sesión<h1>
            <form id="formularioUsuario" method="POST" action="LoginServlet">
                <img src="Imagenes/usuario.PNG" alt=""/>
                <input type="text" name="usuario" placeholder="Ingrese su usuario"/>
                <hr>
                <img src="Imagenes/pass.PNG" alt=""/>
                <input type="password" name="password" placeholder="Ingrese su contraseña"/>
                <hr>
                <input type="submit" value="Iniciar Sesión" />
            </form>
        </div>
    </body>
</html>
