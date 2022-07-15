<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.javasticketscentro.Beans.BCelebridad" %>
<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 5/06/2022
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaCelebridades" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BCelebridad>" />
<jsp:useBean id="puedeElimimar" scope="request" type="java.util.ArrayList<java.lang.Boolean>"/>
<jsp:useBean id="pagina" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="cant_paginas" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="filtro" scope="request" type="java.lang.String"/>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>PUCP-Lista de Actores y Directores</title>
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
<!--Botón flotante "+" para agregar producto-->
<a href="<%=request.getContextPath()%>/ADServlet?action=agregar" class="btn-float">
    <i class="fas fa-plus my-float"></i>
</a>

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
                <a href="<%=request.getContextPath()%>/AdminIndexServlet?action=index"><img src="img/logo.png" with="188px" height="97px"/></a>
            </a>
        </div>
        <!--Espacio-->
        <div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0"></div>
        <!--Espacio-->

        <!--Menú-->
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
        <!--Boton atras-->
        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <button class="btn" type="button" style=" color: white">
                <div style="font-size: 0.62rem">
                    <a href="<%=request.getContextPath()%>/AdminIndexServlet">
                    <i class="fa fa-caret-square-o-left fa-3x" style='color: #fff'></i></a>
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
            <div class="p-2 w-100">
                <div class="offcanvas-header border-bottom">
                    <h5 class="mb-0">Menú de Administrador</h5>
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
                            <h4 class="mb-3"><%=clienteLog.getNombre()+" "+clienteLog.getApellido()%></h4>
                            <img
                                    src="<%=clienteLog.getFoto()%>"
                                    class="rounded-circle mx-auto d-block mb-3 h-25 w-50"
                                    alt="profile image"
                            />
                        </div>
                        <div class="mb-3">
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/AdminIndexServlet?action=gestionSalas"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Gestione Salas</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/AdminIndexServlet?action=gestionCelebridad"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Añadir Actores y Directores</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/AdminIndexServlet?action=gestionOperadores"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Visualizar Operadores</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/AdminIndexServlet?action=gestionClientes"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Visualizar Lista de Clientes</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/AdminEditaPerfilServlet"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-user-edit" aria-hidden="true"></i></span>
                                    <span>Editar Perfil</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
