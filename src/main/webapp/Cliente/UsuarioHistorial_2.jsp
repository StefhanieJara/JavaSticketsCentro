<%@ page import="com.example.javasticketscentro.Beans.Bhistorial" %>
<%@ page import="com.example.javasticketscentro.Beans.Bhistorial_detalle" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="lista" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.Bhistorial>" />
<jsp:useBean id="listaHistoriales" scope="request" type="java.util.ArrayList<java.util.ArrayList<com.example.javasticketscentro.Beans.Bhistorial_detalle>>" />
<jsp:useBean id="idClient" scope="request" type="java.lang.Integer"/>

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
        <nav
                class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger"
        >
            <div class="row w-100 align-items-center pe-sm-4 ps-0 my-2">
                <!--Logo Centro Cultural PUCP-->
                <div
                        class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2">
                    <a class="navbar-brand py-0" href="#">
                        <a href="index.html"><img src="|img/logo.png" /></a>
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
                                                <th class="col-1">Codigo</th>
                                                <th class="col-2">Total</th>
                                                <th class="col-2">Detalles</th>
                                            </tr>
                                        </thead>
                                        <!--Pedidos-->
                                        <%int i=1;%>
                                        <tbody class="text-center">
                                            <!--Pedido 1-->
                                            <%for(Bhistorial ticket : lista) {%>
                                            <tr class="cell-1">
                                                <td name="FechaCompra" id="FechaCompra"><%=ticket.getFecha_compra()%></td>
                                                <td name="CodigoTicket" id="CodigoTicket"><%=ticket.getCodigo()%></td>
                                                <td name="CostoTotal" id="CostoTotal">S/<%=ticket.getTotal()%></td>
                                                <td name="ObtenerFunciones" id="ObtenerFunciones"
                                                        class="table-elipse"
                                                        data-bs-toggle="collapse"
                                                        data-bs-target="#dt-<%=i%>"
                                                >
                                                    <a href="#" class="fas fa-ellipsis-h text-black-50"></a>
                                                </td>
                                            </tr>
                                            <!--Detalles pedido 1 (dt-1)-->
                                            <tr id="dt-<%=i%>" class="collapse cell-1 row-child">
                                                <td colspan="0.7">Unidades</td>
                                                <td colspan="0.7">Película</td>
                                                <td colspan="0.7">Sede</td>
                                                <td colspan="0.7">Fecha</td>
                                                <td colspan="0.7">Precio </td>
                                                <td colspan="0.7">Subtotal</td>
                                                <td colspan="0.7">Estado</td>
                                                <td colspan="0.7">Opcion</td>
                                            </tr>

                                            <%for(Bhistorial_detalle funcion : listaHistoriales.get(i-1)) {%>
                                            <tr id="dt-<%=i%>" class="collapse cell-1 row-child-rows">
                                                <td colspan="0.7"><%=funcion.getUnidades()%></td>
                                                <td colspan="0.7"><%=funcion.getPelicula()%></td>
                                                <td colspan="0.7"><%=funcion.getSede()%></td>
                                                <td colspan="0.7"><%=funcion.getFecha()%></td>
                                                <td colspan="0.7">S/<%=funcion.getPrecio()%></td>
                                                <td colspan="0.7">S/<%=(funcion.getUnidades()*funcion.getPrecio())%></td>
                                                <% String datetime1 = funcion.getFecha();
                                                    String[] separados = datetime1.split(" - ");
                                                    String datetime2 = separados[0]+'T'+separados[1];
                                                    LocalDateTime fechayhora = LocalDateTime.parse(datetime2);
                                                    if(fechayhora.isAfter(LocalDateTime.now())){ %>
                                                <td><span class="badge bg-success">Vigente</span></td>
                                                <td colspan="0.7"><a href="<%=request.getContextPath()%>/UsuarioHistorial_2Servlet?a=borrar&idTicket=<%=ticket.getCodigo()%>&idFuncion=<%=funcion.getIdFuncion()%>" class="btn btn-danger">Cancelar</a></td>
                                                <%}else{%>
                                                <td><span class="badge bg-secondary">Asistido</span></td>
                                                <td colspan="0.7"><a href="<%=request.getContextPath()%>/calificarPelicula?action=listarP&idPersona=<%=idClient%>&idPelicula=<%=funcion.getIdPelicula()%>" type="button" class="btn btn-warning">Calificar</a></td>
                                                <%}%>
                                            </tr>
                                            <%}%>
                                            <%i++;%>
                                            <%}%>
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

