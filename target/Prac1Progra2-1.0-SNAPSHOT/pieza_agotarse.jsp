<%-- 
    Document   : pieza_agotarse
    Created on : 4/09/2021, 18:23:54
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
        <link href="CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/style_informacion_pieza.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String usuarioInicial=request.getParameter("usuarioInicial");
        %>
        <div id="titulo"><h1>Consulta Piezas Por Agotarse</h1></div>
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
            <br> 
        <table class="table table-bordered">
        <thead>
            <tr>
            <th >Tipo Pieza</th>
            <th class="text-center">Cantidad</th>
            <th class="text-center">Estado Pieza</th>
            </tr>
        </thead> 
        <tbody>
            <%
                try{
                    st=cn.createStatement();
                    rs=st.executeQuery("SELECT * FROM pieza WHERE cantidad<=3");
            while(rs.next()){
                %>
                <tr>
                    <th scope="row"><%=rs.getString(1) %></th>
                    <td class="text-center"><%=rs.getInt(3) %></td>
                    <%if(rs.getInt(3)>0&&rs.getInt(3)<=3){%>
                        <td class="text-center">Pieza por Agotarse</td>
                        <% }else if(rs.getInt(3)==0){%>
                            <td class="text-center">Pieza Agotada</td>
                        <%}%>
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
