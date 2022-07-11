<%@ page import="com.example.javasticketscentro.Beans.BCelebridad" %><%--
  Created by IntelliJ IDEA.
  User: david
  Date: 8/07/2022
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="actor" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BCelebridad>" class="java.util.ArrayList"/>
<jsp:useBean id="director" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BCelebridad>" class="java.util.ArrayList"/>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<%double contador;
    double puntajeX=0;
    boolean existe=false;
    double puntaje1 = 0;
    double puntaje2 = 0;
int samir1 = 1;
int samir2 =1;%>
<html>
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <title>Estadisticas - Celebridades</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
    <style>


        .yellow-color {
            color:#EABE3F;
        }


    </style>
    <link rel="stylesheet" href="assets/css_2/grafico_style.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="assets/css/estilos.css" />



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
            <a class="navbar-brand py-0">
                <a href="<%=request.getContextPath()%>/"><img src="img/logo.png" with="188px" height="97px"></a>
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
                    <i class="fa fa-user-circle fa-3x" aria-hidden="true"></i>
                </div>
            </button>
        </div>
        <!--Boton retornar-->
        <div
                class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex">
            <a
                    class="btn btn-tele-inverso"
                    role="button"
                    href="<%=request.getContextPath()%>/operador_estadisticasServlet"
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
                                <span><i class="fa fa-list"></i></span>
                                <span>Gestione Personal</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a
                                    href="<%=request.getContextPath()%>/OperadorFuncionesServlet"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fa fa-list"></i></span>
                                <span>Gestione Funciones</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a
                                    href="<%=request.getContextPath()%>/peliculaVisualizacionServlet"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fa fa-list"></i></span>
                                <span>Gestione Películas</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a
                                    href="<%=request.getContextPath()%>/operador_estadisticasServlet"
                                    class="text-dark text-decoration-none">
                                <span><i class="fa fa-list"></i></span>
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
                    <span><i class="fa fa-sign-out" aria-hidden="true"></i></span>
                    <span>Cerrar sesión</span>
                </a>
            </div>
        </div>
    </div>
</div>


<main>
    <div class="card-header mt-5 mb-4"></div>
    <br><br>
    <figure class="text-center">
        <h3>Celebridades mejor calificadas</h3>
    </figure>
<div class="container-fluid">
<table class="table table-dark table-hover">
    <thead>
    <tr>
        <td><h3>#</h3></td><td><h3>Película</h3></td><td><h3>Actor</h3></td><td><h3>Puntaje</h3></td><td><h3>Clasificación</h3></td> <td><h3>Foto</h3></td>
    </tr>
    </thead>
    <tbody>

    <%for (BCelebridad ac : actor){%>
    <% puntaje1 = ac.getCalificacion();%>
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
    <tr>
        <td><h4><%=samir1%></h4></td><td><h4><%=ac.getbPelicula().getNombre()%></h4></td><td><h4><%=ac.getNombre()%> <%=ac.getApellido()%></h4></td> <td><h4><%=ac.getCalificacion()%></h4></td>
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
        <td><img src="<%=ac.getFoto()%>" style="height: 100px; width: 80px"></td>
    </tr>

    <%samir1++;
    }%>
    </tbody>
</table>
</div>
<br>
<div class="container-fluid">
<table class="table table-dark table-hover">
    <thead>
    <tr>
        <td><h3>#</h3></td><td><h3>Película</h3></td><td><h3>Director</h3></td><td><h3>Puntaje</h3></td><td><h3>Clasificación</h3></td>  <td><h3>Foto</h3></td>
    </tr>
    </thead>
    <tbody>
    <%for (BCelebridad dir : director){%>
    <%
         puntaje2 = dir.getCalificacion();%>
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
    <tr>
        <td><h4><%=samir2%></h4></td><td><h4><%=dir.getbPelicula().getNombre()%></h4></td><td><h3><%=dir.getNombre()%> <%=dir.getApellido()%></h3></td><td><h3><%=dir.getCalificacion()%></h3></td>
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
        <td><img src="<%=dir.getFoto()%>" style="height: 100px; width: 80px"></td>
    </tr>
    <%samir2++;
    }%>
    </tbody>
</table>
</div>
</main>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
