<%@ page import="com.example.javasticketscentro.Beans.BCelebridad" %><%--
  Created by IntelliJ IDEA.
  User: stefh
  Date: 6/06/2022
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="mensaje" scope="request" type="java.lang.String" class="java.lang.String" />
<jsp:useBean id="listarDirector" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BCelebridad>"/>
<jsp:useBean id="listarActor" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BCelebridad>"/>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<jsp:useBean id="idPeli" scope="request" type="java.lang.Integer"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>Centro Cultural PUCP - Registrar Película</title>
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
<nav class="navbar navbar-light navbar-expand-md fixed-top navbar- shadow-sm navigation-clean-search d-flex justify-content-center"
     style="background-color: #e72d4b">
    <div class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2">
        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-2 ps-md-5 ps-lg-4 ps-xl-5 ps-xxl-2">
            <a href="<%=request.getContextPath()%>/indexOperadorServlet"><img src="img/logo.png" width="188px" height="97px"/></a>
        </div>

        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end ">
        </div>
        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBackdrop"
                    aria-controls="offcanvasWithBackdrop" style="color: #fff">
                <div style="font-size: 0.62rem">
                    <i class="fas fa-user-circle fa-3x"></i>
                </div>
            </button>
        </div>
        <!--Boton atras-->
        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <button class="btn" type="button" style=" color: white">
                <div style="font-size: 0.62rem">
                    <a href="<%=request.getContextPath()%>/peliculaVisualizacionServlet">
                    <i class="fa fa-caret-square-o-left fa-3x" style='color: #fff'></i></a>
                </div>
            </button>
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
                                src="<%=clienteLog.getFoto()%>"
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
                                    href="<%=request.getContextPath()%>/OperadorEditaPerfilServlet"
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

<section class="vh-100 py-5">
    <div class="container py-2 h-50">

        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div
                        class="card shadow-2-strong card-registration"
                        style="border-radius: 15px; margin-top: 100px"
                >
                    <%if (mensaje.equals("actorRepetido")){%>
                    <div style="font-weight: bold;" class="alert alert-danger" role="alert">
                        Seleccione actores diferentes.
                    </div>
                    <%}else if(mensaje.equals("directorCero")){%>
                    <div style="font-weight: bold;" class="alert alert-danger" role="alert">
                        Esta película debe tener un director.
                    </div>
                    <%}else if(mensaje.equals("actoresCero")){%>
                    <div style="font-weight: bold;" class="alert alert-danger" role="alert">
                        Debe seleccionar al menos un actor para esta película.
                    </div>
                    <%}%>
                    <div
                            class="card-header"
                            style="background-color: #e72d4b; color: white"
                    >
                        <h4 class="my-8">Añadir celebridades</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form method="POST" action="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=agregarCelebridades">
                            <div class="row">
                                <div class="col-md-6 mb-1">
                                    <input type="hidden" value="<%=idPeli%>" name="idPeli">
                                    <div class="form-outline mb-4">
                                        <label class="form-label"
                                        >Elija el director de la película</label>
                                        <select
                                                name="director"
                                                class="frm-field required sect"
                                        >
                                            <option>Seleccionar</option>
                                            <%for(BCelebridad celebridad : listarDirector){%>
                                            <option value="<%=celebridad.getIdCelebridad()%>"><%=celebridad.getNombre()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    Elija un máximo de 4 actores
                                    <div class="form-outline mb-4">
                                        <label class="form-label"
                                        >Elija el actor 1:</label>
                                        <select
                                                name="actor1"
                                                class="frm-field required sect"
                                        >
                                            <option>Seleccionar</option>
                                            <%for(BCelebridad celebridad : listarActor){%>
                                            <option value="<%=celebridad.getIdCelebridad()%>"><%=celebridad.getNombre()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label"
                                        >Elija el actor 2:</label>
                                        <select
                                                name="actor2"
                                                class="frm-field required sect"
                                        >
                                            <option>Seleccionar</option>
                                            <%for(BCelebridad celebridad : listarActor){%>
                                            <option value="<%=celebridad.getIdCelebridad()%>"><%=celebridad.getNombre()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label"
                                        >Elija el actor 3:</label>
                                        <select
                                                name="actor3"
                                                class="frm-field required sect"
                                        >
                                            <option>Seleccionar</option>
                                            <%for(BCelebridad celebridad : listarActor){%>
                                            <option value="<%=celebridad.getIdCelebridad()%>"><%=celebridad.getNombre()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label"
                                        >Elija el actor 4:</label>
                                        <select
                                                name="actor4"
                                                class="frm-field required sect"
                                        >
                                            <option>Seleccionar</option>
                                            <%for(BCelebridad celebridad : listarActor){%>
                                            <option value="<%=celebridad.getIdCelebridad()%>"><%=celebridad.getNombre()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" id="enviar" class="btn btn-danger">Registrar Película</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

