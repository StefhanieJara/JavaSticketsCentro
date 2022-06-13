<%@ page import="com.example.javasticketscentro.Beans.Bhistorial" %>
<%@ page import="com.example.javasticketscentro.Beans.Bhistorial_detalle" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaHistorial" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.Bhistorial>" />
<jsp:useBean id="listaHistorial_detalle" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.Bhistorial_detalle>" />
<jsp:useBean id="textoBuscar" scope="request" type="java.lang.String" class="java.lang.String" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
        />
        <title>Centro Cultural PUCP - Historial de Compras</title>
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
        <nav class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger">
            <div class="row w-100 align-items-center pe-sm-4 ps-0 my-2">
                <!--Logo Centro Cultural PUCP-->
                <div class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2">
                    <a class="navbar-brand py-0" href="#">
                        <a href="index.html"><img src="img/logo.png" /></a>
                    </a>
                </div>
                <!--Buscador de peliculas-->
                <div class="col-md-7 d-none d-md-block ps-0">

                    <div class="input-group">
                        <div style="width: 50%">
                            <input
                                    type="search"
                                    id="buscador_pelicula"
                                    class="form-control"
                                    placeholder="Busca una pelicula"/>
                        </div>
                        <a
                                role="button"
                                class="btn btn-tele border-start-1"
                                href="usuariopeliculaBuscada.html"
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
                                            href="<%=request.getContextPath()%>/UsuarioEditaPerfilServlet"
                                            class="text-dark text-decoration-none"
                                    >
                                        <span><i class="fas fa-user-edit"></i></span>
                                        <span>Editar usuario</span>
                                    </a>
                                </div>
                                <div class="p-2">
                                    <a
                                            href="<%=request.getContextPath()%>/UsuarioHistorial_2Servlet"
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
                <!--cerrar sesión-->
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

        <!--Card Historial de Compras-->
        <div class="container-transition">
            <div class="container-sidebar">
                <div class="card-w-sidebar">
                    <div class="card">
                        <!--Título-->
                        <div class="card-header card-header-tele">
                            <h4 class="my-2">Historial de Compras</h4>
                        </div>
                        <!--Contenido-->
                        <div class="card-body">
                            <div class="rounded py-2">
                                <div class="table-responsive">
                                    <table class="table">
                                        <!--Cabecera pedidos-->
                                        <thead>
                                            <tr class="text-center">
                                                <th class="col-2">Fecha de compra</th>
                                                <th class="col-1">código</th>
                                                <th class="col-2">Sede</th>
                                                <th class="col-1">Total</th>
                                                <th class="col-1">Detalles</th>
                                            </tr>
                                        </thead>
                                        <!--Pedidos-->
                                        <tbody class="text-center">
                                        <% int i = 1;
                                            for (Bhistorial historial  : listaHistorial) { %>
                                            <tr class="cell-1">
                                                <td>
                                                    <i class="far fa-clock"></i>&nbsp;&nbsp;<%historial.getFecha_compra()%>
                                                </td>
                                                <td><%historial.getCodigo()%></td>
                                                <td><%historial.getSede()%></td>
                                                <td>s/ <%historial.getTotal()%></td>
                                                <td
                                                        class="table-elipse"
                                                        data-bs-toggle="collapse"
                                                        data-bs-target="#dt-2"
                                                >
                                                    <i class="fas fa-ellipsis-h text-black-50"></i>
                                                </td>
                                            </tr>
                                            <!--Detalles pedido-->
                                            <tr id="dt-1" class="collapse cell-1 row-child">
                                                <td colspan="1" class="">Unidades</td>
                                                <td colspan="2">Película</td>
                                                <td colspan="2">Fecha de la funcion</td>
                                                <td colspan="2">Precio por ticket</td>
                                                <td colspan="2">Total</td>
                                                <td colspan="2">Estado</td>
                                            </tr>
                                            <% int j = 1;
                                                for (Bhistorial_detalle detalle : listaHistorial_detalle) { %>
                                            <tr id="dt-1" class="collapse cell-1 row-child-rows">
                                                <td colspan="1" class=""><%detalle.getUnidades()%></td>
                                                <td colspan="2">
                                                    <%detalle.getPelicula()%>
                                                </td>
                                                <td colspan="2">
                                                    <%detalle.getFecha()%>
                                                </td>
                                                <td colspan="2">
                                                    <%detalle.getPrecio()%>
                                                </td>
                                                <td colspan="2">
                                                    <%detalle.getTotal()%>
                                                </td>
                                                <td><span class="badge bg-success"><%detalle.getEstado()%></span></td>

                                            </tr>
                                            <% j ++;
                                            }%>
                                            <tr id="dt-1" class="collapse cell-1 row-child">
                                                <td colspan="7">
                                                    <button type="button" class="btn btn-danger">
                                                        Cancelar pedido
                                                    </button>
                                                </td>
                                            </tr>
                                            <% i ++;
                                            } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--JS-->
        <script src="main.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>


