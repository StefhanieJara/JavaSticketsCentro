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
                                        <p style="font-size:25px; color: red;"><em>Actor <%=pagina%></em></p>
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
                                        <input type="hidden" name="puntaje" id="puntaje"/>
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
                            <a href="<%=request.getContextPath()%>/UsuarioHistorial_2Servlet?action=listar" type="button" class="btn btn-danger">Regresar al historial</a>
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
