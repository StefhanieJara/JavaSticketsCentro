<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 05/06/2022
  Time: 09:11 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Centro Cultural PUCP - Inicio sesión</title>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/style.css">
        <link
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css"
                rel="stylesheet"
        />
        <link
                href="https://fonts.googleapis.com/css?family=Roboto&display=swap"
                rel="stylesheet"
        />
        <style>
            video{
                position: fixed;
                min-width: 100%;
                min-height: 100%;
                z-index: -1;
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <video src="https://res.cloudinary.com/dytz5evzl/video/upload/v1657515176/javasticket_1_gqic59.mp4" autoplay="true" muted="true" loop="true" poster="img/banner3.jpg"></video>
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
                            <div class="card-body">
                                <form class="form-signin" method="post" action="<%=request.getContextPath()%>/UsuariologinclientServlet?action=cambiarContra" >
                                <div class="container w-75">
                                    <div class="row my-4">
                                        <div class="form-group" style="color:white">
                                            <div class="titles text-center">
                                                <h5>Cambiar Contraseña</h5>
                                            </div>
                                            <br>
                                            <label class="mb-2">Ingrese su nueva contraseña:</label>
                                            <input type="password" name="pass" minlength="8" placeholder="Nueva Contraseña" required="required" class="form-control">
                                            <br>
                                            <label class="mb-2">Confirme su nueva contraseña:</label>
                                            <input type="password" name="pass2" minlength="8" class="form-control" placeholder="Confirme Contraseña" required="required">
                                            <br><br><br>
                                            <%if(session.getAttribute("error")!=null){%>
                                            <%if(session.getAttribute("error").equals("noIgual")){%>
                                            <div class="text-danger mb-2">Las contraseñas no coinciden!</div>
                                            <%}else{%>
                                            <div class="text-danger mb-2">Ups! Ocurrió un problema al cambiar la contraseña, vuelve a intentarlo!</div>
                                            <%}%>
                                            <%session.removeAttribute("error");session.invalidate();%>
                                            <%}%>
                                            <br><br><br>
                                            <div class="text-center"><button href="#" type="submit" class="btn submit mb-4 botones" style="color: white; background:#E72D4B; border-color:#E72D4B">
                                                Confirmar
                                            </button></div>
                                        </div>
                                    </div>
                                </div>
                                </form>
                                <p style="text-align: center"><a href="<%=request.getContextPath()%>/UsuariologinclientServlet">Ir al Login</a></p>
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
