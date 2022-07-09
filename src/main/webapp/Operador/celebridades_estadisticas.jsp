<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 8/07/2022
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="actor" scope="request" type="com.example.javasticketscentro.Beans.BCelebridad" class="com.example.javasticketscentro.Beans.BCelebridad"/>
<jsp:useBean id="director" scope="request" type="com.example.javasticketscentro.Beans.BCelebridad" class="com.example.javasticketscentro.Beans.BCelebridad"/>
<html>
<head>
    <title>Estadisticas - Celebridades</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<h3>Celebridad mejor calificada</h3>

<table>
    <thead>
    <tr>
        <td><h3>Película</h3></td><td><h3>Actor</h3></td><td><h3>Puntaje</h3></td><td><h3>Clasificación</h3></td> <td><h3>Foto</h3></td>
    </tr>
    </thead>
    <tbody>

    <tr>
        <td><h4><%=actor.getbPelicula().getNombre()%></h4></td><td><h4><%=actor.getNombre()%> <%=actor.getApellido()%></h4></td> <td><h4><%=actor.getCalificacion()%></h4></td><td><h3>Pendiente</h3></td><td><img src="<%=actor.getFoto()%>" style="height: 100px; width: 80px"></td>
    </tr>
    </tbody>
</table>

<br>
<table>
    <thead>
    <tr>
        <td><h3>Película</h3></td><td><h3>Director</h3></td><td><h3>Puntaje</h3></td><td><h3>Clasificación</h3></td>  <td><h3>Foto</h3></td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><h4><%=director.getbPelicula().getNombre()%></h4></td><td><h3><%=director.getNombre()%> <%=director.getApellido()%></h3></td><td><h3><%=director.getCalificacion()%></h3></td><td><h3>Pendiente</h3></td> <td><img src="<%=director.getFoto()%>" style="height: 100px; width: 80px"></td>
    </tr>

    </tbody>
</table>
</body>
</html>
