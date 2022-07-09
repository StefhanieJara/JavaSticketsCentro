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
<%double contador;
    double puntajeX=0;
    boolean existe=false;
    double puntaje1 = actor.getCalificacion();
    double puntaje2 = director.getCalificacion();%>
<html>
<head>
    <title>Estadisticas - Celebridades</title>
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
        double su = puntaje1-contador;
        System.out.println(su);

        if(su<0.4 && su <=1 && su >=0){
            puntajeX = Math.floor(puntaje1);
            existe = false;
        }else{if(su>0.6){
            puntajeX = Math.ceil(puntaje1);
            existe = false;
        }else{if(su>=0.4 && su <=0.6){
            puntajeX = Math.floor(puntaje1);
            existe = true;

        }
        }
        }
    }%>

<h3>Celebridad mejor calificada</h3>

<table>
    <thead>
    <tr>
        <td><h3>Película</h3></td><td><h3>Actor</h3></td><td><h3>Puntaje</h3></td><td><h3>Clasificación</h3></td> <td><h3>Foto</h3></td>
    </tr>
    </thead>
    <tbody>

    <tr>
        <td><h4><%=actor.getbPelicula().getNombre()%></h4></td><td><h4><%=actor.getNombre()%> <%=actor.getApellido()%></h4></td> <td><h4><%=actor.getCalificacion()%></h4></td>
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
        <td><img src="<%=actor.getFoto()%>" style="height: 100px; width: 80px"></td>
    </tr>
    </tbody>
</table>
<%puntajeX = 0;
existe=false;
    for(contador=0; contador<5; contador++){
        double su = puntaje2-contador;
        System.out.println(su);

        if(su<0.4 && su <=1 && su >=0){
            puntajeX = Math.floor(puntaje2);
            existe = false;
        }else{if(su>0.6){
            puntajeX = Math.ceil(puntaje2);
            existe = false;
        }else{if(su>=0.4 && su <=0.6){
            puntajeX = Math.floor(puntaje2);
            existe = true;

        }
        }
        }
    }%>
<br>
<table>
    <thead>
    <tr>
        <td><h3>Película</h3></td><td><h3>Director</h3></td><td><h3>Puntaje</h3></td><td><h3>Clasificación</h3></td>  <td><h3>Foto</h3></td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><h4><%=director.getbPelicula().getNombre()%></h4></td><td><h3><%=director.getNombre()%> <%=director.getApellido()%></h3></td><td><h3><%=director.getCalificacion()%></h3></td>
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
        <td><img src="<%=director.getFoto()%>" style="height: 100px; width: 80px"></td>
    </tr>

    </tbody>
</table>
</body>
</html>
