<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 05/06/2022
  Time: 09:14 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>PUCP-Carrito de compras</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/estilos.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/5733880de3.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="assets/css_2/checkout.css" />
    <script
            src="https://kit.fontawesome.com/5733880de3.js"
            crossorigin="anonymous"></script>

</head>
<body>
<!--Cabecera Principal cliente-->
<nav class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger">
    <div class="row w-100 align-items-center pe-sm-4 ps-0 my-2">
        <!--Logo Centro Cultural PUCP-->
        <div class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2">
            <a href="indexServlet"><img src="img/logo.png" /></a>
        </div>
        <!--Buscador de productos-->
        <div class="col-md-7 d-none d-md-block ps-0"> <!--desaparece en menores a medium-->
            <div class="input-group">
                <div style="width: 40%">
                    <input type="search" id="buscador_producto" class="form-control" placeholder="Busca un producto"/>
                </div>
                <a role="button" class="btn btn-tele border-start-1" href="usuarioProductoBuscado.html">
                    <i class="fas fa-search"></i>
                </a>
            </div>
        </div>
        <!--Carrito-->
        <div class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end ">
            <a class="btn btn-tele-inverso" role="button" href="UsuarioCarritoIndex">
                <div style="font-size: 0.60rem"> <!--para cambios más precisos del tamaño-->
                    <i class="fas fa-cart-plus fa-3x"></i>
                </div>
            </a>
        </div>
        <!--Menú usuario-->
        <div class="col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <button class="btn btn-tele-inverso" type="button" data-bs-toggle="offcanvas" data-bs-target="#menuDeUsuario"
                    aria-controls="menuDeUsuario">
                <div style="font-size: 0.62rem">
                    <i class="fas fa-user-circle fa-3x"></i>
                </div>
            </button>
        </div>
    </div>
</nav>

<!--Menú de usuario-->
<div class="offcanvas offcanvas-end text-center" tabindex="-1" id="menuDeUsuario"
     aria-labelledby="menuDeUsuario">
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
                            <a href="UsuarioEditaPerfilServlet" class="text-dark text-decoration-none">
                                <span><i class="fas fa-user-edit"></i></span>
                                <span>Editar usuario</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a href="UsuarioHistorial_2Servlet" class="text-dark text-decoration-none">
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
                <a href="indexServlet" class="text-dark text-decoration-none">
                    <span><i class="fas fa-sign-out-alt"></i></span>
                    <span>Cerrar sesión</span>
                </a>
            </div>
        </div>
    </div>
</div>

<!--Contenido-->
<main>
    <!--Alinear cabecera con contenido-->
    <div class="card-header my-5"></div>
    <!--Carrito-->
    <div class="container pb-5 mt-2 mt-md-3">
        <div class="row">
            <!--Productos en carrito-->
            <div class="col-md-9 col-xl-8">
                <!--Items de la 1-->
                <div>
                    <!--Nombre cabecera-->
                    <h3 class="cart-header px-4 py-3">
                        <span>Funciones Seleccionadas</span>
                    </h3>
                    <!--Producto-->
                    <div class="d-sm-flex justify-content-between my-4 px-lg-2 px-xl-5 pb-4 border-bottom">
                        <!--Bloque 1-->
                        <div class="d-sm-flex">
                            <!--Imagen del producto-->
                            <div class="cart-item-thumb mx-auto">
                                <img src="img/doctorStrange.jpg"
                                     class="img-carrito">
                            </div>
                            <!--Info del producto-->
                            <div class="pt-1 pt-md-3 ps-sm-3 ps-0 text-sm-start text-center">
                                <!--Nombre-->
                                <h5 class="mb-sm-3 mb-1">Doctor Strange</h5>
                                <!--Precios-->
                                <div>
                                    <span class="text-muted">Precio:</span>
                                    <span class="font-size-lgr ms-sm-2 ms-0 ">s/ 30</span>
                                </div>
                                <div>
                                    <span class="text-muted">Hora:</span>
                                    <span class="font-size-lgr ms-sm-2 ms-0 ">14:30</span>
                                </div>

                            </div>
                            <div class="pt-1 pt-md-3 ps-sm-3 ps-0 text-sm-start text-center">
                                <br>
                                <!--Fecha-->
                                <div>
                                    <span class="text-muted">Fecha:</span>
                                    <span class="ms-sm-2 ms-0 ">17/02/2023</span>
                                </div>
                                <!--Sede-->
                                <div>
                                    <span class="text-muted">Sede:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <span class="font-size-lgr ms-sm-2 ms-0 ">Lince</span>
                                </div>
                                <!--Sala-->
                                <div>
                                    <span class="text-muted">Sala:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <span class="font-size-lgr ms-sm-2 ms-0 ">2</span>
                                </div>
                            </div>
                        </div>
                        <!--Bloque 2-->
                        <div class="pt-sm-0 pt-2 pe-md-3 pe-0 mx-sm-0 mx-auto text-sm-left text-center"
                             style="max-width: 10rem;">
                            <!--Cantidad-->
                            <div class="form-group mt-sm-4 mt-0">
                                <!--Label-->
                                <span class="text-muted">Cantidad:</span>
                                <!--Botones-->
                                <div class="d-flex justify-content-center">
                                    <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                                            class="btn btn-tele" id="menos" type="button">
                                        <i class="fas fa-minus fa-xs"></i>
                                    </button>
                                    <input class="form-control border-start-0 border-end-0 text-center"
                                           type="number" style="width:46px;" id="contador"
                                           value="1" min="1"/>
                                    <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                                            class="btn btn-tele" id="mas" type="button">
                                        <i class="fas fa-plus fa-xs"></i>
                                    </button>
                                </div>
                            </div>
                            <!--Botón agregar-->
                            <button class="btn btn-success btn-sm mt-sm-4 mt-2 w-100" type="button">
                                Agregar
                            </button>
                            <!--Botón borrar-->
                            <button class="btn btn-danger btn-sm mt-sm-4 mt-2 w-100" type="button">
                                <i class="far fa-trash-alt"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <!--Costo total-->
            <div class="col-md-3 col-xl-4 pt-3 pt-md-0">
                <div class="row">
                    <!--Cabecera resumen-->
                    <h3 class="cart-header px-4 py-3 justify-content-center">Resumen</h3>
                    <!--Tabla resumen-->
                    <div class="table-responsive">
                        <table class="table table-striped text-center mb-0">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Producto</th>
                                <th scope="col">Sede</th>
                                <th scope="col">Subtotal</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="text-center">3</td>
                                <td>Doctor Strange</td>
                                <td>Lince</td>
                                <td>s/ 60</td>
                            </tr>
                            <tr>
                                <td class="text-center">4</td>
                                <td>Lina de Lima</td>
                                <td>Miraflores</td>
                                <td>s/ 120</td>
                            </tr>
                            <tr>
                                <td class="text-center">15</td>
                                <td>Taxi Driver</td>
                                <td>Chacarilla</td>
                                <td>s/ 60</td>
                            </tr>
                            <tr>
                                <td class="text-center">2</td>
                                <td>El Padrino</td>
                                <td>Lince</td>
                                <td>s/ 60</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--Total-->
                    <div class="h4 text-center py-2">
                        <span class="font-size-lg">Total:</span>
                        <span>&nbsp;s/ 325.00</span>
                    </div>
                    <div class="d-flex justify-content-center">
                        <a href="<%=request.getContextPath()%>/UsuarioCarritoIndex?a=pagar" class="btn btn-danger"
                        >Pagar</a
                        >
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!--JS-->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
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
</body>
</html>