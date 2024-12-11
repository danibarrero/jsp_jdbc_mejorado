<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 11/12/2024
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<h2>LISTADO ENTRENAMIENTO</h2>
<%
    //CARGA DEL DRIVER Y PREPARACIÓN DE LA CONEXIÓN CON LA BBDD
    //						v---------UTILIZAMOS LA VERSIÓN MODERNA DE LLAMADA AL DRIVER, no deprecado
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto","root", "secret");

    //UTILIZAR STATEMENT SÓLO EN QUERIES NO PARAMETRIZADAS.
    Statement s = conexion.createStatement();
    ResultSet listado = s.executeQuery ("SELECT * FROM entrenamiento");

    while (listado.next()) {
        out.println(listado.getString("entrenamientoID") + " " + listado.getString ("tipo") + "<br>");
    }
    listado.close();
    s.close();
    conexion.close();
%>
</body>
</html>
