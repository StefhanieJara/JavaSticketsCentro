<%@ page import="com.example.javasticketscentro.Beans.BFuncion" %><%--
  Created by IntelliJ IDEA.
  User: david
  Date: 8/07/2022
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaAsistencia" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>" class="java.util.ArrayList"/>
<jsp:useBean id="fecha1" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha2" scope="request" type="java.lang.String" class="java.lang.String"/>

<html>
<head>
    <title>Estadisticas - Porcentaje</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<h3>Porcentaje de asistencia por función</h3>
<form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar1">
    <label> Fecha de inicio</label>
    <input type="date" name="date1" value="<%=session.getAttribute("fechaI") == null ? fecha1: session.getAttribute("fechaI")%>"  >
    <%session.removeAttribute("fechaI");%>
    <label> Fecha de fin </label>
    <input type="date" name="date2" value="<%=session.getAttribute("fechaH") == null ? fecha2: session.getAttribute("fechaH")%>"  >
    <%session.removeAttribute("fechaH");%>
    <button type="submit" class="btn btn-danger">Filtrar</button>

</form>
<div class="table-responsive">
        <%if(session.getAttribute("msg1")!=null){%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("msg1")%></div>
        <%session.removeAttribute("msg1");
                    }else{%>
    <table >
        <thead>
        <tr>
            <td><h3>Porcentaje</h3></td><td><center><h3>%</h3></center> </td> <td><center> <h3>Pelicula</h3></center></td><td><center><h3>Sede</h3></center> </td><td><center><h3>Sala</h3></center> </td>
        </tr>
        </thead>
        <tbody>

        <%for(BFuncion funcion: listaAsistencia){%>

        <tr>
            <td>
                <div class="progress">
                    <div

                            class="progress-bar bg-primary"
                            role="progressbar"
                            style="width: <%=funcion.getAsistencia()%>%"
                            aria-valuenow="<%=funcion.getAsistencia()%>"
                            aria-valuemin="0"
                            aria-valuemax="100">
                    </div>
                </div>
            </td><td><h4><%=funcion.getAsistencia()%>
        </h4></td> <td><center><h4> <%=funcion.getbPelicula().getNombre()%></h4></center></td><td><center><h4><%=funcion.getbSede().getNombre()%></h4> </center></td><td><center><h4><%=funcion.getbSala().getNumero()%></h4> </center></td>

        </tr>
        <%}%>

        </tbody>

    </table>
        <%}%>

</body>
</html>
