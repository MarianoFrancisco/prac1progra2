<%-- 
    Document   : primeraTabla
    Created on : 14/08/2021, 21:56:39
    Author     : Mariano
--%>

<%@page import="java.sql.*"%>   
<%@page import="MySQL.ConexionBD"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>titulo</title>
    </head>
    <body>
        <h1>Probando!</h1>
        <%
            Connection cn=null;
            try{
                ConexionBD con = new ConexionBD();
                cn = con.conexion();
                
                JOptionPane.showMessageDialog(null, "Conectamos exitosamente a MySQL");
            }catch(Exception e){
                JOptionPane.showMessageDialog(null, "Error conectar a MySQL"+e);
            }
            
            Statement st=null;
            ResultSet rs=null;

        %>
        <div class="container">
            <div class="row">
                <div class="col.sm">
                    
        <table class="table">
        <thead>
            <tr>
            <th scope="col">#</th>
            <th scope="col">First</th>
            <th scope="col">Last</th>
            <th scope="col">Handle</th>
            </tr>
        </thead>
        <tbody>
            <%
                try{
                    st=cn.createStatement();
                    rs=st.executeQuery("SELECT * FROM usuario;");
            while(rs.next()){
                %>
                <tr>
                    <th scope="row"><%=rs.getString(1) %></th>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(3) %></td>
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
