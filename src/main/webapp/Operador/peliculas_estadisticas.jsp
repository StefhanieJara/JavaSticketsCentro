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

<%double contador;
double puntajeX=0;
boolean existe=false;
double puntaje = pelicula.getCalificacionPelicula();%>
<html>
<head>
    <title>Estadisticas - Peliculas</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/stars1.css" />
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
    <style>


        .yellow-color {
            color:#EABE3F;
        }


    </style>
</head>
<body>

<%
    for(contador=0; contador<5; contador++){
        double su = puntaje-contador;
        System.out.println(su);

        if(su<0.4 && su <=1 && su >=0){
            puntajeX = Math.floor(puntaje);
            existe = false;
        }else{if(su>0.6){
            puntajeX = Math.ceil(puntaje);
            existe = false;
        }else{if(su>=0.4 && su <=0.6){
            puntajeX = Math.floor(puntaje);
            existe = true;

        }
        }
        }
    }%>
<table>
    <thead>
    <tr>
        <td><h3>Pelicula mejor calificada</h3></td><td><h3>Puntaje</h3></td><td><h3>Clasificación</h3></td><td><h3>Foto</h3></td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><h3><%=pelicula.getNombre()%></h3></td><td><h3><%=pelicula.getCalificacionPelicula()%></h3></td>
        <td>

            <%for (contador=0; contador<puntajeX; contador++){%>
            <i class='fa fa-star yellow-color' style="font-size:45px;"></i>
            <%}%>

            <%if(existe){%>
            <i class='fa fa-star-half-full yellow-color' style="font-size:45px;"></i>
                    <%puntajeX++;
            }%>

            <%for (contador=0; contador<5-puntajeX; contador++){%>
            <i class='fa fa-star-o yellow-color' style="font-size:45px;"></i>
            <%}%>

        </td>
        <td><img src="<%=pelicula.getFoto()%>" style="max-height:200px; max-width: 100px"></td>
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
