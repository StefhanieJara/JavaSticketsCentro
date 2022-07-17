<%@ page import="com.example.javasticketscentro.Beans.BSede" %>
<%@ page import="com.example.javasticketscentro.Beans.BSala" %>
<%@ page import="com.example.javasticketscentro.Beans.BPelicula" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %><%--
  Created by IntelliJ IDEA.
  User: stefh
  Date: 6/06/2022
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaPeliculas" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BPelicula>" class="java.util.ArrayList"/>
<jsp:useBean id="mensaje" scope="request" type="java.lang.String" class="java.lang.String" />
<jsp:useBean id="listaSedes" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BSede>" class="java.util.ArrayList"/>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<jsp:useBean id="ListaSalas" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BSala>" class="java.util.ArrayList"/>
<jsp:useBean id="idPelicula" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="Precio" scope="request" type="java.lang.Double"/>
<jsp:useBean id="idSede" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="fecha" scope="request" type="java.lang.String"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>Centro Cultural PUCP - Perfil de usuario</title>
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
                        <a href="<%=request.getContextPath()%>/OperadorFuncionesServlet"></a>
                        <i class="fa fa-caret-square-o-left fa-3x" style='color: #fff'></i>
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
                                    src="<%=(clienteLog.getFoto()!=null? (clienteLog.getFoto().contains("http") ?clienteLog.getFoto() :request.getContextPath()+"/UsuarioEditaPerfilServlet?action=entregarImagen"): "")%>"
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

<section class="vh-100 py-5">
    <div class="container py-2 h-50">

        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div
                        class="card shadow-2-strong card-registration"
                        style="border-radius: 15px; margin-top: 100px"
                >
                    <%if (!mensaje.equals("")){%>
                    <div style="font-weight: bold;" class="alert alert-danger" role="alert">
                       ¡Datos incompletos!
                    </div>
                    <%}%>
                    <div
                            class="card-header"
                            style="background-color: #e72d4b; color: white"
                    >
                        <h4 class="my-8">Registrar función</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form method="POST" action="<%=request.getContextPath()%>/OperadorFuncionesServlet?action=registrar">
                            <div class="row">
                                <div class="col-md-6 mb-1">
                                    <div class="form-outline mb-4">
                                        <label class="form-label">Seleccione la película</label>
                                        <select
                                                name="idPeli"
                                                class="frm-field required sect"
                                        >
                                            <option>Seleccionar</option>

                                            <%for(BPelicula pelicula : listaPeliculas){%>
                                            <option <%=pelicula.getIdPelicula()==idPelicula?"selected":""%> value="<%=pelicula.getIdPelicula()%>"><%=pelicula.getNombre()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="form-outline">
                                        <label class="form-label">Precio por ticket (S/.)</label>
                                        <input
                                                name="precio"
                                                type="number"
                                                min="0.0"
                                                step="0.1"
                                                max="60"
                                                id="productPrice"
                                                class="form-control"
                                                value="<%=Precio%>"
                                        />
                                    </div>
                                    <% LocalDate todaysDate = LocalDate.now();
                                       String todayStr = todaysDate.toString();
                                       DateTimeFormatter horaActual = DateTimeFormatter.ofPattern("HH:mm");
                                       todayStr=todayStr+"T"+horaActual.format(LocalDateTime.now());
                                    %>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Tiempo de inicio</label
                                        >
                                        <input
                                                type="datetime-local"
                                                min="<%=todayStr%>"
                                                name="fechaHora"
                                                id="productName"
                                                class="form-control"
                                                value="<%=fecha%>"
                                                oninvalid="setCustomValidity('Ingrese una fecha superior a la actual')"
                                                onchange="try{setCustomValidity('')}catch(e){}"
                                        />
                                    </div>
                                   <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Elija la sede</label>
                                        <select
                                                name="idsede"
                                                class="frm-field required sect"
                                        >
                                            <option>Seleccionar</option>
                                            <%for(BSede sede : listaSedes){%>
                                            <option <%=sede.getIdSede()==idSede?"selected":""%> value="<%=sede.getIdSede()%>"><%=sede.getNombre()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" id="enviar" class="btn btn-danger">Buscar Salas disponibles</button>
                            <br>
                        </form>
                        <%if(ListaSalas.size()>0){%>
                        <form method="POST" action="<%=request.getContextPath()%>/OperadorFuncionesServlet?action=guardar">
                            <div class="row">
                                <input type="hidden" name="fechaHora" value="<%=fecha%>">
                                <input type="hidden" name="idPeli" value="<%=idPelicula%>">
                                <input type="hidden" name="precio" value="<%=Precio%>">
                                <input type="hidden" name="idsede" value="<%=idSede%>">
                                <div class="form-outline mb-4">
                                    <label class="form-label" for="productName"
                                    >Elija la sala</label>
                                    <select
                                            name="idSala"
                                            class="frm-field required sect"
                                    >
                                        <option>Seleccionar</option>
                                        <%for(BSala sala : ListaSalas){%>
                                        <option value="<%=sala.getIdSala()%>">N°: <%=sala.getNumero()%> | Aforo Máximo: <%=sala.getAforo()%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-1">
                                    <div class="form-outline">
                                        <label class="form-label" for="productPrice"
                                        >Stock</label
                                        >
                                        <input
                                                name="stock"
                                                type="number"
                                                min="0.0"
                                                step="0.1"
                                                class="form-control"
                                        />
                                    </div>
                                </div>
                            </div>
                            <br>
                            <button type="submit" class="btn btn-danger">Registrar Función</button>
                        </form>
                        <%}%>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

