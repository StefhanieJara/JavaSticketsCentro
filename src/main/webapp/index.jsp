<%--
  Created by IntelliJ IDEA.
  User: CARLOS
  Date: 5/06/2022
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Centro Cultural PUCP</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- CSS Personales-->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/estilos.css">
    <link rel="stylesheet" href="assets/css/estilosindex.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/5733880de3.js" crossorigin="anonymous"></script>
</head>
<body>
<!--Cabecera Principal cliente-->
<nav
        class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger"
>
    <div class="row w-100 align-items-center pe-sm-4 ps-0 my-2">
        <!--Logo Centro Cultural PUCP-->
        <div
                class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2"
        >
            <a class="navbar-brand py-0" href="#">
                <a href="index.html"><img src="img/logo.png" /></a>
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
                    href="<%=request.getContextPath()%>/UsuarioCarritoIndex"
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
<div class="offcanvas offcanvas-end text-center" tabindex="-1" id="menuDeUsuario" aria-labelledby="menuDeUsuario">
    <div class="d-flex align-items-center flex-column mb-3 vh-100">
        <!--Título y botón-->
        <div class="p-2 w-100">
            <div class="offcanvas-header border-bottom">
                <h5 class="mb-0">Menú de Usuario</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                        aria-label="Close"></button>
            </div>
        </div>
        <!--Foto usuario y opciones-->
        <div class="p-2">
            <div class="offcanvas-body p-3">
                <div class="d-flex flex-column">
                    <div class="my-2">
                        <h4 class="mb-3">Paco Perez</h4>
                        <img src="img/images.png"
                             class="rounded-circle mx-auto d-block mb-3 h-25 w-50" alt="profile image">
                    </div>
                    <div class="mb-3">
                        <div class="p-2">
                            <a href="<%=request.getContextPath()%>/UsuarioEditaPerfilServlet" class="text-dark text-decoration-none">
                                <span><i class="fas fa-user-edit"></i></span>
                                <span>Editar perfil</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a href="<%=request.getContextPath()%>/UsuarioHistorial_2Servlet" class="text-dark text-decoration-none">
                                <span><i class="fas fa-list"></i></span>
                                <span>Historial de tickets</span>
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

<!--Contenido de página-->
<main>
    <!--Alinear cabecera con contenido-->
    <div class="card-header my-5"></div><BR>
    <!--Farmacias-->


    <!-- Banner -->
    <!-- Banner presentación -->
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" role="listbox">
            <div class="carousel-caption text-center">
                <h1 style="margin-bottom: 20px"><mark><b>BIENVENIDOS AL</b></mark></h1>
                <h2 style="margin-bottom: 30px"><b>CENTRO CULTURAL PUCP</b></h2>
                <span>¡Disfruta de nuestra amplia cartelera de cine!</span>
            </div>
            <div class="carousel-item active">
                <img class="d-block w-100" src="img/banner1.jpg" alt="Escenario">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="img/banner2.jpg" alt="Principal">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Anterior</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Siguiente</span>
        </a>
    </div>
    <!-- -->

    <div class="container px-6 py-2">
        <div class="row">
            <h3 class="dist-name title-peliculas">Estrenos</h3>
            <div class="row container-pelicula">
                <div class="col-pelicula1">
                    <a href=""><img src="img/s1.jpg" class="imagenPeli" width="100%"></a>
                    <div class="textoPeliculas">Thor Ragnarok</div>
                </div>
                <div class="col-pelicula2">
                    <a href="<%=request.getContextPath()%>/UsuariodescripcionServlet?id=8"><img src="img/s2.jpg" class="imagenPeli" width="100%"></a>
                    <div class="textoPeliculas">Doctor Strange</div>
                </div>
                <div class="col-pelicula3">
                    <a href=""><img src="img/s5.jpg" class="imagenPeli" width="100%"></a>
                    <div class="textoPeliculas">Spiderman: No way Home</div>
                </div>
                <div class="col-pelicula4">
                    <a href=""><img src="img/s8.jpg" class="imagenPeli" width="100%"></a>
                    <div class="textoPeliculas">Eternals</div>
                </div>
            </div>
        </div>
    </div>

    <div class="container px-6 py-2">
        <div class="row">
            <h3 class="dist-name title-peliculas">Otras Películas</h3>
            <div class="row container-pelicula">
                <div class="col-pelicula1">
                    <a href=""><img src="img/linaLima.jpg" class="imagenPeli" width="100%"></a>
                    <div class="textoPeliculas">Lina Lima</div>
                </div>
                <div class="col-pelicula2">
                    <a href=""><img src="img/s7.jpg" class="imagenPeli" width="100%"></a>
                    <div class="textoPeliculas">Loki</div>
                </div>
                <div class="col-pelicula3">
                    <a href=""><img src="img/posterthor.jpg" class="imagenPeli" width="100%"></a>
                    <div class="textoPeliculas">Thor: Love and Thunder</div>
                </div>
                <div class="col-pelicula4">
                    <a href=""><img src="img/posteravatar.jpg" class="imagenPeli" width="100%"></a>
                    <div class="textoPeliculas">Avatar</div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="container px-5 py-2" id="custom-cards-san-miguel">
                <h4 class="dist-name" style="color:#E72D4B; font-weight: bold; margin-top: 30px">Nuestras Sedes</h4>
                <div class="row row-cols-1 row-cols-lg-3 g-4 py-3">
                    <!--SEDE 1-->
                    <div class="col">
                        <div onclick="" class="card card-farmacia f1">
                            <h2>Chacarilla</h2>
                            <ul>
                                <li>
                                    <i class="fas fa-map-marker-alt fa-xs"></i>
                                    <small>Calle Los Volados #420</small>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--SEDE 2-->
                    <div class="col">
                        <div onclick="href=''" class="card card-farmacia f2">
                            <h2>Lince</h2>
                            <ul>
                                <li>
                                    <i class="fas fa-map-marker-alt fa-xs"></i>
                                    <small>Los Amigues #310</small>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--SEDE 3-->
                    <div onclick="href=''" class="col">
                        <div class="card card-farmacia f3">
                            <h2>Miraflores</h2>
                            <ul>
                                <li>
                                    <i class="fas fa-map-marker-alt fa-xs"></i>
                                    <small>Jirón Los Desdes #123</small>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</main>

    <footer class="py-lg-5 py-4">
        <p class="copy-right text-center ">&copy; 2022 JavaSticket. All Rights Reserved</p>
    </footer>

    <!--JS-->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- JavaScript Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>