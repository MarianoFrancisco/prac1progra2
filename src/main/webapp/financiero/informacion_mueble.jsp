<%-- 
    Document   : informacion_mueble
    Created on : 5/09/2021, 14:53:08
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
        <title>Informacion pieza</title>
    </head>
    <body>
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div id="titulo"><h1>Informacion muebles</h1></div>
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
            <a class="btn btn-success btn-lg " style="margin-left:870px;" href="añadir_mueble.jsp?usuarioInicial=<%=usuarioInicial%>">Crear Pieza</a>
            <br>
            <br>             
        <table class="table table-bordered">
        <thead>
            <tr>
            <th >Tipo Mueble</th>
            <th class="text-center">Pata necesaria</th>
            <th class="text-center">Cantidad</th>
            <th class="text-center">Manipulacion</th>
            </tr>
        </thead> 
        <tbody>
            <%
                try{
                    st=cn.createStatement();
                    rs=st.executeQuery("SELECT * FROM ensamble");
            while(rs.next()){
                %>
                <tr>
                    <th scope="row"><%=rs.getString(2) %></th>
                    <td class="text-center"><%=rs.getString(3) %></td>
                    <td class="text-center"><%=rs.getInt(4) %></td>
                    <td class="text-center">
                        <a href="modificar_mueble.jsp?numero_asignacion=<%=rs.getInt(1) %>&usuarioInicial=<%=usuarioInicial%>"" class="btn btn-primary">Modificar</a>
                        <a href="suprimir_mueble.jsp?numero_asignacion=<%=rs.getInt(1)%>&usuarioInicial=<%=usuarioInicial%>" class="btn btn-danger">Suprimir</a>
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
