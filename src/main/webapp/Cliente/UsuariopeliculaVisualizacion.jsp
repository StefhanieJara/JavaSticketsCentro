<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 05/06/2022
  Time: 09:09 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
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
                        <a href="indexOperador.html"><img src="img/logo.png" /></a>
                    </a>
                </div>
                <!--Espacio-->
                <div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0"></div>
                <!--Espacio-->
                <div
                        class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end"
                ></div>
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
            </div>
        </nav>

        <!--Menú cine-->
        <div
                class="offcanvas offcanvas-end text-center"
                tabindex="-1"
                id="offcanvasWithBackdrop"
                aria-labelledby="offcanvasWithBackdropLabel"
        >
            <div class="d-flex align-items-center flex-column mb-3 vh-100">
                <!--Título y botón-->
                <div class="p-2 w-100">
                    <div class="offcanvas-header border-bottom">
                        <h5 class="mb-0">Menú</h5>
                        <button
                                type="button"
                                class="btn-close text-reset"
                                data-bs-dismiss="offcanvas"
                                aria-label="Close"
                        ></button>
                    </div>
                </div>
                <!--Foto cine-->
                <div class="p-2">
                    <div class="offcanvas-body p-3">
                        <div class="d-flex flex-column">
                            <div class="my-2">
                                <h4 class="mb-3">Rex Quispe Medina</h4>
                                <img
                                        src="img/images.png"
                                        class="rounded-circle mx-auto d-block mb-3 h-25 w-50"
                                        alt="profile image"
                                />
                            </div>
                        </div>
                    </div>
                </div>
                <!--Footer cerrar sesión-->
                <div class="mt-auto p-2 w-100">
                    <div class="offcanvas-body border-top pt-4">
                        <a href="index.html" class="text-dark text-decoration-none">
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
                    ><b>Lista de Peliculas</b></a
                    >
                </li>
            </ul>

            <!--Barra de búsqueda pelicula-->
            <form class="mb-4">
                <div class="input-group justify-content-center">
                    <div class="form-outline" style="width: 36%">
                        <input
                                type="search"
                                id="form1"
                                class="form-control"
                                placeholder="Buscar pelicula"
                        />
                    </div>
                    <button type="button" class="btn btn-tele border-start-1">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
                <br>
                <div class="input-group justify-content-center">
                    <div class="form-outline" style="width: 36%">
                        <input
                                type="search"
                                id="form1"
                                class="form-control"
                                placeholder="Filtrar por genero"
                        />
                    </div>
                    <button type="button" class="btn btn-tele border-start-1">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </form>

            <!--Pelicula-->
            <hr class="mx-md-5 mx-sm-3" />
            <!--Pelicula-- 1-->
            <div class="row justify-content-center align-items-start">
                <!--Nombre de la pelicula e imagen referencial-->
                <div class="col-md-2 text-center mt-2">
                    <h4>Doctor Strange</h4>
                    <img
                            class="w-100"
                            src="img\doctorStrange.jpg"
                            style="max-height: 400px; max-width: 250px"
                    />
                </div>
                <!--Precio y Stock-->
                <div class="col-md-1 text-center mt-5 d-none d-md-block">
                    <h6>Precio de ticket</h6>
                    <p style="font-size: larger">s/ 36.00</p>
                    <h6>Stock</h6>
                    <p style="font-size: larger">24</p>
                </div>
                <div class="d-flex justify-content-around align-items-center d-md-none">
                    <h6 style="display: inline">
                        Precio de ticket:
                        <p style="display: inline; font-size: large; font-weight: normal">
                            &nbsp;s/ 36.00
                        </p>
                    </h6>
                    <h6 style="display: inline">
                        Stock:
                        <p style="display: inline; font-size: large; font-weight: normal">
                            &nbsp;24
                        </p>
                    </h6>
                </div>
                <!--Descripción de la pelicula-->
                <div class="col-md-6 mt-5 d-none d-md-block">
                    <h6>Sinopsis</h6>
                    <p>
                        Dr. Stephen Strange cuya vida cambia para siempre luego de un
                        accidente automovilístico que lo deja sin poder mover sus manos.
                        Cuando la medicina tradicional falla, se ve obligado a buscar una
                        cura y esperanzas en un lugar impensado: una comunidad aislada
                        llamada Kamar-Taj. Rápidamente descubre que éste no es sólo un
                        centro de recuperación, sino también la primera línea de una batalla
                        en contra de fuerzas oscuras y ocultas empeñadas en destruir nuestra
                        realidad.
                    </p>
                    <h6 class="mt-1">Hora<b> 17:30 pm</b></h6>
                    <h6 class="mt-1">Fecha<b> 20/05/2022</b></h6>
                </div>
                <div class="d-flex flex-column mt-1 d-md-none px-5">
                    <h6>Sinopsis</h6>
                    <p>
                        Dr. Stephen Strange cuya vida cambia para siempre luego de un
                        accidente automovilístico que lo deja sin poder mover sus manos.
                        Cuando la medicina tradicional falla, se ve obligado a buscar una
                        cura y esperanzas en un lugar impensado: una comunidad aislada
                        llamada Kamar-Taj. Rápidamente descubre que éste no es sólo un
                        centro de recuperación, sino también la primera línea de una batalla
                        en contra de fuerzas oscuras y ocultas empeñadas en destruir nuestra
                        realidad.
                    </p>
                    <h6 class="mt-1">Hora<b> 17:30 pm</b></h6>
                    <h6 class="mt-1">Fecha<b> 20/05/2022</b></h6>
                </div>

            </div>
            <hr class="mx-md-5 mx-sm-3" />

            <!--Paginación-->
            <div class="container">
                <div class="d-flex justify-content-center my-3">
                    <nav aria-label="paginacion_peliculas">
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




        </main>

        <!--JS-->
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>

