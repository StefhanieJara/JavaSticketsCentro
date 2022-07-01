<%@ page import="com.example.javasticketscentro.Beans.BPelicula" %><%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 06/06/2022
  Time: 00:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listapeliculas" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BPelicula>" />
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>Centro Cultural PUCP-Lista de peliculas</title>
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
</head>
<body>
<!--Botón flotante "+" para agregar producto-->
<a href="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=crear" class="btn-float">
    <i class="fas fa-plus my-float"></i>
</a>

<!--Cabecera principal Cine-->
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
                <a href="<%=request.getContextPath()%>/indexOperadorServlet"><img src="img/logo.png" /></a>
            </a>
        </div>
        <!--Espacio-->
        <div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0"></div>
        <!--Espacio-->

        <!--Menú cine-->
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
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Gestione Personal</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/peliculaVisualizacionServlet"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Gestione Funciones</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/operador_estadisticasServlet"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
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
                        <span><i class="fas fa-sign-out-alt"></i></span>
                        <span>Cerrar sesión</span>
                    </a>
                </div>
            </div>
        </div>
    </div>

<!--Contenido página-->
<main>
    <!--Alinear cabecera con contenido-->
    <div class="card-header mt-5 mb-4"></div>

    <!--Pestañas visualización y gestión-->
    <ul class="nav nav-tabs nav-fill mb-4 justify-content-around px-5">
        <li class="nav-item">
            <a class="nav-link text-white active" aria-current="page" href="#"
            ><h1>Lista de Peliculas</h1></a
            >
        </li>
    </ul>

    <!--Barra de búsqueda producto-->
    <form class="mb-4">
        <div class="input-group justify-content-center">
            <div class="form-outline" style="width: 36%">
                <input
                        type="search"
                        id="form1"
                        class="form-control"
                        placeholder="Buscar producto"/>
            </div>
            <button type="button" class="btn btn-tele border-start-1">
                <i class="fas fa-search"></i>
            </button>
        </div>
        <br>
    </form>

    <!--Productos-->
    <%for (BPelicula pelicula : listapeliculas ) {%>
    <hr class="mx-md-5 mx-sm-3" />
    <!--Producto 1-->
    <div class="row justify-content-center align-items-start">
        <!--Nombre del producto e imagen referencial-->
        <tr>
        <div class="col-md-2 text-center mt-2">
            <h4><%=pelicula.getNombre()%></h4>
            <img
                    class="w-100"
                    src="<%=pelicula.getFoto()%>"
                    style="max-height: 400px; max-width: 250px"/>
        </div>
        <!--Precio y Stock-->
        <div class="col-md-1 text-center mt-5 d-none d-md-block">
            <h6>Precio de ticket</h6>
            <p style="font-size: larger">s/ <%=pelicula.getPrecio_peli()%></p>
            <h6>Stock</h6>
            <p style="font-size: larger"><%=pelicula.getStock()%></p>
        </div>
        <!--Descripción del producto-->
        <div class="col-md-6 mt-5 d-none d-md-block">
            <h6>Sinopsis</h6>
            <p>
                <%=pelicula.getSinopsis()%>
            </p>
            <h6>Restriccion de Edad</h6>
            <p>
                <%=pelicula.getRestricconEdad()%>
            </p>
            <h6 class="mt-1">Hora: <b><%=pelicula.getHoraInicio()%></b></h6>
            <h6 class="mt-1">Fecha: <b><%=pelicula.getFecha()%></b></h6>
        </div>
        <!--Botones de editar y eliminar-->
        <div class="col-sm-1 mt-5 d-none d-md-block text-center">
            <a href="<%=request.getContextPath()%>/editarPeliculaServlet">
                <i class="far fa-edit btn-tele p-3 rounded"></i>
            </a>
            <hr class="my-1" style="background-color: white" />
            <button
                    class="btn btn-danger py-2 px-3"
                    type="button"
                    data-bs-toggle="modal"
                    data-bs-target="#error">
                <i class="fas fa-times-circle"></i>
            </button>
        </div>

    </div>
    <hr class="mx-md-5 mx-sm-3" />
    <%}%>


    <!--Paginación-->
    <div class="container">
        <div class="d-flex justify-content-center my-3">
            <nav aria-label="paginacion_productos">
                <ul class="pagination">
                    <li class="page-item disabled">
                        <a class="page-link">Anterior</a>
                    </li>
                    <li class="page-item active">
                        <a class="page-link" href="#">1</a>
                    </li>
                    <li class="page-item" aria-current="page">
                        <a class="page-link" href="#">2</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Siguiente</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <!--Modal eliminar producto: Producto pendiente para pedido-->
    <div
            class="modal fade"
            id="error"
            tabindex="-1"
            aria-labelledby="err_eliminar"
            aria-hidden="true"
    >
        <div class="modal-dialog">
            <div class="modal-content border-0">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="err_eliminar">Error</h5>
                    <button
                            type="button"
                            class="btn-close btn-close-white"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                    ></button>
                </div>
                <div class="modal-body">
                    Esta función será eliminada y ya no se podrá recuperar
                </div>
                <div class="modal-footer my-0 py-1">
                    <button
                            type="button"
                            class="btn btn-danger"
                            data-bs-dismiss="modal"
                    >
                        Ok
                    </button>
                </div>
            </div>
        </div>
    </div>
</main>

<!--JS-->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
