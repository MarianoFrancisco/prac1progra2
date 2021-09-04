<%-- 
    Document   : modificar_pieza.jsp
    Created on : 2/09/2021, 13:04:22
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
        <title>JSP Page</title>
        <link href="CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
           //conectamos
            Connection cn=null;
            try{
                ConexionBD con = new ConexionBD();
                cn = con.conexion();
            }catch(Exception e){
                JOptionPane.showMessageDialog(null, "Error conectar a MySQL"+e);
            }
            PreparedStatement st=null;
            ResultSet rs=null;
            String tipoPieza=request.getParameter("tipo_pieza");
            st=cn.prepareStatement("SELECT * FROM pieza where tipo_pieza='"+tipoPieza+"'");
            rs=st.executeQuery();
            while(rs.next()){
        %>
        <div class="container">
            <h1>Modificar Piezas</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                TIPO PIEZA:
                <input type="text" name="txtPieza" class="form-control" value="<%= rs.getString(1)%>"/>
                COSTO:
                <input type="text" name="txtCosto" class="form-control" value="<%= rs.getDouble(2)%>"/><br>
                CANTIDAD:
                <input type="text" name="txtCantidad" class="form-control" value="<%= rs.getInt(3)%>"/>
                 <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                
                <a href="informacion_pieza.jsp">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
    String tipo_pieza,costo, cantidad;
       tipo_pieza=request.getParameter("txtPieza");
       costo=request.getParameter("txtCosto");
       cantidad=request.getParameter("txtCantidad");
       if(tipo_pieza!=null && costo!=null && cantidad!=null){
           st=cn.prepareStatement("UPDATE pieza SET tipo_pieza='"+tipo_pieza+"', costo="+Double.parseDouble(costo)+", cantidad="+Integer.parseInt(cantidad)+" WHERE tipo_pieza='"+tipoPieza+"'");
           st.executeUpdate();
           response.sendRedirect("informacion_pieza.jsp");
       }
%>