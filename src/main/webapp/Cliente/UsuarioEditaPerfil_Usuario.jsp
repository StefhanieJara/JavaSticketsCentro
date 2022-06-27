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

    <form method="POST" action="<%=request.getContextPath()%>/UsuarioEditaPerfilServlet?a=actualizar">
        <div style="margin-bottom: 50px" class="contenerdor_perfil">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mb-1">
                        <div class="form-outline mb-4">
                            <label class="form-label" for="idPer"></label>
                            <input name="idPer"
                                   type="hidden"
                                   id="idPer"
                                   class="form-control"
                                   value="<%=Usuario.getIdPer()%>"
                                           /></div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="usuario">Usuario</label>
                            <input name="usuario"
                                   type="text"
                                   id="usuario"
                                   class="form-control"
                                   value="<%=Usuario.getUsuario()%>"
                                   placeholder=<%=Usuario.getUsuario()%>
                            /></div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="codigo">Codigo PUCP</label>
                            <input name="codigo"
                                   type="text"
                                   id="codigo"
                                   class="form-control"
                                   value="<%=Usuario.getCodigoPUCP()%>"
                                   placeholder=<%=Usuario.getCodigoPUCP()%>
                            /></div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="nombre">Nombre</label>
                            <input
                                    name ="nombre"
                                    type="text"
                                    id="nombre"
                                    class="form-control"
                                    value="<%=Usuario.getNombre()%>"
                                    placeholder="Ingrese su Nombre"
                            >
                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="apellido">Apellidos</label>
                            <input  name ="apellido"
                                    type="text"
                                    id="apellido"
                                    class="form-control"
                                    value="<%=Usuario.getApellido()%>"
                                    placeholder="Ingrese su Apellido"
                            >
                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="email">Correo</label>
                            <input  name ="email"
                                    type="text"
                                    id="email"
                                    class="form-control"
                                    value="<%=Usuario.getEmail()%>"
                                    placeholder="Ingrese su email"
                            >
                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="direccion">Direccion</label>
                            <input  name ="direccion"
                                    type="text"
                                    id="direccion"
                                    class="form-control"
                                    value="<%=Usuario.getDireccion()%>"
                                    placeholder="Ingrese su direccion"
                            >
                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="numCel">Numero de contacto</label>
                            <input  name ="numCel"
                                    type="text"
                                    id="numCel"
                                    class="form-control"
                                    value="<%=Usuario.getNumCel()%>"
                                    placeholder="Ingrese su numero de celular"
                            >
                        </div>

                    </div>

                    <div class="col-md-6 mb-4 text-center">
                        <label for="formFile" class="form-label">Imagen referencial</label>
                        <div class="text-center mt-2 mb-3">
                            <img
                                    src="img/benedict.jpg"
                                    class="img-thumbnail"
                                    width="200x"
                                    height="400px"
                                    alt="medicamento"
                            />
                        </div>
                        <input class="form-control" type="file" id="formFile" />

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
