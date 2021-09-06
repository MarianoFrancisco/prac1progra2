<%-- 
    Document   : modificar_usuario
    Created on : 5/09/2021, 14:53:22
    Author     : Mariano
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="MySQL.ConexionBD"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/style_informacion_pieza.css" rel="stylesheet" type="text/css"/>
        <title>Modificar usuario</title>
    </head>
    <body>
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div id="titulo"><h1>Modificar Usuario</h1></div>
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
            <a class="btn btn-success btn-lg " style="margin-left:870px;" href="añadir_usuario.jsp?usuarioInicial=<%=usuarioInicial%>">Crear Usuario</a>
            <br>
            <br>             
        <table class="table table-bordered">
        <thead>
            <tr>
            <th >Tipo Mueble</th>
            <th class="text-center">Nombre</th>
            <th class="text-center">Password</th>
            <th class="text-center">Tipo</th>
            </tr>
        </thead> 
        <tbody>
            <%
                try{
                    st=cn.createStatement();
                    rs=st.executeQuery("SELECT * FROM usuario");
            while(rs.next()){
                %>
                <tr>
                    <th scope="row"><%=rs.getString(1) %></th>
                    <td class="text-center"><%=rs.getString(2) %></td>
                    <td class="text-center"><%=rs.getInt(3) %></td>
                    <td class="text-center">
                        <a href="eliminar_usuario.jsp?nombre_usuario=<%=rs.getString(1)%>&usuarioInicial=<%=usuarioInicial%>" class="btn btn-danger">Suprimir</a>
                    </td>
                </tr>
                <%
                    }
            }catch(Exception e){
                    out.println("error mysql"+e);
            }
            %>
            
        </tbody>
        </table>
    </body>
</html>