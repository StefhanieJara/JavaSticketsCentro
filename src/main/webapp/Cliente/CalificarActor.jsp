<%@ page import="com.example.javasticketscentro.Beans.BCelebridad" %><%--
  Created by IntelliJ IDEA.
  User: david
  Date: 10/06/2022
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaActor" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BCelebridad>"/>
<jsp:useBean id="idPelicula" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="puntaje" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="pagina" scope="request" type="java.lang.Integer"/>

<html lang="en">
<head>
    <head>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
        <meta charset="utf-8" />
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
        />
        <title>PUCP - Calificar Actores</title>
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
        <style>

            .star{
                font-size: 3rem;
                color: #ff9800;
                background-color: unset;
                border: none;

            }

            .star_rating{
                user-select: none;
                background-color: azure;
                padding: 1.4rem 2.5rem;
                margin: 2rem;
                border-radius: .4rem;
                text-align: center;

            }
            .star:hover{
                cursor: pointer;
            }
        </style>
    </head>
</head>
<body>
    <nav
            class="navbar navbar-light navbar-expand-md fixed-top navbar- shadow-sm navigation-clean-search d-flex justify-content-center"
            style="background-color: #e72d4b"
    >
        <div
                class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2"
        >
            <!--Logo Centro Cultural PUCP-->
            <div
                    class="col-xl-3 col-lg-3 col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-2 ps-md-5 ps-lg-4 ps-xl-5 ps-xxl-2"
            >
                <a class="navbar-brand py-0" href="usuario.html">
                    <a href="<%=request.getContextPath()%>/"><img src="img/logo.png" with="188px" height="97px"/></a>
                </a>
            </div>
            <!--Espacio-->
            <div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0"></div>
            <!--Espacio-->

            <!--Menú-->
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
            <!--Boton atras-->
            <div class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
                <button class="btn" type="button" style=" color: white">
                    <div style="font-size: 0.62rem">
                        <a href="<%=request.getContextPath()%>/UsuarioHistorial_2Servlet">
                            <i class="fa fa-caret-square-o-left fa-3x" style='color: #fff'></i></a>
                    </div>
                </button>
            </div>
        </div>
    </nav>
    <br><br><br><br><br><br><br><br>


<section class="vh-100">
    <div class="container py-4 h-100">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div
                        class="card shadow-2-strong card-registration"
                        style="border-radius: 15px"
                >
                    <div
                            class="card-header"
                            style="background-color: #e72d4b; color: white"
                    >
                        <h4 class="my-2">Calificar Actores</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">

                        <form method="post" action="<%=request.getContextPath()%>/calificarActor?action=calificarA">
                            <div class="row" >
                                <div class="col" align="center">
                                    <div class="form-outline mb-4">
                                        <p style="font-size:25px; color: red;"><em>Actor <%=pagina%> de <%=listaActor.size()%></em></p>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <p style="font-size:30px; color: black;"><em><%=listaActor.get(pagina-1).getNombre()%> <%=listaActor.get(pagina-1).getApellido()%></em></p>
                                        <img src="<%=listaActor.get(pagina-1).getFoto()%>" style="max-width:200px; max-height: 400px;">
                                    </div>
                                    <div class="star_rating">
                                        <%for (int contador=0; contador<puntaje; contador++){%>
                                        <button class="star" type="button" name="star5" id="star5">&#9733;</button>
                                        <%}%>
                                        <%for (int contador=0; contador<5-puntaje; contador++){%>
                                        <button class="star" type="button" name="star1" id="star1">&#9734;</button>
                                        <%}%>
                                        <p class="current_rating"><%=puntaje%> de 5</p>
                                        <input type="hidden" value="<%=puntaje%>" name="puntaje" id="puntaje"/>
                                    </div>
                                    <input type="hidden"  name="idCelebridad" id="idCelebridad" value="<%=listaActor.get(pagina-1).getIdCelebridad()%>"/>
                                    <input type="hidden"  name="idPelicula"  value="<%=idPelicula%>"/>
                                    <input type="hidden" name="pagina" value="<%=pagina%>">
                                    <div class="form-outline mb-4">
                                        <input class="btn btn-tele"
                                                type="submit"
                                                value="Calificar"/>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <%if(listaActor.size()>1){%>
                        <!--Paginación-->
                        <div class="container">
                            <div class="d-flex justify-content-center my-3">
                                <nav aria-label="paginacion_productos">
                                    <ul class="pagination">
                                        <form method="post" action="<%=request.getContextPath()%>/calificarActor?action=paginacion">
                                            <input type="hidden" name="pagina" value="<%=pagina-1%>">
                                            <input type="hidden"  name="idPelicula" id="idPelicula" value="<%=idPelicula%>"/>
                                            <%if(pagina==1){%>
                                            <li class="page-item disabled">
                                                <a class="page-link">Anterior</a>
                                            </li>
                                            <%}else{%>
                                            <li class="page-item">
                                                <button type="submit" class="page-link">Anterior</button>
                                            </li>
                                            <%}%>
                                        </form>

                                        <form method="post" action="<%=request.getContextPath()%>/calificarActor?action=paginacion">
                                            <input type="hidden" name="pagina" value="<%=pagina+1%>">
                                            <input type="hidden"  name="idPelicula" id="idPelicula" value="<%=idPelicula%>"/>
                                            <%if(pagina==listaActor.size()){%>
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#">Siguiente</a>
                                            </li>
                                            <%}else{%>
                                            <li class="page-item">
                                                <button type="submit" class="page-link" href="#">Siguiente</button>
                                            </li>
                                            <%}%>
                                        </form>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <%}%>

                        <div>
                            <a href="<%=request.getContextPath()%>/UsuarioHistorial_2Servlet" type="button" class="btn btn-danger">Regresar al historial</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script>
        const allStars = document.querySelectorAll('.star');
        let current_rating = document.querySelector('.current_rating');
        allStars.forEach((star, i) =>{
            star.onclick = function(){
                console.log(i);
                let current_start_level = i+1;
                current_rating.innerHTML = current_start_level +  ' de 5';
                document.getElementById("puntaje").value = current_start_level;
                allStars.forEach((star, j)=>{
                    if(current_start_level >= j+1){
                        star.innerHTML = '&#9733';
                    }else{
                        star.innerHTML = '&#9734';
                    }
                })
            }
        })

    </script>

</body>
</html>
