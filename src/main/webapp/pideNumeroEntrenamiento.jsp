<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 11/12/2024
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto","root", "secret");
    Statement s = conexion.createStatement();

    ResultSet listado = s.executeQuery ("SELECT * FROM entrenamiento");
%>
<table>
    <tr><th>Nº Entrenamiento</th><th>Tipo</th><th>Ubicacion</th><th>Fecha</th></tr>
    <%
        Integer entrenamientoIDADestacar = (Integer)session.getAttribute("entrenamientoIDADestacar");
        String claseDestacar = "";
        while (listado.next()) {
            claseDestacar = (entrenamientoIDADestacar != null
                    && entrenamientoIDADestacar ==listado.getInt("entrenamientoID") ) ?
                    "destacar" :  "";
    %>


    <tr class="<%= claseDestacar%>" >
        <td ><%=listado.getInt("entrenamientoID")%></td>
        <td><%=listado.getString("tipo")%></td>
        <td><%=listado.getString("ubicacion")%></td>
        <td><%=listado.getString("fecha")%></td>
        <td>
            <form method="get" action="borraEntrenamiento.jsp">
                <input type="hidden" name="codigo" value="<%=listado.getString("entrenamientoID") %>"/>
                <input type="submit" value="borrar">
            </form>
        </td>
    </tr>
    <%
        } // while
        conexion.close();
    %>
</table>

<button>
    <a href="index.jsp">Volver</a>
</button>

</body>
</html>
