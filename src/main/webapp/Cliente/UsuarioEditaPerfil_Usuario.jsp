<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 05/06/2022
  Time: 08:36 p. m.
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
                                src="img/images.png"
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
                                        placeholder="71834998"
                                        readonly
                                />
                            </div>
                        </div>
                        <div class="row g-3 align-items-center mt-2">

                            <div class="rows-auto">
                                <label for="inputtext6" class="col-form-label"
                                >Código</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input
                                        type="number"
                                        id="inputtext6"
                                        class="form-control"
                                        aria-describedby="textHelpInline"
                                        placeholder="20108992"
                                        readonly
                                />
                            </div>
                        </div>
                        <div class="row g-3 align-items-center mt-2">

                            <div class="rows-auto">
                                <label for="inputtext6" class="col-form-label"
                                >Nombre</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input
                                        type="text"
                                        id="inputtext6"
                                        class="form-control"
                                        aria-describedby="textHelpInline"
                                        placeholder="Olivia"
                                />
                            </div>
                        </div>
                        <div class="row g-3 align-items-center mt-2">

                            <div class="rows-auto">
                                <label for="inputtext6" class="col-form-label"
                                >Apellido</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input
                                        type="text"
                                        id="inputtext6"
                                        class="form-control"
                                        aria-describedby="textHelpInline"
                                        placeholder="Rodrigo"
                                />
                            </div>
                        </div>
                        <div class="row g-3 align-items-center mt-2">

                            <div class="rows-auto">
                                <label for="inputtext6" class="col-form-label"
                                >Teléfono</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input
                                        type="number"
                                        id="inputtext6"
                                        class="form-control"
                                        aria-describedby="textHelpInline"
                                        placeholder="975575955"
                                />
                            </div>
                        </div>
                        <div class="row g-3 align-items-center mt-2">
                            <div class="rows-auto">
                                <label for="inputtext6" class="col-form-label"
                                >Fecha de Nacimiento</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input
                                        type="date"
                                        id="inputtext6"
                                        class="form-control"
                                        aria-describedby="textHelpInline"

                                />
                            </div>
                        </div>
                        <div class="row g-3 align-items-center mt-2">
                            <div class="rows-auto">
                                <label for="inputtext6" class="col-form-label"
                                >Dirección</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input
                                        type="text"
                                        id="inputtext6"
                                        class="form-control"
                                        aria-describedby="textHelpInline"
                                        placeholder="Av La Alameda 256 SMP"
                                />
                            </div>
                        </div>
                        <div class="row g-3 align-items-center mt-2">
                            <div class="rows-auto">
                                <label for="inputtext6" class="col-form-label"
                                >Email de Respaldo</label
                                >
                            </div>
                            <div class="rows-auto">
                                <input
                                        type="email"
                                        id="inputtext6"
                                        class="form-control"
                                        aria-describedby="textHelpInline"
                                        placeholder="david@gmail.com"
                                />
                            </div>

                            <div class="rows-auto">
                                <button
                                        type="submit"
                                        class="btn btn-primary"
                                        style="
                        background-color: orange;
                        border-color: orange;
                        color: white;
                      "
                                >
                                    Guardar
                                </button>
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
    </form>
</main>

<!--JS-->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>
<script src="assets/appSubirImagen.js"></script>
</body>
</html>
