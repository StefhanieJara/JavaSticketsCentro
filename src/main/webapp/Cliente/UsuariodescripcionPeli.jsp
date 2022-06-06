<%--
  Created by IntelliJ IDEA.
  User: stefh
  Date: 6/06/2022
  Time: 00:08
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
    <title>Telefarma - Producto X</title>
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
        <!--Logo telefarma-->
        <div
                class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2"
        >
            <a class="navbar-brand py-0" href="#">
                <a href="index.html"><img src="assets/img/logo.png" /></a>
            </a>
        </div>
        <!--Buscador de productos-->
        <div class="col-md-7 d-none d-md-block ps-0">
            <!--desaparece en menores a medium-->
            <div class="input-group">
                <div style="width: 50%">
                    <input
                            type="search"
                            id="buscador_producto"
                            class="form-control"
                            placeholder="Busca una pelicula"
                    />
                </div>
                <a
                        role="button"
                        class="btn btn-tele border-start-1"
                        href="usuarioProductoBuscado.html"
                >
                    <i class="fas fa-search"></i>
                </a>
            </div>
        </div>
        <!--Carrito-->
        <div
                class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end"
        >
            <a
                    class="btn btn-tele-inverso"
                    role="button"
                    href="usuarioCarrito.html"
            >
                <div style="font-size: 0.6rem">
                    <!--para cambios más precisos del tamaño-->
                    <i class="fas fa-cart-plus fa-3x"></i>
                </div>
            </a>
        </div>
        <!--Menú usuario-->
        <div class="col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <button
                    class="btn btn-tele-inverso"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#menuDeUsuario"
                    aria-controls="menuDeUsuario"
            >
                <div style="font-size: 0.62rem">
                    <i class="fas fa-user-circle fa-3x"></i>
                </div>
            </button>
        </div>
    </div>
</nav>

<!--Menú de usuario-->
<div
        class="offcanvas offcanvas-end text-center"
        tabindex="-1"
        id="menuDeUsuario"
        aria-labelledby="menuDeUsuario"
>
    <div class="d-flex align-items-center flex-column mb-3 vh-100">
        <!--Título y botón-->
        <div class="p-2 w-100">
            <div class="offcanvas-header border-bottom">
                <h5 class="mb-0">Menú de Usuario</h5>
                <button
                        type="button"
                        class="btn-close text-reset"
                        data-bs-dismiss="offcanvas"
                        aria-label="Close"
                ></button>
            </div>
        </div>
        <!--Foto usuario y opciones-->
        <div class="p-2">
            <div class="offcanvas-body p-3">
                <div class="d-flex flex-column">
                    <div class="my-2">
                        <h4 class="mb-3">Paco Perez</h4>
                        <img
                                src="assets/img/images.png"
                                class="rounded-circle mx-auto d-block mb-3 h-25 w-50"
                                alt="profile image"
                        />
                    </div>
                    <div class="mb-3">
                        <div class="p-2">
                            <a
                                    href="usuarioEditar.html"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-user-edit"></i></span>
                                <span>Editar usuario</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a
                                    href="usuarioHistorial.html"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-list"></i></span>
                                <span>Historial de compras</span>
                            </a>
                        </div>
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

<!--Contenido-->
<main class="">
    <!--Alinear cabecera con contenido-->
    <div class="card-header my-5"></div>
    <!--Detalles producto-->
    <div class="container">
        <div class="row">
            <!--Imagen del producto-->
            <div class="col-md-5">
                <div class="row text-center">
                    <img src="assets/img/s2.jpg" class="img-detalles" />
                </div>
            </div>
            <!--Info del producto-->
            <div class="col-md-7">
                <!--Nombre-->
                <h3>Doctor Strange</h3>
                <!--<p class="mb-2 text-muted text-uppercase small">Shirts</p>-->
                <!--Puede servir para poner tableta, jarabe, etc-->
                <!--Precio-->
                <h4>
                    <span class="me-1"><strong>s/ 35</strong></span>
                </h4>
                <!--Descripción-->
                <p class="pt-1">
                    Stephen Strange es un médico especializado en neurocirugía,
                    codicioso y egocéntrico, que solo se preocupa por la riqueza de su
                    carrera, hasta que en un accidente sufrió una enfermedad nerviosa
                    en sus manos que le obligó a retirarse.
                </p>
                <h5 class="text-dark">Genero:</h5>
                <h6 class="text-dark">Accion, Ciencia ficcion, Superheroe</h6>
                <h5 class="text-dark">Duracion:</h5>
                <h6 class="text-dark">2h 30min</h6>
                <h5 class="text-dark">Director:</h5>
                <h6 class="text-dark">Sam Raimi</h6>
                <h5 class="text-dark">Actores:</h5>
                <h6 class="text-dark">Michael Waldron, Jade Bartlett, etc</h6>
                <!--Detalles-->
                <div class="table-responsive">
                    <table class="table table-sm table-borderless mb-0">
                        <tbody>
                        <!--Sede-->
                        <tr>
                            <th class="ps-0 w-25" scope="row">
                                <strong>Sede</strong>
                            </th>
                            <td>Lince</td>
                        </tr>
                        <!--Stock-->
                        <tr>
                            <th class="ps-0 w-25" scope="row">
                                <strong>Stock</strong>
                            </th>
                            <td>19</td>
                        </tr>
                        </tbody>
                    </table>
                    <select class="form-select" name="Distrito">
                        <option value="" selected disabled>Horario</option>
                        <option value="14:00">2:00pm</option>
                        <option value="17:20">5:20pm</option>
                        <option value="20:00">8:00pm</option>
                        <option value="23:20">11:20pm</option>
                    </select>
                </div>
                <hr />
                <!--Cantidad y añadir carrito-->
                <div class="table-responsive">
                    <table class="table table-sm table-borderless">
                        <tbody>
                        <!--Label-->
                        <tr>
                            <td class="ps-2 p-0 w-25">Cantidad</td>
                        </tr>
                        <!--Botones aumentar/disminuir-->
                        <tr>
                            <td class="ps-0 pt-0">
                                <div class="d-flex">
                                    <button
                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                                            class="btn btn-tele"
                                            id="menos"
                                            type="button"
                                    >
                                        <i class="fas fa-minus fa-xs"></i>
                                    </button>
                                    <input
                                            class="form-control border-start-0 border-end-0 text-center"
                                            type="number"
                                            style="width: 46px"
                                            id="contador"
                                            value="1"
                                            min="1"
                                    />
                                    <button
                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                                            class="btn btn-tele"
                                            id="mas"
                                            type="button"
                                    >
                                        <i class="fas fa-plus fa-xs"></i>
                                    </button>
                                </div>
                            </td>
                            <!--Botón añadir a carrito-->
                            <td class="text-end">
                                <button
                                        type="button"
                                        class="btn btn-tele btn-md mr-1 mb-2"
                                >
                                    <i class="fas fa-shopping-cart"></i> Añadir al carrito
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<!--JS-->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

