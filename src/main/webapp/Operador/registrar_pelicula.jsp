<%@ page import="com.example.javasticketscentro.Beans.BSede" %>
<%@ page import="com.example.javasticketscentro.Beans.BSala" %>
<%@ page import="com.example.javasticketscentro.Beans.BCelebridad" %><%--
  Created by IntelliJ IDEA.
  User: stefh
  Date: 6/06/2022
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listarsala" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BSala>"/>
<jsp:useBean id="mensaje" scope="request" type="java.lang.String" class="java.lang.String" />
<jsp:useBean id="listarsede" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BSede>"/>
<jsp:useBean id="listarDirector" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BCelebridad>"/>
<jsp:useBean id="listarActor" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BCelebridad>"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>Centro Cultural PUCP - Perfil de usuario</title>
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
    <nav class="navbar navbar-light navbar-expand-md fixed-top navbar- shadow-sm navigation-clean-search d-flex justify-content-center"
         style="background-color: #e72d4b">
        <div class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2">
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-2 ps-md-5 ps-lg-4 ps-xl-5 ps-xxl-2">
                <a href="indexAdmin.html"><img src="img/logo.png" /></a>
            </div>

            <div class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end ">
            </div>
            <div class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
                <button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBackdrop"
                        aria-controls="offcanvasWithBackdrop" style="color: #fff">
                    <div style="font-size: 0.62rem">
                        <i class="fas fa-user-circle fa-3x"></i>
                    </div>
                </button>
            </div>
            <!--Boton atras-->
            <div class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
                <button class="btn" type="button" style=" color: white">
                    <div style="font-size: 0.62rem">
                        <a href="<%=request.getContextPath()%>/peliculaVisualizacionServlet"</a>
                        <i class="fa fa-caret-square-o-left fa-3x" style='color: #fff'></i>
                    </div>
                </button>
            </div>
        </div>
    </nav>
    <div class="offcanvas offcanvas-end text-center" tabindex="-1" id="offcanvasWithBackdrop"
         aria-labelledby="offcanvasWithBackdropLabel">
        <div class="d-flex align-items-center flex-column mb-3 vh-100">
            <div class="p-2 w-100">
                <div class="offcanvas-header border-bottom">
                    <h5 class="mb-0">Menú de Administrador</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                            aria-label="Close"></button>
                </div>
            </div>
            <div class="p-2">
                <div class="offcanvas-body p-3">
                    <div class="d-flex flex-column">
                        <div class="my-2">
                            <h4 class="mb-3">Admin45</h4>
                            <img src="img/images.png"
                                 class="rounded-circle mx-auto d-block mb-3 h-25 w-50" alt="profile image">
                        </div>
                        <div class="mb-3">
                            <div class="p-2">
                                <a
                                        href="gestionSalas.html"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Gestione Salas</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="visualizacionActoresDirectores.html"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Añadir Actores y Directores</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="visualizacionOperadores.html"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Visualizar Operadores</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="listaclientesV2.html"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Visualizar Lista de Clientes</span>
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

