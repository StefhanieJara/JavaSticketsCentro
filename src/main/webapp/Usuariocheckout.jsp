<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 05/06/2022
  Time: 07:55 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <title>Centro Cultural PUCP- Checkout</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta charset="utf-8" />

        <link href="assets/css_2/bootstrap.css" rel="stylesheet" type="text/css" />
        <link
                href="assets/css_2/login_overlay.css"
                rel="stylesheet"
                type="text/css"
        />
        <link href="assets/css_2/style6.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="assets/css_2/shop.css" type="text/css" />
        <link rel="stylesheet" type="text/css" href="assets/css_2/checkout.css" />

        <link href="assets/css_2/style.css" rel="stylesheet" type="text/css" />
        <link href="assets/css_2/fontawesome-all.css" rel="stylesheet" />
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
        <div class="banner-top container-fluid" id="home">
            <!-- header -->
            <!--Cabecera Principal cliente-->
            <nav
                    class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger"
            >
                <div class="row w-100 align-items-center pe-sm-4 ps-0 my-2">

                    <div
                            class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2"
                    >
                        <a href="index.html"><img src="assets/img/logo.png" /></a>
                    </div>
                    <!--Buscador Pelicula-->
                    <div class="col-md-7 d-none d-md-block ps-0">

                        <div class="input-group">
                            <div style="width: 40%">
                                <input
                                        type="search"
                                        id="buscador_pelicula"
                                        class="form-control"
                                        placeholder="Busca una Pelicula"
                                />
                            </div>
                            <a
                                    role="button"
                                    class="btn btn-tele border-start-1"
                                    href="usuarioPeliculaBuscada.html"
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
                    <div
                            class="col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0"
                    >
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
        </div>
        <!--// header_top -->
        <!--checkout-->
        <section class="banner-bottom-wthreelayouts py-lg-5 py-3">
            <div class="container">
                <div class="inner-sec-shop px-lg-4 px-3">
                    <h3 class="tittle-w3layouts my-lg-4 mt-3">Verificar compra</h3>
                    <div class="checkout-right">
                        <h4>
                            Tu carrito de compras contiene
                            <span>3 Peliculas</span>
                        </h4>
                        <table class="timetable_sub">
                            <thead>
                                <tr>
                                    <th>Película</th>
                                    <th>Cantidad</th>
                                    <th>Nombre</th>

                                    <th>Precio</th>
                                    <th>Eliminar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="rem1">
                                    <td class="invert-image">
                                        <a href="single.html">
                                            <img
                                                    src="assets/img/s1.jpg"
                                                    alt=" "
                                                    class="img-responsive"
                                            />
                                        </a>
                                    </td>
                                    <td class="invert">
                                        <div class="quantity">
                                            <div class="quantity-select">
                                                <div class="entry value-minus">&nbsp;</div>
                                                <div class="entry value">
                                                    <span>1</span>
                                                </div>
                                                <div class="entry value-plus active">&nbsp;</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="invert">Thor Ragnarok</td>

                                    <td class="invert">s/.25.00</td>
                                    <td class="invert">
                                        <div class="rem">
                                            <div class="close1"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="rem2">
                                    <td class="invert-image">
                                        <a href="single.html">
                                            <img src="assets/img/s5.jpg" class="img-responsive" />
                                        </a>
                                    </td>
                                    <td class="invert">
                                        <div class="quantity">
                                            <div class="quantity-select">
                                                <div class="entry value-minus">&nbsp;</div>
                                                <div class="entry value">
                                                    <span>1</span>
                                                </div>
                                                <div class="entry value-plus active">&nbsp;</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="invert">Spiderman: No way home</td>

                                    <td class="invert">s/.25.00</td>
                                    <td class="invert">
                                        <div class="rem">
                                            <div class="close2"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="rem3">
                                    <td class="invert-image">
                                        <a href="single.html">
                                            <img
                                                    src="assets/img/s2.jpg"
                                                    alt=" "
                                                    class="img-responsive"
                                            />
                                        </a>
                                    </td>
                                    <td class="invert">
                                        <div class="quantity">
                                            <div class="quantity-select">
                                                <div class="entry value-minus">&nbsp;</div>
                                                <div class="entry value">
                                                    <span>1</span>
                                                </div>
                                                <div class="entry value-plus active">&nbsp;</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="invert">Doctor Strange: Multiverse of madness</td>

                                    <td class="invert">s/.25.00</td>
                                    <td class="invert">
                                        <div class="rem">
                                            <div class="close3"></div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="checkout-left row">
                        <div class="col-md-4 checkout-left-basket">
                            <h4>Seguir comprando</h4>
                            <ul>
                                <li>
                                    Pelicula 1
                                    <i>-</i>
                                    <span>s/.25.00 </span>
                                </li>
                                <li>
                                    Pelicula 2
                                    <i>-</i>
                                    <span>s/.25.00 </span>
                                </li>
                                <li>
                                    Pelicula 3
                                    <i>-</i>
                                    <span>s/.30.00 </span>
                                </li>
                                <li>
                                    Cargos totales por servicio
                                    <i>-</i>
                                    <span>s/.80.00</span>
                                </li>
                                <li>
                                    Total
                                    <i>-</i>
                                    <span>s/.80.00</span>
                                </li>
                            </ul>
                            <div class="col-md-8 address_form">
                                <div class="checkout-right-basket">
                                    <a href="payment.html">Realizar pago </a>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </section>
        <!--//checkout-->

        <!--jQuery-->
        <script src="assets/jquery-2.2.3.min.js"></script>
        <!-- newsletter modal -->
        <!--search jQuery-->
        <script src="assets/modernizr-2.6.2.min.js"></script>
        <script src="assets/classie-search.js"></script>
        <script src="assets/demo1-search.js"></script>
        <!--//search jQuery-->
        <!-- cart-js -->
        <script src="assets/minicart.js"></script>
        <script>
            googles.render();

            googles.cart.on("googles_checkout", function (evt) {
                var items, len, i;

                if (this.subtotal() > 0) {
                    items = this.items();

                    for (i = 0, len = items.length; i < len; i++) {}
                }
            });
        </script>
        <!-- //cart-js -->
        <script>
            $(document).ready(function () {
                $(".button-log a").click(function () {
                    $(".overlay-login").fadeToggle(200);
                    $(this).toggleClass("btn-open").toggleClass("btn-close");
                });
            });
            $(".overlay-close1").on("click", function () {
                $(".overlay-login").fadeToggle(200);
                $(".button-log a").toggleClass("btn-open").toggleClass("btn-close");
                open = false;
            });
        </script>
        <!-- carousel -->
        <!-- easy-responsive-tabs -->
        <script src="assets/easy-responsive-tabs.js"></script>
        <script>
            $(document).ready(function () {
                $("#horizontalTab").easyResponsiveTabs({
                    type: "default", //Types: default, vertical, accordion
                    width: "auto", //auto or any width like 600px
                    fit: true, // 100% fit in a container
                    closed: "accordion", // Start closed if in accordion view
                    activate: function (event) {
                        // Callback function if tab is switched
                        var $tab = $(this);
                        var $info = $("#tabInfo");
                        var $name = $("span", $info);
                        $name.text($tab.text());
                        $info.show();
                    },
                });
                $("#verticalTab").easyResponsiveTabs({
                    type: "vertical",
                    width: "auto",
                    fit: true,
                });
            });
        </script>
        <!--quantity-->
        <script>
            $(".value-plus").on("click", function () {
                var divUpd = $(this).parent().find(".value"),
                    newVal = parseInt(divUpd.text(), 10) + 1;
                divUpd.text(newVal);
            });

            $(".value-minus").on("click", function () {
                var divUpd = $(this).parent().find(".value"),
                    newVal = parseInt(divUpd.text(), 10) - 1;
                if (newVal >= 1) divUpd.text(newVal);
            });
        </script>
        <!--quantity-->
        <!--close-->
        <script>
            $(document).ready(function (c) {
                $(".close1").on("click", function (c) {
                    $(".rem1").fadeOut("slow", function (c) {
                        $(".rem1").remove();
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function (c) {
                $(".close2").on("click", function (c) {
                    $(".rem2").fadeOut("slow", function (c) {
                        $(".rem2").remove();
                    });
                });
            });
        </script>
        <script>
            $(document).ready(function (c) {
                $(".close3").on("click", function (c) {
                    $(".rem3").fadeOut("slow", function (c) {
                        $(".rem3").remove();
                    });
                });
            });
        </script>
        <!--//close-->

        <!-- dropdown nav -->
        <script>
            $(document).ready(function () {
                $(".dropdown").hover(
                    function () {
                        $(".dropdown-menu", this).stop(true, true).slideDown("fast");
                        $(this).toggleClass("open");
                    },
                    function () {
                        $(".dropdown-menu", this).stop(true, true).slideUp("fast");
                        $(this).toggleClass("open");
                    }
                );
            });
        </script>
        <!-- //dropdown nav -->
        <script src="assets/move-top.js"></script>
        <script src="assets/easing.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>

