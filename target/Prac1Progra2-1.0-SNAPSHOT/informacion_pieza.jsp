<%-- 
    Document   : informacion_pieza
    Created on : 30/08/2021, 23:58:42
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
        <link href="CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/style_informacion_pieza.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="titulo"><h1>Informacion piezas</h1></div>
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
            <a class="btn btn-success btn-lg" href="fabrica.jsp">Regresar</a>
            <a class="btn btn-success btn-lg " style="margin-left:870px;" href="añadir.jsp">Crear Pieza</a>
            <br>
            <br>             
        <table class="table table-bordered">
        <thead>
            <tr>
            <th >Tipo Pieza</th>
            <th class="text-center">Costo</th>
            <th class="text-center">Cantidad</th>
            <th class="text-center">Manipulacion</th>
            </tr>
        </thead> 
        <tbody>
            <%
                try{
                    st=cn.createStatement();
                    rs=st.executeQuery("SELECT * FROM pieza;");
            while(rs.next()){
                %>
                <tr>
                    <th scope="row"><%=rs.getString(1) %></th>
                    <td class="text-center"><%=rs.getString(2) %></td>
                    <td class="text-center"><%=rs.getInt(3) %></td>
                    <td class="text-center">
                        <a href="modificar_pieza.jsp?tipo_pieza=<%=rs.getString(1) %>" class="btn btn-primary">Modificar</a>
                        <a href="suprimir_pieza.jsp?tipo_pieza=<%=rs.getString(1) %>" class="btn btn-danger">Suprimir</a>
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
