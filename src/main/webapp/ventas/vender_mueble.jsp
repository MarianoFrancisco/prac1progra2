<%-- 
    Document   : vender_mueble
    Created on : 5/09/2021, 10:42:20
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
        <title>Vender mueble</title>
    </head>
    <body>
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div id="titulo"><h1>Vender Mueble</h1></div>
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
            <a class="btn btn-success btn-lg" href="ventas.jsp?usuarioInicial=<%=usuarioInicial%>">Regresar</a>
            <br>        
            <br> 
        <table class="table table-bordered">
        <thead>
            <tr>
            
            </tr><th >Nombre Mueble</th>
            <th class="text-center">Precio</th>
            <th class="text-center">Accion</th>
        </thead> 
        <tbody>
            <%
                try{
                    st=cn.createStatement();
                    rs=st.executeQuery("SELECT * FROM mueble_venta");
            while(rs.next()){
                %>
                <tr>
                    <th scope="row"><%=rs.getString(2) %></th>
                    <td class="text-center"><%=rs.getDouble(3) %></td>
                    <td class="text-center">
                    <a href="vendiendo_mueble.jsp?mueble_venta=<%=rs.getString(2) %>?id=<%=rs.getInt(1) %>&usuarioInicial=<%=usuarioInicial%>&precio_llamar=<%=rs.getDouble(3)%>" class="btn btn-danger">Vender</a>
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

