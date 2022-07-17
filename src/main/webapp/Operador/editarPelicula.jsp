<%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 06/06/2022
  Time: 01:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<jsp:useBean id="pelicula" scope="request" type="com.example.javasticketscentro.Beans.BPelicula" class="com.example.javasticketscentro.Beans.BPelicula"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
        <meta charset="utf-8" />
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
        />
        <title>Centro Cultural PUCP - Editar Pelicula</title>
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
</head>
<body>
    <nav class="navbar navbar-light navbar-expand-md fixed-top navbar- shadow-sm navigation-clean-search d-flex justify-content-center"
         style="background-color: #e72d4b">
        <div class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2">
            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-2 ps-md-5 ps-lg-4 ps-xl-5 ps-xxl-2">
                <a href="<%=request.getContextPath()%>/indexOperadorServlet"><img src="img/logo.png" with="188px" height="97px"/></a>
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
</body>
<section class="vh-100 py-5">
    <div class="container py-2 h-50">

        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div
                        class="card shadow-2-strong card-registration"
                        style="border-radius: 15px; margin-top: 100px"
                >
                    <div
                            class="card-header"
                            style="background-color: #e72d4b; color: white"
                    >
                        <h4 class="my-8">Editar película</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form method="POST" action="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=actualizar">
                            <div class="row">
                                <div class="col-md-6 mb-1">
                                    <div class="form-outline mb-4">
                                        <label class="form-label">Nombre de la pelicula</label>
                                        <input
                                                required
                                                type="text"
                                                name="nombrePeli"
                                                class="form-control"
                                                placeholder="Ingrese el nombre de la película"
                                                value="<%=pelicula.getNombre()%>"
                                        />
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label">Genero</label>
                                        <input
                                                required
                                                type="text"
                                                name="genero"
                                                class="form-control"
                                                placeholder="Ingrese el género de la pelicula"
                                                value="<%=pelicula.getGenero()%>"
                                        />
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label">Ingrese la duración de la pelicula</label>
                                        <input
                                                required
                                                type="time"
                                                name="tiempo"
                                                class="form-control"
                                                placeholder="Ingrese la duracion de la pelicula"
                                                value="<%=pelicula.getDuracion()%>"
                                        />
                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label">Restricción de edad</label>
                                        <select
                                                name="restriccionEdad"
                                                class="form-select  frm-field required sect"
                                        >
                                            <option <%=pelicula.getRestriccionEdad().equals("AA")?"selected":""%>>Para todo publico (AA)</option>
                                            <option <%=pelicula.getRestriccionEdad().equals("+12 (B)")?"selected":""%>>+12 (B)</option>
                                            <option <%=pelicula.getRestriccionEdad().equals("+15 (B15)")?"selected":""%>>+15 (B15)</option>
                                            <option <%=pelicula.getRestriccionEdad().equals("+18 (C)")?"selected":""%>>+18 (C)</option>
                                            <option <%=pelicula.getRestriccionEdad().equals("D")?"selected":""%>>Explicitas o lenguaje violento (D)</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4 text-center">
                                    <label class="form-label">Imagen</label>
                                    <div class="text-center mt-2 mb-3">
                                        <img id="img-preview" src="<%=pelicula.getFoto()%>" style="max-width: 300px; resize: both; max-width: 300px" />
                                    </div>
                                    <div class="d-flex justify-content-center my-3">
                                        <input type="file" id="img-uploader">
                                    </div>
                                    <progress id="img-upload-bar" width="10px" value="0" max="100"
                                              style="width: 100%"></progress>
                                    <input type="hidden" name="photoUrl" id="photoUrl" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-4 pb-2">
                                    <div class="form-outline">
                                        <label class="form-label" for="productoDescription">Sinopsis</label>
                                        <textarea name="sinopsis" id="productoDescription" class="form-control"><%=pelicula.getSinopsis()%></textarea>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="idPeli" value="<%=pelicula.getIdPelicula()%>">
                            <button type="submit" id="enviar" class="btn btn-dark">Guardar Edición</button>
                            <%session.setAttribute("peliEditar",pelicula);%>
                            <a href="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=editarCelebridades" class="btn btn-danger">Siguiente: Editar celebridades</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>

</html>