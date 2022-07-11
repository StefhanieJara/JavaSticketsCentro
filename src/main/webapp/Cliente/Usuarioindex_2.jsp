<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 05/06/2022
  Time: 08:38 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Centro Cultural PUCP-Inicio de Sesión</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/styles_veneko.css"/>
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css"
            rel="stylesheet"
    />
    <link
            href="https://fonts.googleapis.com/css?family=Roboto&display=swap"
            rel="stylesheet"
    />

</head>
<body>
<section
        class="d-flex flex-grow-1 flex-shrink-1 p-4 justify-content-md-center align-items-md-center justify-content-lg-center align-items-lg-center justify-content-xl-center align-items-xl-center vh-100"
        style="min-height: 700px;">
    <div class="container d-flex justify-content-center my-2">
        <div class="card responsive-login login-color">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6 d-flex flex-column justify-content-center align-content-center align-middle">
                        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="img/s1.jpg" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="img/s2.jpg" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="img/s8.jpg" class="d-block w-100" alt="...">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                    <div class="col-md-6 d-flex flex-column justify-content-center align-content-center">

                        <br><br>
                        <div class="flex-row justify-content-center align-content-center">
                            <div class="d-flex flex-column px-md-5 justify-content-center align-content-center">
                                <form>
                                    <div class="row">
                                        <center>
                                            <small id="emailHelp" class="form-text text-muted mb-2">Ingresar como cliente (o para registrarse)</small>
                                            <br><br>
                                            <a class="btn btn-primary d-block mb-3" href="<%=request.getContextPath()%>/UsuariologinclientServlet" type="submit"
                                               style="background:#E72D4B; border-color:#E72D4B">
                                                <strong>Cuenta de Cliente</strong>
                                            </a>
                                        </center>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <a href="index.html"><img src="logo.png" class="logo-PUCP"></a>
                        </div>
                        <div class="flex-row justify-content-center align-content-center">
                            <div class="d-flex flex-column px-md-5 justify-content-center align-content-center">
                                <form>
                                    <div class="row">
                                        <center>
                                            <br>
                                            <div class="boton">
                                                <a class="btn btn-primary d-block mb-3" type="submit" href="<%=request.getContextPath()%>/Usuariologinclient2Servlet"
                                                   style="background:#E72D4B; border-color:#E72D4B">
                                                    <strong>Cuenta de Corporativa</strong>
                                                </a>
                                            </div>
                                            <small id="emailHelp" class="form-text text-muted mb-2">Solo para administradores y operadores</small>
                                        </center>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
