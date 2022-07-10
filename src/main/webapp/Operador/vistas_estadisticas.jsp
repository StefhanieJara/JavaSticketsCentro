<%@ page import="com.example.javasticketscentro.Beans.BFuncion" %><%--
  Created by IntelliJ IDEA.
  User: david
  Date: 8/07/2022
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="masVista" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>" class="java.util.ArrayList"/>
<jsp:useBean id="menosVista" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>" class="java.util.ArrayList"/>
<jsp:useBean id="fecha3" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha4" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fechaI" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fechaH" scope="request" type="java.lang.String" class="java.lang.String"/>
<html>
<head>
    <title>Estadisticas - Vistas</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>

<div class="d-flex gap-sm-4 justify-content-center">
    <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar2">
        <div class="modal-body" >
            <label> Fecha de inicio</label>
            <input type="date" name="date3" value="<%=session.getAttribute("fechaI") == null ? fecha3: session.getAttribute("fechaI")%>">
            <%session.removeAttribute("fechaI");%>
            <label> Fecha de fin </label>
            <input type="date" name="date4" value="<%=session.getAttribute("fechaH") == null ? fecha4: session.getAttribute("fechaH")%>" >
            <%session.removeAttribute("fechaH");%>
            <button type="submit" class="btn btn-danger">Filtrar</button>

        </div>
    </form>
</div>
<figure class="text-center">
    <h3>Más vista</h3>
</figure>

<div class="container-md">
        <%if(session.getAttribute("msg2")!=null){%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("msg2")%></div>
        <%session.removeAttribute("msg2");
        }else{%>
    <table class="table table-bordered border-danger">
        <thead>
        <tr>
            <td><h3><center> Película</center></h3></td><td><h3><center>Sede</center></h3></td><td><h3><center>Sala</center></h3></td><td><h3><center>Butacas/Stock</center></h3></td><td><h3><center>Foto</center></h3></td>
        </tr>
        </thead>

        <tbody>
        <%for (BFuncion vista: masVista){%>
        <tr>
            <td><h4><center><%=vista.getbPelicula().getNombre()%></center></h4></td><td><h4><center> <%=vista.getbSede().getNombre()%></center></h4></td><td><h4><center><%=vista.getbSala().getNumero()%></center> </h4></td>
            <td><h4><center><%=vista.getButacas()%>/<%=vista.getStock()%></center></h4></td><td><center><img src="<%=vista.getbPelicula().getFoto()%>" style="max-height:200px; max-width: 100px" ></center></td>
        </tr>
        <%}%>
        </tbody>
    </table>
        <%}%>
</div>
<br>

<figure class="text-center">
    <h3>Menos vista</h3>
</figure>

<div class="container-md">
    <%if(session.getAttribute("msg3")!=null){%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("msg3")%></div>
    <%session.removeAttribute("msg3");
    }else{%>
    <table class="table table-bordered border-danger">
        <thead>
        <tr>
            <td><h3><center>Película</center></h3></td><td><h3><center>Sede</center></h3></td><td><h3><center>Sala</center></h3></td><td><h3><center>Butacas/Stock</center></h3></td><td><h3><center>Foto</center></h3></td>
        </tr>
        </thead>

        <tbody>

        <%for (BFuncion vista: menosVista){%>
        <tr>
            <td><h4><center><%=vista.getbPelicula().getNombre()%></center> </h4></td><td><h4><center><%=vista.getbSede().getNombre()%></center> </h4></td><td><h4><center><%=vista.getbSala().getNumero()%></center> </h4></td>
            <td><h4><center><%=vista.getButacas()%>/<%=vista.getStock()%></center></h4></td><td><center><img  src="<%=vista.getbPelicula().getFoto()%>" style="max-height:200px; max-width: 100px" ></center></td>
        </tr>
        <%}%>

        </tbody>
    </table>
    <%}%>
</div>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
