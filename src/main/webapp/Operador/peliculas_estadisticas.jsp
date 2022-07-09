<%@ page import="com.example.javasticketscentro.Beans.BFuncion" %><%--
  Created by IntelliJ IDEA.
  User: david
  Date: 8/07/2022
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="pelicula" scope="request" type="com.example.javasticketscentro.Beans.BPelicula" class="com.example.javasticketscentro.Beans.BPelicula"/>
<jsp:useBean id="listaGenero" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>" class="java.util.ArrayList"/>
<jsp:useBean id="generos" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>" class="java.util.ArrayList"/>
<jsp:useBean id="filtro" scope="request" type="java.lang.String" class="java.lang.String"/>
<html>
<head>
    <title>Estadisticas - Peliculas</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>

<table>
    <thead>
    <tr>
        <td><h3>Pelicula mejor calificada</h3></td><td><h3>Puntaje</h3></td><td><h3>Clasificación</h3></td><td><h3>Foto</h3></td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><h3><%=pelicula.getNombre()%></h3></td><td><h3><%=pelicula.getCalificacionPelicula()%></h3></td><td><h3>Pendiente</h3></td><td><img src="<%=pelicula.getFoto()%>" style="max-height:200px; max-width: 100px"></td>
    </tr>
    </tbody>
</table>
<br>
<form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar7">
    <select class="form-select form-select-sm" name="filtro" aria-label=".form-select-sm example">
        <option value="Selecciona el género" >Selecciona el género</option>
        <%for(BFuncion gen : generos){%>
        <option value="<%=gen.getbPelicula().getGenero()%>"  <%=gen.getbPelicula().getGenero().equals(filtro) ? "selected" : ""%> ><%=gen.getbPelicula().getGenero()%></option>
        <%}%>
    </select>


    <button type="submit" class="btn btn-danger">Filtrar</button>
</form>
<form  method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=listar8">
<button type="submit" class="btn btn-success">Ver peliculas</button>
</form>
<h4>Lista de generos</h4>
<table >
    <thead>
    <tr>
        <td><h4>Pelicula</h4></td><td><h4>Género</h4></td>
    </tr>
    </thead>
    <tbody>
    <%for (BFuncion genero: listaGenero){%>
    <tr>
        <td><h4><%=genero.getbPelicula().getNombre()%></h4></td><td><h4><%=genero.getbPelicula().getGenero()%></h4></td>
    </tr>
    <%}%>
    </tbody>

</table>
</body>
</html>
