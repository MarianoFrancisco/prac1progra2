<%-- 
    Document   : ordenar_menor_fecha_mueble
    Created on : 4/09/2021, 18:06:37
    Author     : Mariano
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="MySQL.ConexionBD"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/style_informacion_pieza.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div id="titulo"><h1>Consulta Mueble Menor a Mayor Fecha</h1></div>
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
        <a class="btn btn-success btn-lg" href="fabrica.jsp?usuarioInicial=<%=usuarioInicial%>">Regresar</a>
            <a class="btn btn-success btn-lg " style="margin-left:870px;" href="ordenar_mayor_fecha_mueble.jsp?usuarioInicial=<%=usuarioInicial%>">Ordenar Mayor</a>
            <br>
            <br> 
            <a class="btn btn-success btn-lg " style="margin-left:985px;" href="ordenar_menor_fecha_mueble.jsp?usuarioInicial=<%=usuarioInicial%>">Ordenar Menor</a>
            <br>        
            <br> 
        <table class="table table-bordered">
        <thead>
            <tr>
            <th >Nombre Mueble</th>
            <th class="text-center">Nombre Usuario</th>
            <th class="text-center">Precio</th>
            <th class="text-center">Fecha</th>
            </tr>
        </thead> 
        <tbody>
            <%
                try{
                    st=cn.createStatement();
                    rs=st.executeQuery("select nombre_mueble,nombre_usuario,precio,fecha from ensamblar order by fecha ASC");
            while(rs.next()){
                %>
                <tr>
                    <th scope="row"><%=rs.getString(1) %></th>
                    <td class="text-center"><%=rs.getString(2) %></td>
                    <td class="text-center"><%=rs.getDouble(3) %></td>
                    <td class="text-center"><%=rs.getDate(4) %></td>
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
