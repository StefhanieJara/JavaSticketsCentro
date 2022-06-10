<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 10/06/2022
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <head>
        <meta charset="utf-8" />
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
        />
        <title>PUCP - Calificar Pelicula</title>
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
        <link rel="stylesheet" href="assets/css/stars.css" />
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
                        <h4 class="my-2">Calificar Pelicula</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form>
                            <div class="row" >
                                <div class="col" align="center">
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Peliculas</label
                                        >
                                        <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                            <option selected>Selecciona la pelicula</option>
                                            <option value="1">Benedetta</option>
                                            <option value="2">Larga distancia</option>
                                            <option value="3">Lina de Lima</option>
                                        </select>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <img src="img/s5.jpg" style="max-width:200px; max-height: 400px;">
                                    </div>
                                    <div class="form-outline mb-4">
                                        <div class="ec-stars-wrapper">
                                            <a href="#" data-value="1" title="Votar con 1 estrellas">&#9733;</a>
                                            <a href="#" data-value="2" title="Votar con 2 estrellas">&#9733;</a>
                                            <a href="#" data-value="3" title="Votar con 3 estrellas">&#9733;</a>
                                            <a href="#" data-value="4" title="Votar con 4 estrellas">&#9733;</a>
                                            <a href="#" data-value="5" title="Votar con 5 estrellas">&#9733;</a>
                                        </div>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <input
                                                class="btn btn-tele"
                                                type="submit"
                                                value="Calificar"
                                        />
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
