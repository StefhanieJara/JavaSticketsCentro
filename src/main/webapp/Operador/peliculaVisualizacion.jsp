<%@ page import="com.example.javasticketscentro.Beans.BPelicula" %><%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 06/06/2022
  Time: 00:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listapeliculas" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BPelicula>" />
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<jsp:useBean id="pagina" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="cant_paginas" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="sePuedeEditar" scope="request" type="java.util.ArrayList<java.lang.Boolean>"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
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
    <%session.removeAttribute("nombrefil");session.removeAttribute("apellidofil");%>
<!--Botón flotante "+" para agregar producto-->
<a href="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=crear" class="btn-float">
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
            <a class="navbar-brand py-0">
                <a href="<%=request.getContextPath()%>/"><img src="img/logo.png" with="188px" height="97px"></a>
            </a>
        </div>
        <!--Espacio-->
        <div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0"></div>
        <!--Espacio-->

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
        <!--Boton retornar-->
        <div
                class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex">
            <a
                    class="btn btn-tele-inverso"
                    role="button"
                    href="<%=request.getContextPath()%>/indexOperadorServlet"
            >
                <div style="font-size: 0.6rem">
                    <!--para cambios más precisos del tamaño-->
                    <i class="fa fa-caret-square-o-left fa-3x"></i>
                </div>
            </a>
        </div>
    </div>
