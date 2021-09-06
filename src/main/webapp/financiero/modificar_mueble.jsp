<%-- 
    Document   : modificar_mueble
    Created on : 5/09/2021, 17:09:34
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
        <title>Modificar Pieza</title>
        <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
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
            int numero_asignacion=Integer.parseInt(request.getParameter("numero_asignacion"));
            st=cn.prepareStatement("SELECT * FROM ensamble where numero_asignacion="+numero_asignacion);
            rs=st.executeQuery();
            while(rs.next()){
        %>
        <div class="container">
            <h1>Modificar Piezas</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                TIPO MUEBLE:
                <input type="text" name="txtMueble" class="form-control" value="<%= rs.getString(2)%>"/>
                PATA NECESARIA:
                <input type="text" name="txtPata" class="form-control" value="<%= rs.getString(3)%>"/><br>
                CANTIDAD:
                <input type="text" name="txtCantidad" class="form-control" value="<%= rs.getInt(4)%>"/>
                 <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                
                <a href="informacion_mueble.jsp?usuarioInicial=<%=usuarioInicial%>">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>

<%
    
    String tipo_Mueble,tipo_pieza, cantidad;
       tipo_Mueble=request.getParameter("txtMueble");
       tipo_pieza=request.getParameter("txtPata");
       cantidad=request.getParameter("txtCantidad");
       if(tipo_Mueble!=null && tipo_pieza!=null && cantidad!=null){
           st=cn.prepareStatement("UPDATE ensamble SET nombre_mueble='"+tipo_Mueble+"', tipo_pieza='"+tipo_pieza+"', cantidad="+Integer.parseInt(cantidad)+" WHERE numero_asignacion='"+numero_asignacion+"'");
           st.executeUpdate();
           response.sendRedirect("informacion_mueble.jsp?usuarioInicial="+usuarioInicial);
       }
%>