<!--Contenido página-->
<main>
    <!--Alinear cabecera con contenido-->
    <div class="card-header mt-5 mb-4"></div>

    <!--Pestañas visualización y gestión-->
    <ul class="nav nav-tabs nav-fill mb-4 justify-content-around px-5">
        <li class="nav-item">
            <a class="nav-link text-white active" aria-current="page" href="#"
            ><h2>Lista de Actores y Directores</h2></a
            >
        </li>
    </ul>

    <!--Barra de búsqueda producto-->
    <form class="mb-4" method="post" action="<%=request.getContextPath()%>/ADServlet?action=buscar">
        <div class="input-group justify-content-center">
            <div class="form-outline" style="width: 36%">
                <input type="hidden" name="pagina" value="1">
                <input type="search" id="form1" name="filtro" class="form-control" value="<%=filtro%>" placeholder="Busque por Nombre y Apellido | Ejemplo: Jhon Ruiz"/>
            </div>
            <button type="submit" class="btn btn-tele border-start-1">
                <i class="fas fa-search"></i>
            </button>
        </div>
    </form>

    <% int a = 0;
    for (BCelebridad celebridad : listaCelebridades ) {%>
    <!--Celebridad-->
    <hr class="mx-md-5 mx-sm-3" />
    <!--Celebridad-->
    <div class="row justify-content-center align-items-start my-2">
        <!--Nombre del producto e imagen referencial-->
        <div class="col-md-2 text-center mt-2">
            <img
                    class="w-75"
                    src="<%=celebridad.getFoto()%>"
                    style="max-height: 400px; max-width: 250px"/>
        </div>
        <!--Rol-->
        <div class="col-md-1 text-center mt-5 d-none d-md-block">
            <h6>Rol</h6>
            <p style="font-size: larger"><%=celebridad.getRol()%></p>
            <p hidden><%=celebridad.getIdCelebridad()%></p>
        </div>
        <!--Descripción de la celebridad-->
        <div class="col-md-2 mt-5 d-none d-md-block">
            <h6>Nombre</h6>
            <p><%=celebridad.getNombre()%> <%=celebridad.getApellido()%></p>
        </div>
        <!--Botones de editar y eliminar-->
        <div class="col-sm-1 mt-5 d-none d-md-block text-around">
            <form method="post" action="<%=request.getContextPath()%>/ADServlet?action=editar">
                <input type="hidden" name="idCelebridad" value="<%=celebridad.getIdCelebridad()%>">
            <button type="submit"
                    class="btn-tele p-3 rounded">
                <i class="far fa-edit "></i>
            </button>
            </form>
            <hr class="my-1" style="background-color: white" />
                <button
                        class="btn btn-danger p-3"
                        type="button"
                        data-bs-toggle="modal"
                        data-bs-target="#confirmacion<%=a%>">
                    <i class="fas fa-times-circle"></i>
                </button>

        </div>

    </div>

    <div class="modal fade"
         id="confirmacion<%=a%>"
         tabindex="-1"
         aria-labelledby="conf_eliminar"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content border-0">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="conf_eliminar">Eliminar Actor o Director</h5>
                    <button
                            type="button"
                            class="btn-close btn-close-white"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                    ></button>
                </div>
                <div class="modal-body">
                    <%if(!puedeElimimar.get(a)){%>
                    <center>
                        <div class="modal-title dist-name">Participa en una película. No es posible eliminar a la Celebridad.</div>
                    <%}else{%>
                    Este actor o director será eliminado y ya no podra recuperar la
                    información.<br>
                        <center>
                        <form  class=" dist-name">
                            ¿Está seguro que desea eliminarlo de la lista?
                        </form>
                    <%}%>

                        <a href="<%=request.getContextPath()%>/ADServlet">

                            <button type="button"
                                    class="btn btn-secondary"
                                    style="margin-top: 15px;"
                                    data-bs-dismiss="modal">Cancelar</button>
                        </a>
                        <%if(puedeElimimar.get(a)){%>
                        <a href="<%=request.getContextPath()%>/ADServlet?action=eliminar&id=<%=celebridad.getIdCelebridad()%>">

                            <button type="button" class="btn btn-danger">Eliminar </button>
                        </a>
                        <%}%>
                    </center>
                </div>
                </div>
            </div>
        </div>
    </div>
    <% a++;
    %>
    </div>
    <%}%>
    <%if(cant_paginas>1){%>
    <!--Paginación-->
    <div class="container">
        <div class="d-flex justify-content-center my-3">
            <nav aria-label="paginacion_productos">
                <ul class="pagination">
                    <form method="post" action="<%=request.getContextPath()%>/ADServlet?action=buscar">
                        <input type="hidden" name="pagina" value="<%=pagina-1%>">
                        <input type="hidden" name="filtro" value="<%=filtro%>">
                        <%if(pagina==1){%>
                        <li class="page-item disabled">
                            <a class="page-link">Anterior</a>
                        </li>
                        <%}else{%>
                        <li class="page-item">
                            <button type="submit" class="page-link">Anterior</button>
                        </li>
                        <%}%>
                    </form>
                    <%for(int i=1;i<=cant_paginas;i++){%>
                    <form method="post" action="<%=request.getContextPath()%>/ADServlet?action=buscar">
                        <input type="hidden" name="pagina" value="<%=i%>">
                        <input type="hidden" name="filtro" value="<%=filtro%>">
                        <%if(i==pagina){%>
                        <li class="page-item active"><button type="submit" class="page-link" href="#"><%=i%></button></li>
                        <%}else{%>
                        <li class="page-item"><button type="submit" class="page-link" href="#"><%=i%></button></li>
                        <%}%>
                    </form>
                    <%}%>
                    <form method="post" action="<%=request.getContextPath()%>/ADServlet?action=buscar">
                        <input type="hidden" name="pagina" value="<%=pagina+1%>">
                        <input type="hidden" name="filtro" value="<%=filtro%>">
                        <%if(pagina==cant_paginas){%>
                        <li class="page-item disabled">
                            <a class="page-link" href="#">Siguiente</a>
                        </li>
                        <%}else{%>
                        <li class="page-item">
                            <button type="submit" class="page-link" href="#">Siguiente</button>
                        </li>
                        <%}%>
                    </form>
                </ul>
            </nav>
        </div>
    </div>
    <%}%>
</main>

<!--JS-->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
