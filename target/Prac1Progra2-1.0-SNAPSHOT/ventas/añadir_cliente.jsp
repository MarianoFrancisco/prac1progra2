<%-- 
    Document   : añadir_cliente
    Created on : 6/09/2021, 13:19:23
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
        <title>Crear pieza</title>
        <link href="../CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>  
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div class="container">
            <h1>Crear Pieza</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                NIT
                <input type="text" name="txtNIT" class="form-control"/><br>
                NOMBRE:
                <input type="text" name="txtNombre" class="form-control"/>
                DIRECCION:
                <input type="text" name="txtDirecion" class="form-control"/>
                MUNICIPIO:
                <input type="text" name="txtMunicipio" class="form-control"/>
                DEPARTAMENTO:
                <input type="text" name="txtDepartamento" class="form-control"/>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="ventas.jsp?usuarioInicial=<%=usuarioInicial%>">Regresar</a>
            </form>
        </div>
        
        
    </body>
</html>

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
            String nit,nombre,direccion,municipio,departamento;
            nit=request.getParameter("txtNIT");
            nombre=request.getParameter("txtNombre");
            direccion=request.getParameter("txtDirecion");
            municipio=request.getParameter("txtMunicipio");
            departamento=request.getParameter("txtDepartamento");

            if(nit!=null && nombre!=null && direccion!=null&&municipio!=null){
                st = cn.prepareStatement("INSERT INTO cliente(nit,nombre_cliente,direccion_cliente,municipio,departamento) VALUES(?,?,?,?,?)");//Nos permite acercarnos a mysql
                        st.setString(1, nit);
                        st.setString(2, nombre);
                        st.setString(3, direccion);
                        st.setString(4, municipio);
                        st.setString(5, departamento);
                        st.executeUpdate();//cambios
                response.sendRedirect("ventas.jsp?usuarioInicial="+usuarioInicial);
            }
%>
