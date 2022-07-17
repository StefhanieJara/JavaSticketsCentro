<%@ page import="com.example.javasticketscentro.Beans.BFuncion" %><%--
  Created by IntelliJ IDEA.
  User: david
  Date: 3/07/2022
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>

<html>
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Estadisticas</title>
    <%session.removeAttribute("nombrefil");session.removeAttribute("apellidofil");%>
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

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="assets/css_2/bootstrap.css" rel='stylesheet' type='text/css' />

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
                <a href="<%=request.getContextPath()%>/indexOperadorServlet"><img src="img/logo.png" with="188px" height="97px"/></a>
            </a>
        </div>

        <!--Espacio-->
        <div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0"></div>
        <!--Espacio-->

        <!--Menú cine-->
        <div
                class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <button
                    class="btn"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasWithBackdrop"
                    aria-controls="offcanvasWithBackdrop"
                    style="color: #fff">
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
                                    src="<%=(clienteLog.getFoto()!=null? (clienteLog.getFoto().contains("http") ?clienteLog.getFoto() :request.getContextPath()+"/UsuarioEditaPerfilServlet?action=entregarImagen"): "")%>"
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
                                        href="<%=request.getContextPath()%>/OperadorFuncionesServlet"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Gestione Funciones</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/peliculaVisualizacionServlet"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Gestione Películas</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/operador_estadisticasServlet"
                                        class="text-dark text-decoration-none">
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Visualizar Estadísticas</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/UsuarioEditaPerfilServlet"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-user-edit" aria-hidden="true"></i></span>
                                    <span>Editar Perfil</span>
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



<main>

    <div class="card-header mt-5 mb-4"></div>

    <!--Pestañas visualización y gestión-->
    <ul class="nav nav-tabs nav-fill mb-4 justify-content-around px-5">
        <li class="nav-item">
            <a class="nav-link text-white active" aria-current="page" href="#"
            ><h1>Estadísticas</h1></a
            >
        </li>
    </ul>

    <div class="row g-4 py-5 row-cols-1 row-cols-lg-3 ">

        <div class="col d-flex align-items-start">
            <div>
                <div
                        class="card-header h-100 shadow border-0 text-white "
                        style="
                      background-image: url('https://res.cloudinary.com/dytz5evzl/image/upload/v1658071950/Sala_cine_d9e72b.jpg');
                      background-size: cover;
                      height: 600px;
                      width: 600px;
                    "
                >
                    <h2>Funciones</h2>
                    <p>En esta seccion para una mejor gestion de salas es importante </p>
                    <p>conocer el porcentaje de asistencia de las peliculas proyectadas</p>
                    <p>las cuales podras filtrar por fecha de inicio y fin.</p>
                    <a href="<%=request.getContextPath()%>/operador_estadisticasServlet?action=listar1"
                       type="button"
                       class="btn btn-danger border-start-1"
                    ><b>Visualizar</b></a>
                </div>
            </div>


        <div class="col" style="width: 250px"></div>
            <div class="col d-flex align-items-start">

                <div>
                    <div
                            class="card-header h-100 shadow border-0 text-white"
                            style="
                      background-image: url('https://res.cloudinary.com/dytz5evzl/image/upload/v1658071949/hottest-films_fkhyg9.jpg');
                      background-size: cover;
                      height: 600px;
                      width: 600px;
                    "
                    >
                        <h2>Vistas</h2>
                        <p>En las salas de cine podemos observar que hay grandes exitos de taquilla</p>
                        <p>Esta seccion muestra las funcion mas vista y la sede donde se proyecto</p>
                        <p>las cuales podras filtrar por fecha de inicio y fin.</p>
                        <a href="<%=request.getContextPath()%>/operador_estadisticasServlet?action=listar2"
                           type="button"
                           class="btn btn-danger border-start-1"
                        ><b>Visualizar</b></a>
                    </div>
                </div>
            </div>
    </div>
    </div>

    <div class="row g-4 py-5 row-cols-1 row-cols-lg-3 ">
    <div class="col d-flex align-items-start">

                    <div>
                        <div
                                class="card-header h-100 shadow border-0 text-white"
                                style="
                      background-image: url('https://res.cloudinary.com/dytz5evzl/image/upload/v1658071947/coda-gana-oscar-reuters_emwreu.jpg');
                      background-size: cover;
                      height: 600px;
                      width: 600px;
                    "
                        >
                            <h2>Películas</h2>
                            <p>Puedes encontrar la pelicula mejor calificada y buscar por género</p>
                            <p>mostrando una clasificación en base a estrellas que es la media</p>
                            <p>de valoraciones asi como el listado de películas.</p>
                            <a href="<%=request.getContextPath()%>/operador_estadisticasServlet?action=listar3"
                               type="button"
                               class="btn btn-danger border-start-1"
                            ><b>Visualizar</b></a>
                        </div>
                    </div>
        <div class="col" style="width: 250px"></div>
    <div/>
                    <div class="col d-flex align-items-start">

                        <div>
                            <div
                                    class="card-header h-100 shadow border-0 text-white"
                                    style="
                      background-image: url('https://res.cloudinary.com/dytz5evzl/image/upload/v1658071948/735b8d8c-ef56-420b-bf66-2ddb1b7e6887_alta-libre-aspect-ratio_default_0_uj9sdq.jpg');
                      background-size: cover;
                      height: 600px;
                      width: 600px;
                    "
                            >
                                <h2>Actores y Directores</h2>
                                <p>Puedes encontrar las celebridades mejores calificadas por nuestros usuarios</p>
                                <p>mostrando una clasificación en base a estrellas que representa la media de </p>
                                <p>clasificación de actores y directores de los filmes proyectados por JavaSticket.</p>
                                <a href="<%=request.getContextPath()%>/operador_estadisticasServlet?action=listar4"
                                   type="submit"
                                   class="btn btn-danger border-start-1"
                                ><b>Visualizar</b></a>
                            </div>
                        </div>

                    </div>
    </div>
    <div/>

</main>
</div>


<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>