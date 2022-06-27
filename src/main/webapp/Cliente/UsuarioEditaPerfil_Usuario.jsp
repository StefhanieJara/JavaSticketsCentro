<%@ page import="com.example.javasticketscentro.Beans.BPersona" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="Usuario" scope="request" type="com.example.javasticketscentro.Beans.BPersona" />
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>PUCP - Perfil de usuario</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/estilos.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
            rel="stylesheet"
    />
    <script
            src="https://kit.fontawesome.com/5733880de3.js"
            crossorigin="anonymous"
    ></script>
</head>
<body>
<nav
        class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger"
>
    <div class="row w-100 align-items-center pe-sm-4 ps-0 my-2">
        <!--Logo Centro Cultural PUCP-->
        <div
                class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2"
        >
            <a class="navbar-brand py-0" href="#">
                <a href="<%=request.getContextPath()%>/"><img src="img/logo.png" /></a>
            </a>
        </div>
    </div>
</nav>

<!--Contenido-->
<main>
    <div class="banner-top container-fluid" id="home">
        <!-- header -->
        <header></header>
    </div>

    <form>
        <div style="margin-bottom: 50px" class="contenerdor_perfil">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="mt-2">
                            <h1>Mi Perfil</h1>
                        </div>
                        <div class="row g-3 align-items-center mt-2">

                            <div class="rows-auto">
                                <label for="inputtext6" class="col-form-label"
                                >DNI</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input
                                        type="number"
                                        id="inputtext6"
                                        class="form-control"
                                        aria-describedby="textHelpInline"
                                        placeholder="<%=Usuario.getDni()%>"
                                        readonly
                                />
                            </div>
                        </div>
                        <div class="row g-3 align-items-center mt-2">

                            <div class="rows-auto">
                                <label for="codigo" class="col-form-label"
                                >Código</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input  name="codigo"
                                        type="number"
                                        id="codigo"
                                        class="form-control"
                                        aria-describedby="textHelpInline"
                                        value="<%=Usuario.getCodigoPUCP()%>"
                                        placeholder="Ingrese su codigo pucp"
                                />
                            </div>
                        </div>
                        <div class="row g-3 align-items-center mt-2">

                            <div class="rows-auto">
                                <label for="nombre" class="col-form-label"
                                >Nombre</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input  name="nombre"
                                        type="text"
                                        id="nombre"
                                        class="form-control"
                                        aria-describedby="textHelpInline"
                                        value="<%=Usuario.getNombre()%>"
                                        placeholder="Ingrese su nombre"
                                />
                            </div>
                        </div>
                        <div class="row g-3 align-items-center mt-2">

                            <div class="rows-auto">
                                <label for="apellido" class="col-form-label"
                                >Apellido</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input  name="apellido"
                                        type="text"
                                        id="apellido"
                                        class="form-control"
                                        aria-describedby="textHelpInline"
                                        value="<%=Usuario.getApellido()%>"
                                        placeholder="Ingrese su apellido"
                                />
                            </div>
                            <div class="rows-auto">
                                <label for="usuario" class="col-form-label"
                                >Usuario</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input  name="usuario"
                                        type="text"
                                        id="usuario"
                                        class="form-control"
                                        aria-describedby="textHelpInline"
                                        value="<%=Usuario.getUsuario()%>"
                                        placeholder="Ingrese su usuario"
                                />
                            </div>

                        </div>
                        <div class="row g-3 align-items-center mt-2">

                            <div class="rows-auto">
                                <label for="numCel" class="col-form-label"
                                >Teléfono</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input  name="numCel"
                                        type="number"
                                        id="numCel"
                                        class="form-control"
                                        aria-describedby="textHelpInline"
                                        value="<%=Usuario.getNumCel()%>"
                                        placeholder="Ingrese su numero de celular"
                                />
                            </div>
                        </div>
                        <div class="row g-3 align-items-center mt-2">
                            <div class="rows-auto">
                                <label for="direccion" class="col-form-label"
                                >Dirección</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input  name="direccion"
                                        type="text"
                                        id="direccion"
                                        class="form-control"
                                        aria-describedby="textHelpInline"
                                        value="<%=Usuario.getDireccion()%>"
                                        placeholder="Ingrese su direccion"
                                />
                            </div>
                        </div>

                        </div>
                    </div>
                    <div style="margin-top: 80px" class="col-md-6 mb-4 text-center">
                        <h4 class="form-label" >Imagen de perfil</h4>

                            <div class="text-center mt-2 mb-3">
                                <img id="img-preview" src="img/benedict.jpg" style="max-width: 300px; resize: both; max-width: 300px" />
                            </div>
                            <div class="d-flex justify-content-center my-3">
                                <input type="file" id="img-uploader">
                            </div>
                            <progress class="text-center" id="img-upload-bar" width="8px" value="0" max="100"
                                  style="width: 100%"></progress>

                        <input type="hidden" name="photoUrl" id="photoUrl" />
                    </div>

                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-tele">Guardar Edicion</button>
    </form>
</main>

<!--JS-->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>
<script src="assets/appSubirImagen.js"></script>
</body>
</html>