<section class="vh-100 py-5">
    <div class="container py-2 h-50">

        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div
                        class="card shadow-2-strong card-registration"
                        style="border-radius: 15px; margin-top: 100px"
                >
                    <%if (!mensaje.equals("")){%>
                    <div style="font-weight: bold;" class="alert alert-danger" role="alert">
                       ¡Datos incompletos!
                    </div>
                    <%}%>
                    <div
                            class="card-header"
                            style="background-color: #e72d4b; color: white"
                    >
                        <h4 class="my-8">Registrar función</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form method="POST" action="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=guardar">
                            <div class="row">
                                <div class="col-md-6 mb-1">
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Nombre de la pelicula</label
                                        >
                                        <input
                                                type="text"
                                                name="nombrePeli"
                                                id="productName"
                                                class="form-control"
                                                placeholder="Ingrese el nombre de la película"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Genero</label
                                        >
                                        <input
                                                type="text"
                                                name="genero"
                                                id="productName"
                                                class="form-control"
                                                placeholder="Ingrese el género de la pelicula"
                                        />
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName">Ingrese la duración de la pelicula</label>
                                        <input
                                                type="time"
                                                name="tiempo"
                                                class="form-control"
                                                placeholder="Ingrese la duracion de la pelicula"/> </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName">Ingrese la hora de inicio de la película</label>
                                        <input
                                                type="time"
                                                name="tiempoInicio"
                                                class="form-control"
                                                placeholder="Ingrese la duracion de la pelicula"/> </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Ingrese la fecha</label
                                        >
                                        <input
                                                type="date"
                                                name="fecha"
                                                id="productName"
                                                class="form-control"
                                        />
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Restricción de edad</label
                                        >
                                        <select
                                                id="country1"
                                                name="restriccionEdad"
                                                class="frm-field required sect"
                                        >
                                            <option disabled="disabled" selected="true">Seleccionar</option>
                                            <option>Para todo publico (AA)</option>
                                            <option>+12 (B)</option>
                                            <option>+15(B15)</option>
                                            <option>+18 (C)</option>
                                            <option>Explicitas o lenguaje violento(D)</option>
                                        </select>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Elija el numero de sala</label
                                        >
                                        <select
                                                name="sala"
                                                class="frm-field required sect"
                                        >
                                            <option>Seleccionar</option>
                                            <%for(BSala bsalas : listarsala){%>
                                            <option value="<%=bsalas.getIdSala()%>"><%=bsalas.getNumero()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>


                                <div class="col-md-6 mb-4 text-center">
                                    <label class="form-label">Imagen</label>
                                    <div class="text-center mt-2 mb-3">
                                        <img id="img-preview" style="max-width: 300px; resize: both; max-width: 300px" />
                                    </div>
                                    <div class="d-flex justify-content-center my-3">
                                        <input type="file" id="img-uploader">

                                    </div>
                                    <progress id="img-upload-bar" width="10px" value="0" max="100"
                                              style="width: 100%"></progress>
                                    <input type="hidden" name="photoUrl" id="photoUrl" />

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productStock"
                                        >Stock de tickets disponible</label
                                        >
                                        <input
                                                name="stock"
                                                type="number"
                                                min="20"
                                                max="200"
                                                id="productStock"
                                                class="form-control"
                                                placeholder="0"
                                        />
                                    </div>
                                    <div class="form-outline">
                                        <label class="form-label" for="productPrice"
                                        >Precio por ticket</label
                                        >
                                        <input
                                                name="precio"
                                                type="number"
                                                min="0.0"
                                                step="0.1"
                                                max="60"
                                                id="productPrice"
                                                class="form-control"
                                                placeholder="S/."
                                        />
                                    </div>

                                    <div class="form-outline mb-4 py-4">
                                        <label class="form-label" for="productName"
                                        >Elija la sede</label
                                        >
                                        <select
                                                id="country1"
                                                name="sede"
                                                class="frm-field required sect"
                                        >
                                            <option>Seleccionar</option>
                                            <%for(BSede bSede : listarsede){%>
                                            <option value="<%=bSede.getIdSede()%>"><%=bSede.getNombre()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-4 pb-2">
                                    <div class="form-outline">
                                        <label class="form-label" for="productoDescription"
                                        >Sinopsis</label
                                        >
                                        <input
                                                type="text"
                                                name="sinopsis"
                                                id="productoDescription"
                                                class="form-control"
                                        >
                                    </div>
                                </div>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label" for="productName">Director</label>
                                <select
                                        name="director"
                                        class="frm-field required sect"
                                >
                                    <option>Seleccionar</option>
                                    <%for(BCelebridad bCelebridad : listarDirector){%>
                                    <option value="<%=bCelebridad.getIdCelebridad()%>"><%=bCelebridad.getNombre()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label" for="productName"
                                >Actor/actriz protagonista 1</label
                                >
                                <select
                                        name="actor1"
                                        class="frm-field required sect"
                                >
                                    <option>Seleccionar</option>
                                    <%for(BCelebridad bCelebridad : listarActor){%>
                                    <option value="<%=bCelebridad.getIdCelebridad()%>"><%=bCelebridad.getNombre()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <button type="submit" id="enviar" class="btn btn-danger">Registrar Función</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>
<script src="assets/appSubirImagen.js"></script>
</body>
</html>

