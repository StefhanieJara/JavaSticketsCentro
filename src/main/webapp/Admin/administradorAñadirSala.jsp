<%@ page import="com.example.javasticketscentro.Beans.BSede" %><%--
  Created by IntelliJ IDEA.
  User: stefh
  Date: 12/06/2022
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="sedes" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BSede>"/>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<jsp:useBean id="numerosSalas" scope="request" type="java.util.ArrayList<java.lang.Integer>"/>
<jsp:useBean id="buscoSalas" scope="request" type="java.lang.Boolean"/>

<%  int filtroSede= session.getAttribute("filtroSede")==null?0:(Integer)session.getAttribute("filtroSede");
    session.removeAttribute("filtroSede");
    int maxNumero=0;
    for(int numero:numerosSalas){
        if(maxNumero<numero){
            maxNumero= numero;
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>Centro Cultural PUCP-Gestión Salas</title>
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

<nav
        class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger"
>
    <div
            class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2"
    >
        <div
                class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2"
        >
            <a class="navbar-brand py-0" href="#">
                <a href="<%=request.getContextPath()%>/AdminIndexServlet?action=index"><img src="img/logo.png" with="188px" height="97px"/></a>
            </a>
        </div>

        <div
                class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end"
        ></div>
        <div
                class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0"
        >
            <button
                    class="btn"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasWithBackdrop"
                    aria-controls="offcanvasWithBackdrop"
                    style="color: #ffffff"
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
                    <a href="<%=request.getContextPath()%>/AdminIndexServlet?action=gestionSalas">
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
<main>
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
                            <h4 class="my-2">Añadir Nueva Sala</h4>
                        </div>
                        <div class="card-body p-4 p-md-5">
                                <div class="row mb-3">
                                    <form method="POST" action="<%=request.getContextPath()%>/AdminListarSalasServlet?action=buscarSalas">
                                    <div class="col-lg-8">
                                        <label class="form-label" for="country1">Elija la sede</label>
                                        <select id="country1"
                                                class="frm-field required sect"
                                                name="elegirSede">
                                            <%for(BSede bSede : sedes){%>
                                            <option <%=bSede.getIdSede()==filtroSede?"selected":""%> value="<%=bSede.getIdSede()%>"><%=bSede.getNombre()%></option>
                                            <%}%>
                                        </select>
                                        <button
                                                class="btn btn-tele"
                                                type="submit">Buscar salas</button>
                                    </div>
                                    </form>
                                </div>
                                <div class="row mb-3">
                                    <form method="POST" action="<%=request.getContextPath()%>/AdminListarSalasServlet?action=guardar">
                                    <div class="form-outline mb-4 py-4">
                                        <div class="form-outline">
                                            <label class="form-label">Ingrese el numero de sala</label>
                                            <input type="hidden" value="<%=filtroSede%>" name="elegirSede">
                                            <select <%=buscoSalas?"":"disabled"%> class="frm-field required sect"
                                                    name="numeroSala">
                                                <%for(int i=1;i<maxNumero+10;i++){%>
                                                    <% boolean estaLista=false;for(int numero: numerosSalas){
                                                            if(numero==i){
                                                                estaLista=true;
                                                                break;
                                                            }
                                                        }%>
                                                    <%if(!estaLista){%>
                                                <option value="<%=i%>">N°Sala: <%=i%></option>
                                                <%}}%>
                                            </select>
                                        </div>
                                        <br>
                                        <div class="col-md-6">
                                            <div class="form-outline">
                                                <label class="form-label">Máximo de personas en la sala (aforo)</label>
                                                <input  <%=buscoSalas?"required":"disabled"%> type="number"
                                                        name="aforo"
                                                        class="form-control"
                                                        placeholder="Ingrese el aforo" max="200" min="50"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row row-cols-3 justify-content-center">
                                        <input <%=buscoSalas?"":"disabled"%>
                                                class="btn btn-tele"
                                                type="submit"
                                                value="Registrar sala"
                                        />
                                    </div>
                                    </form>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

