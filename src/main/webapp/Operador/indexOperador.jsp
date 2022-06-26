<%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 05/06/2022
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>Centro Cultural PUCP-Operador</title>
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

<nav
        class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger"
>
    <div
            class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2"
    >
        <div
                class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2"
        >
            <a class="navbar-brand py-0" href="#">
                <a href="indexOperadorServlet"><img src="img/logo.png" /></a>
            </a>
        </div>

        <!--    <div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0">
            <div class="input-group">
                <div class="form-outline" style="width: 50%">
                    <input
                            type="search"
                            id="form1"
                            class="form-control"
                            placeholder="Buscar película"
                    />
                </div>
                <button type="button" class="btn btn-tele border-start-1">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>-->
        <div
                class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end"
        ></div>
        <div
                class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0"
        >
            <button
                    class="btn"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasWithBackdrop"
                    aria-controls="offcanvasWithBackdrop"
                    style="color: #ffffff"
            >
                <div style="font-size: 0.62rem">
                    <i class="fas fa-user-circle fa-3x"></i>
                </div>
            </button>
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
                        <h4 class="mb-3">Rex Campos Díaz</h4>
                        <img
                                src="img/images.png"
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
                <a href="#" class="text-dark text-decoration-none">
                    <span><i class="fas fa-sign-out-alt"></i></span>
                    <span>Cerrar sesión</span>
                </a>
            </div>
        </div>
    </div>
</div>
<main>
    <div class="card-header my-5"></div>
    <div class="container">
        <div class="row">
            <div class="moverTitulo">
                <h3 class="text-dark">Bienvenido Operador</h3>
            </div>
        </div>
        <div class="row">
            <div class="container px-5 py-2" id="custom-cards-san-miguel">
                <h4 class="pb-2 border-bottom" style="color: #f57f00">
                    ¿Qué función desea hacer el día de hoy?
                </h4>
                <div
                        class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-3"
                >
                    <div class="col">
                        <div class="card">
                            <div
                                    class="card-header h-100 shadow border-0 text-white"
                                    style="
                      background-image: url('img/cinePersonal.jpg');
                      background-size: cover;
                    "
                            >
                                <h2
                                        class="mt-5 mb-3 fw-bold"
                                        style="text-shadow: 0.5px 0.5px #2b2b2b"
                                >
                                    Gestione Personal
                                </h2>
                            </div>
                            <div class="card-body">
                                <div
                                        class="d-flex flex-column mt-auto h-100 text-dark align-items-start"
                                >
                                    <ul class="">
                                        <p>Configure el personal que atendera la función</p>
                                    </ul>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <a href="<%=request.getContextPath()%>/personalServlet" class="btn btn-danger">Ir a Personal</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <div
                                    class="card-header h-100 shadow border-0 text-white"
                                    style="
                      background-image: url('img/TeatroPucp.jpg');
                      background-size: cover;
                    "
                            >
                                <h2
                                        class="mt-5 mb-3 fw-bold"
                                        style="text-shadow: 0.5px 0.5px #2b2b2b"
                                >
                                    Gestione Funciones
                                </h2>
                            </div>
                            <div class="card-body">
                                <div
                                        class="d-flex flex-column mt-auto h-100 text-dark align-items-start"
                                >
                                    <ul class="">
                                        <p>
                                            Añada las funciones para una sede y sala determinada
                                        </p>
                                    </ul>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <a
                                            href="<%=request.getContextPath()%>/peliculaVisualizacionServlet"
                                            class="btn btn-danger"
                                    >Ir a Funciones</a
                                    >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <div
                                    class="card-header h-100 shadow border-0 text-white"
                                    style="
                      background-image: url('img/estadistica.jpg');
                      background-size: cover;
                    "
                            >
                                <h2
                                        class="mt-5 mb-3 fw-bold"
                                        style="text-shadow: 0.5px 0.5px #2b2b2b"
                                >
                                    Visualizar estadísticas
                                </h2>
                            </div>
                            <div class="card-body">
                                <div
                                        class="d-flex flex-column mt-auto h-100 text-dark align-items-start"
                                >
                                    <ul class="">
                                        <p>Visualice las estadisticas de la las funciones.</p>
                                    </ul>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <a href="<%=request.getContextPath()%>/operador_estadisticasServlet" class="btn btn-danger">Ir a Estadisticas</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<div
        class="modal fade"
        id="motivoBloqueo"
        tabindex="-1"
        aria-labelledby="conf_eliminar"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content border-0">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title" id="conf_eliminar">Bloquear farmacia</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <div class="form-outline">
                    <label class="form-label" for="bloqueoFarmacia">
                        Escriba el motivo del bloqueo de la farmacia:
                    </label>
                    <textarea
                            type="tel"
                            id="bloqueoFarmacia"
                            class="form-control"
                    ></textarea>
                </div>
                <br />
                ¿Está seguro que desea bloquearla?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                    Cancelar
                </button>
                <button type="button" class="btn btn-danger">
                    Eliminar Producto
                </button>
            </div>
        </div>
    </div>
</div>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

