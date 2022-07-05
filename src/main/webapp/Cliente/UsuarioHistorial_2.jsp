<%@ page import="com.example.javasticketscentro.Beans.Bhistorial" %>
<%@ page import="com.example.javasticketscentro.Beans.Bhistorial_detalle" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.example.javasticketscentro.Beans.BPersona" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="lista" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.Bhistorial>" />
<jsp:useBean id="listaHistoriales" scope="request" type="java.util.ArrayList<java.util.ArrayList<com.example.javasticketscentro.Beans.Bhistorial_detalle>>" />

<% BPersona usuario=(BPersona)session.getAttribute("clienteLog");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
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
                    <a class="navbar-brand py-0">
                        <a href="<%=request.getContextPath()%>/"><img src="img/logo.png" /></a>
                    </a>
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
            <!--Boton retornar-->
            <div
                    class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex">
                <a
                        class="btn btn-tele-inverso"
                        role="button"
                        href="<%=request.getContextPath()%>/"
                >
                    <div style="font-size: 0.6rem">
                        <!--para cambios más precisos del tamaño-->
                        <i class="fa fa-caret-square-o-left fa-3x"></i>
                    </div>
                </a>
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
                                <h4 class="mb-3"><%=usuario.getNombre()+" "+usuario.getApellido()%></h4>
                                <img src="<%=usuario.getFoto().contains("http") ?usuario.getFoto() :request.getContextPath()+"/UsuarioEditaPerfilServlet?action=entregarImagen"%>"
                                     class="rounded-circle mx-auto d-block mb-3 h-25 w-50" alt="profile image">
                            </div>
                            <div class="mb-3">
                                <div class="p-2">
                                    <a href="<%=request.getContextPath()%>/UsuarioEditaPerfilServlet?id=<%=usuario.getIdPer()%>" class="text-dark text-decoration-none">
                                        <span><i class="fas fa-user-edit"></i></span>
                                        <span>Editar perfil</span>
                                    </a>
                                </div>
                                <div class="p-2">
                                    <a href="<%=request.getContextPath()%>/UsuarioHistorial_2Servlet?action=listar" class="text-dark text-decoration-none">
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
                        <a href="<%=request.getContextPath()%>/UsuariologinclientServlet?action=logout" class="text-dark text-decoration-none">
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
                                                <th class="col-1"></th>
                                                <th class="col-2">Codigo</th>
                                                <th class="col-1"></th>
                                                <th class="col-1">Total</th>
                                                <th class="col-1"></th>
                                                <th class="col-1">Detalles</th>
                                                <th class="col-1"></th>

                                            </tr>
                                        </thead>
                                        <!--AÑADO ADVERTENCIAS-->
                                        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                                            <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                            </symbol>
                                            <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
                                                <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                                            </symbol>
                                            <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                                                <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                            </symbol>
                                        </svg>
                                        <!---->
                                        <!--Pedidos-->
                                        <%int i=1;%>
                                        <tbody class="text-center">
                                            <!--Pedido 1-->
                                            <%for(Bhistorial ticket : lista) {%>
                                            <tr class="cell-1">
                                                <td name="FechaCompra" id="FechaCompra"><%=ticket.getFecha_compra()%></td>
                                                <td></td>
                                                <td name="CodigoTicket" id="CodigoTicket"><%=ticket.getCodigo()%></td>
                                                <td></td>
                                                <td name="CostoTotal" id="CostoTotal">S/<%=(Math.round(ticket.getTotal()*100.0)/100.0)%></td>
                                                <td></td>
                                                <td name="ObtenerFunciones" id="ObtenerFunciones"
                                                    class="table-elipse"
                                                    data-bs-toggle="collapse"
                                                    data-bs-target="#dt-<%=i%>"
                                                >
                                                    <a href="#" class="fas fa-ellipsis-h text-black-50"></a>
                                                </td>
                                                <td>
                                                </td>

                                            </tr>
                                            <!--Detalles pedido 1 (dt-1)-->
                                            <tr id="dt-<%=i%>" class="collapse cell-1 row-child">
                                                <td colspan="0.7">Película</td>
                                                <td colspan="0.7">Sede</td>
                                                <td colspan="0.7">Fecha</td>
                                                <td colspan="0.7">Estado</td>
                                                <td colspan="0.7">Precio </td>
                                                <td colspan="0.7">Unidades</td>
                                                <td colspan="0.7">Subtotal</td>
                                                <td colspan="0.7">Opcion</td>
                                            </tr>

                                            <%for(Bhistorial_detalle funcion : listaHistoriales.get(i-1)) {%>
                                            <tr id="dt-<%=i%>" class="collapse cell-1 row-child-rows">
                                                <td colspan="0.7"><%=funcion.getPelicula()%></td>
                                                <td colspan="0.7"><%=funcion.getSede()%></td>
                                                <td colspan="0.7"><%=funcion.getFecha()%></td>

                                                <% String datetime1 = funcion.getFecha();
                                                    String[] separados = datetime1.split(" - ");
                                                    String datetime2 = separados[0]+'T'+separados[1];
                                                    LocalDateTime fechayhora = LocalDateTime.parse(datetime2);
                                                    if(fechayhora.isAfter(LocalDateTime.now())){ %>
                                                <td><span class="badge bg-success">Vigente</span></td>
                                                <%}else{%>
                                                <td><span class="badge bg-secondary">Asistido</span></td>
                                                <%}%>

                                                <td colspan="0.7">S/<%=funcion.getPrecio()%></td>
                                                <td colspan="0.7"><%=funcion.getUnidades()%></td>
                                                <td colspan="0.7">S/<%=String.format("%.2f",(funcion.getUnidades()*funcion.getPrecio()))%></td>

                                                <% String datetime1_2 = funcion.getFecha();
                                                    String[] separados_2 = datetime1_2.split(" - ");
                                                    String datetime2_2 = separados_2[0]+'T'+separados_2[1];
                                                    LocalDateTime fechayhora_2 = LocalDateTime.parse(datetime2_2);
                                                    if(fechayhora_2.isAfter(LocalDateTime.now())){ %>
                                                <td colspan="0.7"><a href="<%=request.getContextPath()%>/UsuarioHistorial_2Servlet?action=borrar&idTicket=<%=ticket.getCodigo()%>&idFuncion=<%=funcion.getIdFuncion()%>" class="btn btn-danger">Cancelar</a></td>
                                                <%}else{%>
                                                <td colspan="0.7"><a href="<%=request.getContextPath()%>/calificarPelicula?action=listarP&id=<%=funcion.getIdPelicula()%> " type="button" class="btn btn-warning">Calificar</a></td>
                                                <%}%>

                                            </tr>
                                            <%}%>
                                            <%i++;%>
                                            <%}%>
                                        </tbody>
                                    </table>

                                    <%if(lista.size()==0){%>
                                    <div class="alert alert-secondary" role="alert">
                                        <h4 class="alert-heading"><svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Info:"><use xlink:href="#info-fill"/></svg>Todavía no has comprado nada!</h4>
                                        <hr>
                                        <p class="mb-0">Para completar tu primera compra, debes redirigirte al carrito de compras y cancelar tus pedidos! <a href="<%=request.getContextPath()%>/UsuarioCarritoIndex?action=listar" class="alert-link">Ir al carrito</a>.</p>
                                    </div>
                                    <%}%>
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

