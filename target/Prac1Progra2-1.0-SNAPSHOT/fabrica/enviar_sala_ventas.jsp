<%-- 
    Document   : enviar_sala_ventas
    Created on : 5/09/2021, 07:56:37
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
        <title>Sala ventas</title>
    </head>
    <body>
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
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
            ResultSet rs1=null;

        %>
        
            <a class="btn btn-success btn-lg" href="fabrica.jsp?usuarioInicial=<%=usuarioInicial%>">Regresar</a>
            <br>
            <br>             
        <table class="table table-bordered">
        <thead>
            <tr>
            <th >Ingreso a Sala Ventas</th>
            <th class="text-center">Precio</th>
            <th class="text-center">Manipulacion</th>
            </tr>
        </thead> 
        <tbody>
            <%
                try{
                    st=cn.createStatement(); 
                    rs1=st.executeQuery("SELECT numero_ensamble,nombre_mueble,precio FROM ensamblar");
                    while(rs1.next()){
                %>
                <tr>
                    <th scope="row"><%=rs1.getString(2) %></th>
                    <td class="text-center"><%=rs1.getDouble(3) %></td>
                    <td class="text-center">
                        <a href="../IngresarSalaVentas?nombre_mueble=<%=rs1.getString(2) %>&usuarioInicial=<%=usuarioInicial%>&precio=<%=rs1.getDouble(3)%>&id=<%=rs1.getInt(1)%>"" class="btn btn-primary">Enviar Sala Ventas</a>
                    </td>
                </tr>
                <%
                    }rs1.close();
            }catch(Exception e){
                    out.println("error mysql"+e);
            }
            %>
            
        </tbody>
        </table>
    </body>
</html>

