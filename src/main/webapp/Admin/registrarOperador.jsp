
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<html lang="en">
<head>
    <head>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
        <meta charset="utf-8" />
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
        />
        <title>PUCP - Registrar Operador</title>
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
                        <a href="<%=request.getContextPath()%>/ListarOperadorServlet">
                            <i class="fa fa-caret-square-o-left fa-3x" style='color: #fff'></i></a>
                    </div>
                </button>
            </div>
        </div>
    </nav>
    <br><br><br><br><br><br><br><br>

<section class="vh-100">
    <div class="container py-4 h-100">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div
                        class="card shadow-2-strong card-registration"
                        style="border-radius: 15px"
                >
                    <div
                            class="card-header"
                            style="background-color: #e72d4b; color: white"
                    >
                        <h4 class="my-2">Registrar Operador</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form method="POST" action="<%=request.getContextPath()%>/ListarOperadorServlet?action=crear">
                            <div class="row">
                                <div class="col-md-6 mb-1">

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="nombreOperador">Nombre</label>
                                        <input name="nombreOperador"
                                                type="text"
                                                id="nombreOperador"
                                                class="form-control"
                                                placeholder="Ingrese nombre"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="apellidoOperador">Apellidos</label>
                                        <input name="apellidoOperador"
                                               type="text"
                                               id="apellidoOperador"
                                               class="form-control"
                                               placeholder="Ingrese apellido"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="email">Correo</label>
                                        <input name="email"
                                               type="email"
                                               id="email"
                                               class="form-control"
                                               placeholder="Ingrese correo"/>
                                    </div>
                                    <%if(session.getAttribute("error")!=null && session.getAttribute("error").equals("emailExiste")){%>
                                    <div class="text-danger mb-2">El email ingresado ya existe</div>
                                    <%}%>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="direccion">Direccion</label>
                                        <input name="direccion"
                                               type="text"
                                               id="direccion"
                                               class="form-control"
                                               placeholder="Ingrese direccion"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="dni">DNI</label>
                                        <input name="dni"
                                                type="number"
                                                id="dni"
                                                class="form-control"
                                                placeholder="Ingrese su dni"
                                               min="10000000" max="99999999"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="numCel">Numero de contacto</label>
                                        <input name="numCel"
                                               type="number"
                                               id="numCel"
                                               class="form-control"
                                               placeholder="Ingrese numero"
                                               min="900000000" max="999999999"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="fechaNac">Ferha de Nacimiento</label>
                                        <input name="fechaNac"
                                               type="date"
                                               id="fechaNac"
                                               class="form-control"
                                               placeholder="aaaa-mm-dd"/>
                                    </div>
                                    <%if(session.getAttribute("error")!=null && session.getAttribute("error").equals("vacio")){%>
                                    <div class="text-danger mb-2">No puede haber campos vacios</div>
                                    <%}%>

                                </div>

                                <div class="col-md-6 mb-4 text-center">
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="usuario">Usuario</label>
                                        <input name="usuario"
                                               type="text"
                                               id="usuario"
                                               class="form-control"
                                               placeholder="Ingrese su usuario"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="contrasenia">Contraseña</label>
                                        <input name="contrasenia"
                                               type="password"
                                               id="contrasenia"
                                               class="form-control"
                                               placeholder="Ingrese su contraseña"/>
                                    </div>
                                    <label class="form-label">Foto Operador</label>
                                    <div class="col-md-6 mb-4 text-center">
                                        <div class="text-center mt-2 mb-3">
                                            <img id="img-preview" src="img/benedict.jpg" style="max-width: 300px; resize: both; max-width: 300px" />
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center my-3">
                                        <input type="file" id="img-uploader">
                                    </div>
                                    <progress class="text-center" id="img-upload-bar" width="8px" value="0" max="100"
                                              style="width: 100%"></progress>
                                    <input type="hidden" name="photoUrl" id="photoUrl" />
                                </div>
                            </div>

                            <div class="">
                                <a href="<%=request.getContextPath()%>/ListarOperadorServlet" class="btn btn-danger">Regresar</a>
                                <button type="submit" class="btn btn-tele">Crear Operador</button>
                            </div>
                            <%session.removeAttribute("error");%>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
                            <h4 class="mb-3"><%=clienteLog.getNombre()%> <%=clienteLog.getApellido()%></h4>
                            <img
                                    src="<%=(clienteLog.getFoto()!=null? (clienteLog.getFoto().contains("http") ?clienteLog.getFoto() :request.getContextPath()+"/UsuarioEditaPerfilServlet?action=entregarImagen"): "")%>"
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
                                    <span>Visualizar Actores y Directores</span>
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
</section>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>
<script src="assets/appSubirImagen.js"></script>
</body>
</html>