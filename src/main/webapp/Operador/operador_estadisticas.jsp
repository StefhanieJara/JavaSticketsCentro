<%@ page import="com.example.javasticketscentro.Beans.BFuncion" %><%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 05/06/2022
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaAsistencia" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="listaGenero" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="masVista" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="menosVista" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="peliculaMejorCalificada" scope="request" type="com.example.javasticketscentro.Beans.BPelicula"/>
<jsp:useBean id="actorMejorCalificado" scope="request" type="com.example.javasticketscentro.Beans.BCelebridad"/>
<jsp:useBean id="directorMejorCalificado" scope="request" type="com.example.javasticketscentro.Beans.BCelebridad"/>
<html>
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PUCP - Estadisticas</title>
    <meta charset="utf-8">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="assets/css_2/easy-responsive-tabs.css" rel='stylesheet' type='text/css' />
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
    <style>
        .checked {
            color: orange;
        }


        #main-container{
            margin: 150px auto;
            width: 600px;
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
    </style>

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
                <a href="indexOperador.html"><img src="img/logo.png" /></a>
            </a>
        </div>


        <div
                class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end"
        ></div>
        <div
                class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0"
        >
            <button
                    class="btn"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasWithBackdrop"
                    aria-controls="offcanvasWithBackdrop"
                    style="color: #ffffff"
            >
                <div style="font-size: 0.62rem">
                    <i class="fas fa-user-circle fa-3x"></i>
                </div>
            </button>
        </div>
        <!--Boton atras-->
        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <button class="btn" type="button" style=" color: white">
                <div style="font-size: 0.62rem">
                    <a href="<%=request.getContextPath()%>/indexOperadorServlet"></a>
                    <i class="fa fa-caret-square-o-left fa-3x" style='color: #fff'></i>
                </div>
            </button>
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
                        <h4 class="mb-3">Rex Campos Díaz</h4>
                        <img
                                src="img/images.png"
                                class="rounded-circle mx-auto d-block mb-3 h-25 w-50"
                                alt="profile image"
                        />
                    </div>
                    <div class="mb-3">
                        <div class="p-2">
                            <a
                                    href="personal.html"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-list"></i></span>
                                <span>Gestione Personal</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a
                                    href="peliculaVisualizacion.html"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-list"></i></span>
                                <span>Gestione Funciones</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a
                                    href="visualizacionOperadores.html"
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
                <a href="#" class="text-dark text-decoration-none">
                    <span><i class="fas fa-sign-out-alt"></i></span>
                    <span>Cerrar sesión</span>
                </a>
            </div>
        </div>
    </div>