</nav>

    <div
            class="offcanvas offcanvas-end text-center"
            tabindex="-1"
            id="offcanvasWithBackdrop"
            aria-labelledby="offcanvasWithBackdropLabel"
    >
        <div class="d-flex align-items-center flex-column mb-3 vh-100">
            <div class="p-2 w-100">
                <div class="offcanvas-header border-bottom">
                    <h5 class="mb-0">Menú de Operador</h5>
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
                                    src="<%=clienteLog.getFoto().contains("http") ?clienteLog.getFoto() :request.getContextPath()+"/UsuarioEditaPerfilServlet?action=entregarImagen"%>"
                                    class="rounded-circle mx-auto d-block mb-3 h-25 w-50"
                                    alt="profile image"
                            />
                        </div>
                        <div class="mb-3">
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/personalServlet"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Gestione Personal</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/OperadorFuncionesServlet"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Gestione Funciones</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/peliculaVisualizacionServlet"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Gestione Películas</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/operador_estadisticasServlet"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Visualizar Estadísticas</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/UsuarioEditaPerfilServlet"
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
            ><h1>Lista de Peliculas</h1></a
            >
        </li>
    </ul>

    <!--Barra de búsqueda producto-->
    <form class="mb-4" method="post" action="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=buscar">
        <div class="input-group justify-content-center">
            <div class="form-outline" style="width: 36%">
                <input  value="<%=session.getAttribute("filtrnombre")==null?"":session.getAttribute("filtrnombre")%>"
                        name="filtrnombre"
                        type="search"
                        class="form-control"
                        placeholder="Buscar Película"/>
            </div>
            <button type="submit" class="btn btn-tele border-start-1">
                <i class="fas fa-search"></i>
            </button>
        </div>
        <br>
    </form>
    <%if(session.getAttribute("filtrnombre")!=null){%>
    <%if(!session.getAttribute("filtrnombre").equals("")&&listapeliculas.size()!=0){%>
    <h3 class="dist-name title-peliculas">Resultados de su búsqueda</h3>
    <%}if(listapeliculas.size()==0){%>
    <h3 class="dist-name title-peliculas">No se encontraron resultados :(</h3>
    <%}}session.removeAttribute("peliEditar");%>

    <!--Productos-->
    <% int i=0; for (BPelicula pelicula : listapeliculas ) {%>
    <hr class="mx-md-5 mx-sm-3" />
    <!--Producto 1-->
    <div class="row justify-content-center align-items-start">
        <!--Nombre del producto e imagen referencial-->
        <tr>
        <div class="col-md-2 text-center mt-2">
            <h4><%=pelicula.getNombre()%></h4>
            <img
                    class="w-100"
                    src="<%=pelicula.getFoto()%>"
                    style="max-height: 400px; max-width: 250px"/>
        </div>
        <!--Descripción del producto-->
        <div class="col-md-6 mt-5 d-none d-md-block">
            <h6>Sinopsis</h6>
            <p class="mb-4">
                <%=pelicula.getSinopsis()%>
            </p>
            <h6>Restriccion de Edad</h6>
            <p class="mb-4">
                <%=pelicula.getRestriccionEdad()%>
            </p>
            <h6>Duración</h6>
            <p class="mb-4">
                <%=pelicula.getDuracion()%>
            </p>
            <h6>Género</h6>
            <p class="mb-4">
                <%=pelicula.getGenero()%>
            </p>
            <h6>Estado</h6>
                <%if(pelicula.getEstado()==1){%>
                <p class="mb-4">Habilitado</p>
                <%}else{%>
                <p class="mb-4">Deshabilitado</p>
                <%}%>
            </p>
        </div>
        <!--Botones de editar y eliminar-->
        <div class="col-sm-1 mt-5 d-none d-md-block text-center">
            <div class="col-sm-1 d-none d-md-block text-around">
                <%if(sePuedeEditar.get(i)){%>
                <form action="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=editar" method="post">
                    <input type="hidden" value="<%=pelicula.getIdPelicula()%>" name="idPeli">
                    <button type="submit"
                            class=" btn btn-tele py-0 px-1">
                        <i class="far fa-edit "></i>
                    </button>
                </form>
                <%}else{%>
                <button type="button"
                        class="btn btn-tele py-0 px-1"
                        data-bs-toggle="modal"
                        data-bs-target="#editar<%=i%>">
                    <i class="far fa-edit "></i>
                </button>
                <%}%>
                <hr class="my-1" style="background-color: white" />
                <button type="button"
                        class="btn btn-danger py-0 px-1"
                        data-bs-toggle="modal"
                        data-bs-target="#eliminar<%=i%>">
                    <i class="fas fa-times-circle"></i>
                </button>

            </div>
        </div>
    </div>

    <hr class="mx-md-5 mx-sm-3" />
    <%i++;}%>
    <!--Paginación-->
    <%if(cant_paginas!=1){%>
    <div class="container">
        <div class="d-flex justify-content-center my-3">
            <nav aria-label="paginacion_productos">
                <ul class="pagination">
                    <form method="post" action="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=paginar">
                        <input type="hidden" name="pagina" value="<%=pagina-1%>">
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

                    <%for(i=1;i<=cant_paginas;i++){%>
                    <form method="post" action="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=paginar">
                        <input type="hidden" name="pagina" value="<%=i%>">
                        <%if(i==pagina){%>
                        <li class="page-item active"><button type="submit" class="page-link" href="#"><%=i%></button></li>
                        <%}else{%>
                        <li class="page-item"><button type="submit" class="page-link" href="#"><%=i%></button></li>
                        <%}%>
                    </form>
                    <%}%>
                    <form method="post" action="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=paginar">
                        <input type="hidden" name="pagina" value="<%=pagina+1%>">
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
    <!--Modal eliminar producto: Producto pendiente para pedido-->

    <%i=0; for (BPelicula pelicula : listapeliculas ) {%>

    <div class="modal fade" id="eliminar<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
        <div class="modal-dialog">
            <div class="modal-content border-0">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" ><%=pelicula.getEstado()==1?"¡Advertencia!":"Activar Película"%></h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <%=pelicula.getEstado()==1?"Esta película será deshabilitada y no se podrá crear funciones futuras con esta.":"Esta película será habilitada y así podrás crear funciones con esta."%>
                    <br>
                    <center>¿Está seguro de realizar esta acción?</center>
                    <form method="post" class="row g-3" action="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=<%=pelicula.getEstado()==1?"deshabilitar":"habilitar"%>">
                        <input type="hidden" name="idPeli" value="<%=pelicula.getIdPelicula()%>">
                        <br>
                        <center>
                            <br>
                            <table>
                                <tr>
                                    <td>
                                        <button type="button" class="btn btn-secondary" width="15%" data-bs-dismiss="modal">Cancelar</button>
                                    </td>
                                    <td>
                                        <button type="submit" class="btn btn-danger" width="50px"><%=pelicula.getEstado()==1?"Deshabilitar":"Habilitar"%></button>
                                    </td>
                                    <%if(pelicula.getEstado()==0 && sePuedeEditar.get(i)){%>
                                    <td>
                                        <a type="button" href="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=borrarPermanente&idPeli=<%=pelicula.getIdPelicula()%>" class="btn btn-dark" width="15%" >Borrar Permanentemente</a>
                                    </td>
                                    <%}%>
                                </tr>
                            </table>
                        </center>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editar<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
        <div class="modal-dialog">
            <div class="modal-content border-0">
                <div class="modal-header bg-black text-white">
                    <h5 class="modal-title" >¡Ups!</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Esta película ya pertenece a mínimo una función, por tanto no es posible modificarla.
                </div>
            </div>
        </div>
    </div>
    <%i++;}%>
</main>

<!--JS-->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
