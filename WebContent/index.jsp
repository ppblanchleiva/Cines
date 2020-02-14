<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
<h1>Hello World!</h1>
<%
//Prueba sebas
String nombre = "Sebas2"; 
try{
	int numero = 25;
Context initCtx = new InitialContext();
DataSource dataSource = (DataSource)initCtx.lookup("java:/cine");
Connection conexion= dataSource.getConnection();
Statement stmt =conexion.createStatement(); //Objeto Statement para consultas.
ResultSet rs = stmt.executeQuery("select titulo,genero  from PELICULAS");
out.println("<br>Conexion correcta");
while (rs.next()){
out.println ("<br>Película ,.m.m,.m.,m : "+rs.getString ("titulo de pelicula")+"- Género: "+rs.getString("genero"));
}
rs.close();
stmt.close();
conexion.close();
}
catch(Exception e){
out.println(e.getMessage());
}
%>
</body>
</html>