</div>
<section class="banner-bottom-wthreelayouts py-lg-5 py-3">
    <div class="container">
        <div class="inner-sec-shop px-lg-4 px-3">
            <h3 class="tittle-w3layouts my-lg-4 mt-3"> Resumen de Estadísticas</h3>
            <!--/tabs-->
            <div class="responsive_tabs">
                <div id="horizontalTab">
                    <ul class="resp-tabs-list">
                        <li>Funciones</li>
                        <li>Vistas</li>
                        <li>Pelicula</li>
                        <li>Actores y Directores</li>
                    </ul>
                    <div class="resp-tabs-container">
                        <!--/tab_one-->
                        <div class="tab1">
                            <div class="pay_info">
                                <div class="vertical_post check_box_agile">
                                    <div class="container-fluid" >

                                        <FONT FACE="impact" SIZE=6 COLOR="red">
                                            Porcentaje de pelicula más asistida
                                        </FONT></br>

                                        <div class="row justify-content-start">
                                            <div class="col-3">
                                                <br>
                                                <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar" >
                                                    <label> Fecha de inicio</label>
                                                    <input type="date" name="date1">

                                                    <label> Fecha de fin </label>
                                                    <input type="date" name="date2">

                                                    <button type="submit" class="btn btn-danger">Filtrar</button>
                                                </form>



                                            </div>
                                            <%int cont = 0;%>
                                            <div class="col-6">
                                                <table >
                                                    <thead>
                                                    <tr>
                                                        <td><h2>Porcentaje</h2></td><td><h2>Pelicula</h2></td><td><h2>Sede</h2></td><td><h2>Sala</h2></td>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
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
                                                        </td><td><%=funcion.getbPelicula().getNombre()%></td><td><%=funcion.getbSede().getNombre()%></td><td><%=funcion.getbSala().getNumero()%></td>

                                                    </tr>
                                               <% }%>
                                                    </tbody>

                                                </table>
                                            </div>
                                        </div><br>
                                        <FONT FACE="impact" SIZE=6 COLOR="red">
                                            Genero por pelicula
                                        </FONT></br>
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
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!--//tab_one-->
                        <div class="tab2">
                            <div class="pay_info">
                                <FONT FACE="impact" SIZE=6 COLOR="red">
                                    Función más vista
                                </FONT></br>
                                <div class="row justify-content-start">
                                    <div class="col-3">
                                        <br>
                                        <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar" >
                                            <label> Fecha de inicio</label>
                                            <input type="date" name="date1" >

                                            <label> Fecha de fin </label>
                                            <input type="date" name="date2" >

                                            <button type="submit" class="btn btn-danger">Filtrar</button>
                                        </form>


                                    </div>
                                    <div class="col-8">
                                        <table >
                                            <thead>
                                            <tr>
                                                <td><h2>Pelicula</h2></td><td><h2>Sede</h2></td><td><h2>Sala</h2></td>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <%for (BFuncion vista: masVista){%>
                                            <tr>
                                                <td><h2><%=vista.getbPelicula().getNombre()%></h2></td><td><h2><%=vista.getbSede().getNombre()%></h2></td><td><h2><%=vista.getbSala().getNumero()%></h2></td>
                                            </tr>
                                            <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <FONT FACE="impact" SIZE=6 COLOR="red">
                                    Función menos vista
                                </FONT></br>
                                <div class="row justify-content-start">
                                    <div class="col-3">
                                        <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar" >
                                            <label> Fecha de inicio</label>
                                            <input type="date" name="date1">

                                            <label> Fecha de fin </label>
                                            <input type="date" name="date2">

                                            <button type="submit" class="btn btn-danger">Filtrar</button>
                                        </form>

                                    </div>
                                    <div class="col-8">
                                        <table >
                                            <thead>
                                            <tr>
                                                <td><h2>Pelicula</h2></td><td><h2>Sede</h2></td><td><h2>Sala</h2></td>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <%for (BFuncion vista: menosVista){%>
                                            <tr>
                                                <td><h2><%=vista.getbPelicula().getNombre()%></h2></td><td><h2><%=vista.getbSede().getNombre()%></h2></td><td><h2><%=vista.getbSala().getNumero()%></h2></td>
                                            </tr>
                                            <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="tab3">

                            <div class="pay_info">
                                <div class="row justify-content-around">
                                    <div class="col-sm-5">
                                        <FONT FACE="impact" SIZE=6 COLOR="red">
                                            Pelicula mejor calificada
                                        </FONT></br>

                                        <div class="row justify-content-start">
                                            <div class="col-3">
                                                <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar" >
                                                    <label> Fecha de inicio</label>
                                                    <input type="date" name="date1">

                                                    <label> Fecha de fin </label>
                                                    <input type="date" name="date2">

                                                    <button type="submit" class="btn btn-danger">Filtrar</button>
                                                </form>
                                            </div>

                                        </div>

                                        <table >
                                            <thead>
                                            <tr>
                                                <td><h2>Pelicula</h2></td><td><h2>Calificación</h2></td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><h2><%=peliculaMejorCalificada.getNombre()%></h2></td><td><h2><%=peliculaMejorCalificada.getCalificacionPelicula()%></h2></td>
                                            </tr>

                                            </tbody>
                                        </table>

                                    </div>
                                    <div class ="col-4">
                                        <img src="<%=peliculaMejorCalificada.getFoto()%>" style="height: 400px; width: 250px">
                                    </div>
                                    <div class="col-2">
                                        <FONT FACE="impact" SIZE=6 COLOR="red">
                                            Premiaciones
                                        </FONT><br>


                                        <table >

                                            <tr>
                                                <td>Cannes</td><td>2</td>
                                            </tr>
                                            <tr>
                                                <td>Oscar</td><td>3</td>
                                            </tr>
                                            <tr>
                                                <td>Malaga</td><td>1</td>
                                            </tr>
                                            <tr>
                                                <td>Annie</td><td>2</td>
                                            </tr>

                                        </table>
                                    </div>
                                </div>


                            </div>


                        </div>






                        <div class="tab4">
                            <div class="pay_info">
                                <FONT FACE="impact" SIZE=6 COLOR="red">
                                    Actor/Actriz mejor calificado
                                </FONT><br> <br>

                                <label>Película</label>
                                <div class="row align-items-start">
                                    <div class="col-2">
                                        <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar" >
                                            <label> Fecha de inicio</label>
                                            <input type="date" name="date1">

                                            <label> Fecha de fin </label>
                                            <input type="date" name="date2" >

                                            <button type="submit" class="btn btn-danger">Filtrar</button>
                                        </form>

                                    </div>



                                    <div class="col-8">
                                        <table >
                                            <thead>
                                            <tr>
                                                <td><h2>Actor</h2></td><td><h2>Calificación</h2></td><td>Foto</td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><h2><%=actorMejorCalificado.getNombre()%></h2></td><td><h2><%=actorMejorCalificado.getCalificacion()%></h2></td><td><img src="<%=actorMejorCalificado.getFoto()%>" style="height: 100px; width: 80px"></td>
                                            </tr>

                                            </tbody>

                                        </table>
                                    </div>
                                </div>



                                <br><br>

                                <FONT FACE="impact" SIZE=6 COLOR="red">
                                    Director(a) mejor calificado
                                </FONT><br><br>

                                <div class="row align-items-start">
                                    <div class="col-3">
                                        <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar" >
                                            <label> Fecha de inicio</label>
                                            <input type="date" name="date1">

                                            <label> Fecha de fin </label>
                                            <input type="date" name="date2">

                                            <button type="submit" class="btn btn-danger">Filtrar</button>
                                        </form>
                                    </div>


                                    <div class="col-8">
                                        <table >
                                            <thead>
                                            <tr>
                                                <td><h2>Director</h2></td><td><h2>Calificación</h2></td><td>Foto</td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><h2><%=directorMejorCalificado.getNombre()%></h2></td><td><h2><%=directorMejorCalificado.getCalificacion()%></h2></td><td><img src="<%=directorMejorCalificado.getFoto()%>" style="height: 100px; width: 80px"></td>
                                            </tr>

                                            </tbody>

                                        </table>
                                    </div>
                                </div>




                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--//tabs-->
    </div>

    </div>

</section>
<!-- easy-responsive-tabs -->
<script src="assets/jquery-2.2.3.min.js"></script>
<script src="assets/easy-responsive-tabs.js"></script>
<script>
    $(document).ready(function () {
        $('#horizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
        $('#verticalTab').easyResponsiveTabs({
            type: 'vertical',
            width: 'auto',
            fit: true
        });
    });
</script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>