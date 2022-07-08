<%@ page import="com.example.javasticketscentro.Beans.BPelicula" %>
<%@ page import="com.example.javasticketscentro.Beans.BFuncion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaFunciones" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>" />
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
    <title>Centro Cultural PUCP-Lista de funciones</title>
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
<!--Botón flotante "+" para agregar elemento-->
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
                                    href="<%=request.getContextPath()%>/OperadorFuncionesServlet"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-list"></i></span>
                                <span>Gestione Funciones</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a
                                    href="<%=request.getContextPath()%>/peliculaVisualizacionServlet"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-list"></i></span>
                                <span>Gestione Películas</span>
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
            ><h1>Lista de Funciones</h1></a
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
    <% int i=0; for (BFuncion funcion :  listaFunciones) {%>
    <hr class="mx-md-5 mx-sm-3" />
    <!--Producto 1-->
    <div class="row justify-content-center align-items-start">
        <!--Nombre del producto e imagen referencial-->
        <tr>
            <div class="col-md-2 text-center mt-2">
                <h4><%=funcion.getbPelicula().getNombre()%></h4>
                <img
                        class="w-50"
                        src="<%=funcion.getbPelicula().getFoto()%>"
                        style="max-height: 400px; max-width: 250px"/>
            </div>
            <!--Precio y Stock-->
            <div class="col-md-1 text-center mt-5 d-none d-md-block">
                <h6>Precio de ticket</h6>
                <p style="font-size: larger">s/ <%=funcion.getPrecio()%></p>
                <h6>Stock</h6>
                <p style="font-size: larger"><%=funcion.getStock()%></p>
            </div>
            <!--Descripción del producto-->
            <div class="col-md-6 mt-5 d-none d-md-block">
                <h6>Sede</h6>
                <p>
                    <%=funcion.getbSede().getNombre()%>
                </p>
                <h6>Número de sala</h6>
                <p>
                    <%=funcion.getbSala().getNumero()%>
                </p>
                <h6 class="mt-1">Hora: <b><%=funcion.getHoraInicio()%></b></h6>
                <h6 class="mt-1">Fecha: <b><%=funcion.getFecha()%></b></h6>
            </div>
            <!--Botones de editar y eliminar-->
            <div class="col-sm-1 mt-5 d-none d-md-block text-center">
                <div class="col-sm-1 d-none d-md-block text-around">
                    <form action="<%=request.getContextPath()%>/OperadorFuncionesServlet?action=editar" method="post">
                        <input type="hidden" value="<%=funcion.getIdFuncion()%>" name="idPeli">
                        <button type="submit">
                            <i class="far fa-edit btn-tele p-1 rounded"></i>
                        </button>
                    </form>
                    <button type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#eliminar<%=i%>">
                        <i class="btn btn-danger p-1 fas fa-times-circle"></i>
                    </button>
                </div>
            </div>

    </div>
    <hr class="mx-md-5 mx-sm-3" />
    <%i++;}%>


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
    <%i=0; for (BFuncion funcion : listaFunciones) {%>
    <div class="modal fade" id="eliminar<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
        <div class="modal-dialog">
            <div class="modal-content border-0">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Error</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Esta película será deshabilitada y todas sus funciones serán eliminadas.
                    <br>
                    ¿Está seguro de realizar esta acción?
                    <form method="post" class="row g-3" action="<%=request.getContextPath()%>/OperadorFuncionesServlet?action=borrar">
                        <input type="hidden" name="idPeli" value="<%=funcion.getIdFuncion()%>">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-danger">Eliminar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%i++;}%>
</main>

<!--JS-->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>