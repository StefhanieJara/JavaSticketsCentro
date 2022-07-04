<%@ page import="com.example.javasticketscentro.Beans.BFuncion" %><%--
  Created by IntelliJ IDEA.
  User: david
  Date: 3/07/2022
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaAsistencia" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>" class="java.util.ArrayList"/>
<jsp:useBean id="listaGenero" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>" class="java.util.ArrayList"/>
<jsp:useBean id="masVista" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>" class="java.util.ArrayList"/>
<jsp:useBean id="menosVista" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>" class="java.util.ArrayList"/>
<jsp:useBean id="peliculaMejorCalificada" scope="request" type="com.example.javasticketscentro.Beans.BPelicula" class="com.example.javasticketscentro.Beans.BPelicula"/>
<jsp:useBean id="actorMejorCalificado" scope="request" type="com.example.javasticketscentro.Beans.BCelebridad" class="com.example.javasticketscentro.Beans.BCelebridad"/>
<jsp:useBean id="directorMejorCalificado" scope="request" type="com.example.javasticketscentro.Beans.BCelebridad" class="com.example.javasticketscentro.Beans.BCelebridad"/>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<jsp:useBean id="fecha1" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha2" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha3" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha4" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha5" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha6" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha7" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha8" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha9" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha10" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha11" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha12" scope="request" type="java.lang.String" class="java.lang.String"/>
<html>
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Estadisticas</title>

    <style>
        .container {
            padding-right: 0 !important;
            padding-left: 0 !important;
        }

        .titlecolor {
            background: linear-gradient(0deg, #1d1d1d 0%, #525252 100%);
        }

        .navbar {
            position: fixed;
            width: 100%;
            padding: 30px 10px;
            background-color: rgb(0, 0, 0);
        }

        body{
            font-family: Arial;
        }
        #main-container{
            margin: 10px ;
            width: 1200px;
        }



        .btn {
            display: inline-block;
            font-weight: 400;
            line-height: 1.5;
            color: white;
            text-align: center;
            text-decoration: none;
            vertical-align: middle;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
            background-color: transparent;
            border: 1px solid transparent;
            padding: .375rem .75rem;
            font-size: 1rem;
            border-radius: .25rem;
            transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out
        }


        .btn-tele {
            border-color: #000000FF;
            background-color: #000000FF;
            color: white;
        }

        .btn-tele:hover {
            color: #fff;
            background-color:#525252;
            border-color: #000000FF;
        }

        th, td{
            padding: 20px;
        }


        tr:nth-child(even){
            background-color: #ddd;
        }

        tr:hover td{
            background-color: #a35353;
            color: white;
        }

        .btn-check:focus + .btn-tele,
        .btn-tele:focus {
            color: #fff;
            background-color: #525252;
            border-color: #090909;
            box-shadow: 0 0 0 0.2rem #000000FF;
        }

        .btn-check:active + .btn-tele,
        .btn-check:checked + .btn-tele,
        .btn-tele.active,
        .btn-tele:active,
        .show > .btn-tele.dropdown-toggle {
            color: #fff;
            background-color: #000000FF;
            border-color: #000000FF;
        }

        .btn-check:active + .btn-tele:focus,
        .btn-check:checked + .btn-tele:focus,
        .btn-tele.active:focus,
        .btn-tele:active:focus,
        .show > .btn-tele.dropdown-toggle:focus {
            box-shadow: 0 0 0 0.2rem #000000FF;
        }

        .btn-tele.disabled,
        .btn-tele:disabled {
            color: #fff;
            border-color: #000000FF;
            background-color: #000000FF;
        }

        .btn-tele-inverso {
            background-color: white;
            color: #000000FF;
        }

        .btn-tele-inverso:hover {
            color: #000000FF;
        }

        .btn-check:focus + .btn-tele-inverso,
        .btn-tele-inverso:focus {
            color: #000000FF;
        }

        .btn-check:active + .btn-tele-inverso,
        .btn-check:checked + .btn-tele-inverso,
        .btn-tele-inverso.active,
        .btn-tele-inverso:active,
        .show > .btn-tele-inverso.dropdown-toggle {
            color:#000000FF;
        }

        .btn-check:active + .btn-tele-inverso:focus,
        .btn-check:checked + .btn-tele-inverso:focus,
        .btn-tele-inverso.active:focus,
        .btn-tele-inverso:active:focus,
        .show > .btn-tele-inverso.dropdown-toggle:focus {
            box-shadow: 0 0 0 0.2rem #000000FF;
        }

        /*Desactivar sombra de botones*/

        .btn:focus,
        .btn:active,
        .page-link:focus {
            box-shadow: none !important;
            outline: 0;
        }

        .delete0 {

            Background: #dddddd;
            width:50%;
            color:#000;
            font-family: Arial;
            font-size: 18px;
            text-align:center;
            padding: 33px;
            min-height: 300px;
            border-radius: 10px;
            left:25%;
            top:100px;
            position: fixed;
            display: none;
        }

        .delete1 {

            Background: #dddddd;
            width:50%;
            color:#000;
            font-family: Arial;
            font-size: 18px;
            text-align:center;
            padding: 33px;
            min-height: 300px;
            border-radius: 10px;
            left:25%;
            top:100px;
            position: fixed;
            display: none;
        }
        .delete2 {

            Background: #dddddd;
            width:50%;
            color:#000;
            font-family: Arial;
            font-size: 18px;
            text-align:center;
            padding: 33px;
            min-height: 300px;
            border-radius: 10px;
            left:25%;
            top:100px;
            position: fixed;
            display: none;
        }

        .delete3 {

            Background: #dddddd;
            width:50%;
            color:#000;
            font-family: Arial;
            font-size: 18px;
            text-align:center;
            padding: 33px;
            min-height: 300px;
            border-radius: 10px;
            left:25%;
            top:100px;
            position: fixed;
            display: none;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="assets/css_2/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="assets/css_2/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="assets/css_2/grafico_style.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="assets/css/estilos.css" />
    <script
            src="https://kit.fontawesome.com/5733880de3.js"
            crossorigin="anonymous"
    ></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<nav
        class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger"
>
    <div
            class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2"
    >
        <div
                class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2"
        >
            <a class="navbar-brand py-0" href="#">
                <a href="<%=request.getContextPath()%>/indexOperadorServlet"><img src="img/logo.png" /></a>
            </a>
        </div>

        <!--Espacio-->
        <div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0"></div>
        <!--Espacio-->

        <!--Menú cine-->
        <div
                class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0"
        >
            <button
                    class="btn"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasWithBackdrop"
                    aria-controls="offcanvasWithBackdrop"
                    style="color: #fff"
            >
                <div style="font-size: 0.62rem">
                    <i class="fas fa-user-circle fa-3x"></i>
                </div>
            </button>
        </div>
        <!--Boton retornar-->
        <div
                class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex">
            <a
                    class="btn btn-tele-inverso"
                    role="button"
                    href="<%=request.getContextPath()%>/indexOperadorServlet"
            >
                <div style="font-size: 0.6rem">
                    <!--para cambios más precisos del tamaño-->
                    <i class="fa fa-caret-square-o-left fa-3x"></i>
                </div>
            </a>
        </div>
    </div>
</nav>
<div
        class="offcanvas offcanvas-end text-center"
        tabindex="-1"
        id="offcanvasWithBackdrop"
        aria-labelledby="offcanvasWithBackdropLabel"
>
    <div class="d-flex align-items-center flex-column mb-3 vh-100">
        <div class="p-2 w-100">
            <div class="offcanvas-header border-bottom">
                <h5 class="mb-0">Menú de Operador</h5>
                <button
                        type="button"
                        class="btn-close text-reset"
                        data-bs-dismiss="offcanvas"
                        aria-label="Close"
                ></button>
            </div>
        </div>
        <div class="p-2">
            <div class="offcanvas-body p-3">
                <div class="d-flex flex-column">
                    <div class="my-2">
                        <h4 class="mb-3"><%=clienteLog.getNombre()+" "+clienteLog.getApellido()%></h4>
                        <img
                                src="<%=clienteLog.getFoto()%>"
                                class="rounded-circle mx-auto d-block mb-3 h-25 w-50"
                                alt="profile image"
                        />
                    </div>
                    <div class="mb-3">
                        <div class="p-2">
                            <a
                                    href="<%=request.getContextPath()%>/personalServlet"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-list"></i></span>
                                <span>Gestione Personal</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a
                                    href="<%=request.getContextPath()%>/peliculaVisualizacionServlet"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-list"></i></span>
                                <span>Gestione Funciones</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a
                                    href="<%=request.getContextPath()%>/operador_estadisticasServlet"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-list"></i></span>
                                <span>Visualizar Estadísticas</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-auto p-2 w-100">
            <div class="offcanvas-body border-top pt-4">
                <a href="<%=request.getContextPath()%>/UsuariologinclientServlet?action=logout" class="text-dark text-decoration-none">
                    <span><i class="fas fa-sign-out-alt"></i></span>
                    <span>Cerrar sesión</span>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="container px-4 py-5" id="icon-grid">


<br>
    <br>
    <br><br>
    <h2 class="pb-2 border-bottom">Estadísticas</h2>
    <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
        <div class="col d-flex align-items-start">

            <div>
                <h2>Funciones</h2>
                <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
                <a href="javascript:abrir0()"
                   type="button"
                   class="btn btn-danger border-start-1"
                ><b>Visualizar</b></a>
            </div>
        </div>
        <div class="col d-flex align-items-start">

            <div>
                <h2>Vistas</h2>
                <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
                <a href="javascript:abrir1()"
                   type="button"
                   class="btn btn-danger border-start-1"
                ><b>Visualizar</b></a>
            </div>
        </div>
        <div class="col d-flex align-items-start">

            <div>
                <h2>Peliculas</h2>
                <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
                <a href="javascript:abrir2()"
                   type="button"
                   class="btn btn-danger border-start-1"
                ><b>Visualizar</b></a>
            </div>
        </div>
        <div class="col d-flex align-items-start">

            <div>
                <h2>Actores y Directores</h2>
                <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
                <a href="javascript:abrir3()"
                   type="submit"
                   class="btn btn-danger border-start-1"
                ><b>Visualizar</b></a>
            </div>
        </div>
    </div>


</div>

<div class="delete0" id="dele0">
    <div id="cerrar0"><a href="javascript:cerrar0()">X</a></div>



        <div class="modal-body" >
            <div  class="cold md" >
                <h3>Porcentaje de asistencia por función</h3>
                <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar1">
                <label> Fecha de inicio</label>
                <input type="date" name="date1" value="<%=fecha1%>" >

                <label> Fecha de fin </label>
                <input type="date" name="date2" value="<%=fecha2%>" >

                <button type="submit" class="btn btn-danger">Filtrar</button>

                </form>
                <div class="table-responsive">
                    <table >
                        <thead>
                        <tr>
                            <td><h2>Porcentaje</h2></td><td><h2>Pelicula</h2></td><td><h2>Sede</h2></td><td><h2>Sala</h2></td>
                        </tr>
                        </thead>
                        <tbody>
                        <%if(session.getAttribute("msg1")!=null){%>
                        <tr>
                            <td></td><td><div class="alert alert-danger" role="alert"><%=session.getAttribute("msg1")%></div></td><td></td><td></td>
                        </tr>
                        <%session.removeAttribute("msg1");
                        }else{%>

                        <%for(BFuncion funcion: listaAsistencia){
                        %>

                        <tr>
                            <td>
                                <div class="progress">
                                    <div

                                            class="progress-bar bg-danger"
                                            role="progressbar"
                                            style="width: <%=funcion.getAsistencia()%>%"
                                            aria-valuenow="<%=funcion.getAsistencia()%>"
                                            aria-valuemin="0"
                                            aria-valuemax="100"
                                    ><%=funcion.getAsistencia()%>
                                    </div>
                                </div>
                            </td><td><center> <%=funcion.getbPelicula().getNombre()%></center></td><td><center> <%=funcion.getbSede().getNombre()%></center></td><td><center> <%=funcion.getbSala().getNumero()%></center></td>

                        </tr>
                        <%}%>
                        <%}%>
                        </tbody>

                    </table>
                </div>
                <h3>Lista de generos</h3>
                <table >
                    <thead>
                    <tr>
                        <td><h2>Pelicula</h2></td><td><h2>Género</h2></td>
                    </tr>
                    </thead>
                    <tbody>
                    <%for (BFuncion genero: listaGenero){%>
                    <tr>
                        <td><h3><%=genero.getbPelicula().getNombre()%></h3></td><td><h3><%=genero.getbPelicula().getGenero()%></h3></td>
                    </tr>
                    <%}%>
                    </tbody>

                </table>
            </div></div>


</div>
<script>
    function abrir0() {
        document.getElementById("dele0").style.display="block";
    }
    function cerrar0() {
        document.getElementById("dele0").style.display="none";
    }
</script>

<div class="delete1" id="dele1">
    <div id="cerrar1"><a href="javascript:cerrar1()">X</a></div>
    <h3>Más vista</h3>
    <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar2">
        <div class="modal-body" >
            <label> Fecha de inicio</label>
            <input type="date" name="date3" value="<%=fecha3%>" >

            <label> Fecha de fin </label>
            <input type="date" name="date4" value="<%=fecha4%>" >

            <button type="submit" class="btn btn-danger">Filtrar</button>

           </div>
    </form>
    <table >
        <thead>
        <tr>
            <td><h2>Pelicula</h2></td><td><h2>Sede</h2></td><td><h2>Sala</h2></td>
        </tr>
        </thead>

        <tbody>
        <%if(session.getAttribute("msg2")!=null){%>
        <tr>
            <td></td><td><div class="alert alert-danger" role="alert"><%=session.getAttribute("msg2")%></div></td><td></td>
        </tr>
        <%session.removeAttribute("msg2");
        }else{%>
        <%for (BFuncion vista: masVista){%>
        <tr>
            <td><h3><center><%=vista.getbPelicula().getNombre()%></center></h3></td><td><h3><center> <%=vista.getbSede().getNombre()%></center></h3></td><td><h3><center><%=vista.getbSala().getNumero()%></center> </h3></td>
        </tr>
        <%}%>
        <%}%>
        </tbody>
    </table>
    <br>
    <h3>Menos vista</h3>
    <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar3">
        <div class="modal-body" >
            <label> Fecha de inicio</label>
            <input type="date" name="date5" value="<%=fecha5%>" >

            <label> Fecha de fin </label>
            <input type="date" name="date6" value="<%=fecha6%>">

            <button type="submit" class="btn btn-danger">Filtrar</button>

        </div>
    </form>
    <table >
        <thead>
        <tr>
            <td><h2>Pelicula</h2></td><td><h2>Sede</h2></td><td><h2>Sala</h2></td>
        </tr>
        </thead>

        <tbody>
        <%if(session.getAttribute("msg3")!=null){%>
        <tr>
            <td></td><td><div class="alert alert-danger" role="alert"><%=session.getAttribute("msg3")%></div></td><td></td>
        </tr>
        <%session.removeAttribute("msg3");
        }else{%>
        <%for (BFuncion vista: menosVista){%>
        <tr>
            <td><h3><center><%=vista.getbPelicula().getNombre()%></center> </h3></td><td><h3><center><%=vista.getbSede().getNombre()%></center> </h3></td><td><h3><center><%=vista.getbSala().getNumero()%></center> </h3></td>
        </tr>
        <%}%>
        <%}%>
        </tbody>
    </table>
</div>
</div>
<script>
    function abrir1() {
        document.getElementById("dele1").style.display="block";
    }
    function cerrar1() {
        document.getElementById("dele1").style.display="none";
    }
</script>

<div class="delete2" id="dele2">
    <div id="cerrar2"><a href="javascript:cerrar2()">X</a></div>
    <h3>Mejor calificada</h3>
    <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar4">
        <div class="modal-body" >
            <label> Fecha de inicio</label>
            <input type="date" name="date7" value="<%=fecha7%>" >

            <label> Fecha de fin </label>
            <input type="date" name="date8" value="<%=fecha8%>">

            <button type="submit" class="btn btn-danger">Filtrar</button>
        </div>
    </form>
    <table >
        <thead>
        <tr>
            <td><h2>Pelicula</h2></td><td><h2>Calificación</h2></td>
        </tr>
        </thead>
        <tbody>
        <%if(peliculaMejorCalificada.getCalificacionPelicula()==0){%>
        <tr>
            <td></td><td><div class="alert alert-danger" role="alert">Esta pelicula no ha sido calificada aún</div></td>
        </tr>
        <%}else{%>
        <%if(session.getAttribute("msg4")!=null){%>
        <tr>
            <td><div class="alert alert-danger" role="alert"><%=session.getAttribute("msg4")%></div></td>
        </tr>
        <%
        }else{%>

        <tr>
            <td><h2><%=peliculaMejorCalificada.getNombre()%></h2></td><td><h2><%=peliculaMejorCalificada.getCalificacionPelicula()%></h2></td>
        </tr>
        <%}%>
        <%}%>
        </tbody>
    </table>
    <%if(peliculaMejorCalificada.getCalificacionPelicula()==0){%>
    <div class="alert alert-danger" role="alert">Imagen no encontrada</div>
    <%}else{%>
    <%if(session.getAttribute("msg4")!=null){%>
    <div class="alert alert-danger" role="alert">No se ha encontrado imagen</div>
    <%session.removeAttribute("msg4");
    }else{%>

    <img src="<%=peliculaMejorCalificada.getFoto()%>" style="max-height: 200px; max-width: 150px">
    <%}%>
    <%}%>
</div>
<script>
    function abrir2() {
        document.getElementById("dele2").style.display="block";
    }
    function cerrar2() {
        document.getElementById("dele2").style.display="none";
    }
</script>

<div class="delete3" id="dele3">
    <div id="cerrar3"><a href="javascript:cerrar3()">X</a></div>
    <h3>Mejor calificado</h3>
    <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar5">
        <div class="modal-body" >
            <label> Fecha de inicio</label>
            <input type="date" name="date9" value="<%=fecha9%>" >

            <label> Fecha de fin </label>
            <input type="date" name="date10" value="<%=fecha10%>">

            <button type="submit" class="btn btn-danger">Filtrar</button>
        </div>
    </form>
    <table >
        <thead>
        <tr>
            <td><h2>Actor</h2></td><td><h2>Calificación</h2></td><td><h2>Foto</h2></td>
        </tr>
        </thead>
        <tbody>
        <%if(actorMejorCalificado.getCalificacion()==0){%>
        <tr>
            <td></td><td><div class="alert alert-danger" role="alert">Este actor no ha sido calificado aún</div></td>
        </tr>
        <%}else{%>
        <%if(session.getAttribute("msg5")!=null){%>
        <tr>
            <td></td><td><div class="alert alert-danger" role="alert"><%=session.getAttribute("msg5")%></div></td><td></td>
        </tr>
        <%session.removeAttribute("msg5");
        }else{%>

        <tr>
            <td><h2><%=actorMejorCalificado.getNombre()%> <%=actorMejorCalificado.getApellido()%></h2></td><td><h2><%=actorMejorCalificado.getCalificacion()%></h2></td><td><img src="<%=actorMejorCalificado.getFoto()%>" style="height: 100px; width: 80px"></td>
        </tr>
        <%}%>
        <%}%>
        </tbody>

    </table>
    <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar6" >
        <label> Fecha de inicio</label>
        <input type="date" name="date11" value="<%=fecha11%>" >

        <label> Fecha de fin </label>
        <input type="date" name="date12" value="<%=fecha12%>" >

        <button type="submit" class="btn btn-danger">Filtrar</button>
    </form>
    <table >
        <thead>
        <tr>
            <td><h2>Director</h2></td><td><h2>Calificación</h2></td><td><h2>Foto</h2></td>
        </tr>
        </thead>
        <tbody>
        <%if(directorMejorCalificado.getCalificacion()==0){%>
        <tr>
            <td></td><td><div class="alert alert-danger" role="alert">Este director no ha sido calificado aún</div></td>
        </tr>
        <%}else{%>
        <%if(session.getAttribute("msg6")!=null){%>
        <tr>
            <td></td><td><div class="alert alert-danger" role="alert"><%=session.getAttribute("msg6")%></div></td><td></td>
        </tr>
        <%session.removeAttribute("msg6");
        }else{%>

        <tr>
            <td><h3><%=directorMejorCalificado.getNombre()%> <%=directorMejorCalificado.getApellido()%></h3></td><td><h3><%=directorMejorCalificado.getCalificacion()%></h3></td><td><img src="<%=directorMejorCalificado.getFoto()%>" style="height: 100px; width: 80px"></td>
        </tr>
        <%}%>
        <%}%>
        </tbody>

    </table>
</div>
<script>
    function abrir3() {
        document.getElementById("dele3").style.display="block";
    }
    function cerrar3() {
        document.getElementById("dele3").style.display="none";
    }
</script>


</body>
</html>