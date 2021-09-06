<%-- 
    Document   : consulta_mueble
    Created on : 4/09/2021, 17:56:44
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
        <title>Mueble</title>
    </head>
    <body>
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div id="titulo"><h1>Consulta Muebles</h1></div>
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
            
            </tr><th >Nombre Mueble</th>
            <th class="text-center">Nombre Usuario</th>
            <th class="text-center">Precio</th>
            <th class="text-center">Fecha</th>
        </thead> 
        <tbody>
            <%
                try{
                    st=cn.createStatement();
                    rs=st.executeQuery("SELECT * FROM ensamblar");
            while(rs.next()){
                %>
                <tr>
                    <th scope="row"><%=rs.getString(2) %></th>
                    <td class="text-center"><%=rs.getString(3) %></td>
                    <td class="text-center"><%=rs.getDouble(4) %></td>
                    <td class="text-center"><%=rs.getDate(5) %></td>
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
