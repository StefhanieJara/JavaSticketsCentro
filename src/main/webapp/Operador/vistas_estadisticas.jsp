<%@ page import="com.example.javasticketscentro.Beans.BFuncion" %>
<%@ page import="java.time.LocalDate" %><%--
  Created by IntelliJ IDEA.
  User: david
  Date: 8/07/2022
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="masVista" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>" class="java.util.ArrayList"/>
<jsp:useBean id="menosVista" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>" class="java.util.ArrayList"/>
<jsp:useBean id="fecha3" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fecha4" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fechaI" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="fechaH" scope="request" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<%LocalDate localDate = LocalDate.now();%>
<html>
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <title>Estadisticas - Vistas</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css_2/grafico_style.css">
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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
            <a class="navbar-brand py-0">
                <a href="<%=request.getContextPath()%>/"><img src="img/logo.png" with="188px" height="97px"></a>
            </a>
        </div>

        <!--Espacio-->
        <div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0"></div>
        <!--Espacio-->

        <!--Menú cine-->
        <div
                class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <button
                    class="btn"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasWithBackdrop"
                    aria-controls="offcanvasWithBackdrop"
                    style="color: #fff">
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
                    href="<%=request.getContextPath()%>/operador_estadisticasServlet"
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
                                    class="text-dark text-decoration-none">
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


<main>
    <div class="card-header mt-5 mb-4"></div>
    <br><br><br>
<div class="d-flex gap-sm-4 justify-content-center">
    <form method="post" action="<%=request.getContextPath()%>/operador_estadisticasServlet?action=filtrar2">
        <div >
            <table>
                <tr>
                    <td>
                        <div style="padding-right:20px">
                            <label> Fecha de inicio</label>
                            <input class="form-select" type="date" name="date3" value="<%=session.getAttribute("fechaI") == null ? fecha3: session.getAttribute("fechaI")%>" max="<%=localDate%>">
                            <%session.removeAttribute("fechaI");%>
                        </div>

                    </td>
                    <td>
                        <div style="padding-right:20px">
                            <label> Fecha de fin </label>
                            <input class="form-select" type="date" name="date4" value="<%=session.getAttribute("fechaH") == null ? fecha4: session.getAttribute("fechaH")%>" max="<%=localDate%>">
                            <%session.removeAttribute("fechaH");%>
                        </div>
                    </td>
                    <td>
                        <br>
                        <button type="submit" class="btn btn-danger">Filtrar</button>
                    </td>
                </tr>
            </table>




        </div>
    </form>
</div>
<figure class="text-center">

    <ul class="nav nav-tabs nav-fill mb-4 justify-content-around px-5">
        <li class="nav-item">
            <a class="nav-link text-white active" aria-current="page" href="#"
            ><h3>Funciones más vistas</h3></a
            >
        </li>
    </ul>
</figure>

<div class="container-md">
        <%if(session.getAttribute("msg2")!=null){%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("msg2")%></div>
        <%session.removeAttribute("msg2");
        }else{%>
    <table class="table table-bordered border-danger">
        <thead>
        <tr>
            <td><h3><center> Película</center></h3></td><td><h3><center>Sede</center></h3></td><td><h3><center>Sala</center></h3></td><td><h3><center>Butacas/Stock</center></h3></td><td><h3><center>Foto</center></h3></td>
        </tr>
        </thead>

        <tbody>
        <%for (BFuncion vista: masVista){%>
        <tr>
            <td><h4><center><%=vista.getbPelicula().getNombre()%></center></h4></td><td><h4><center> <%=vista.getbSede().getNombre()%></center></h4></td><td><h4><center><%=vista.getbSala().getNumero()%></center> </h4></td>
            <td><h4><center><%=vista.getButacas()%>/<%=vista.getStock()%></center></h4></td><td><center><img src="<%=vista.getbPelicula().getFoto()%>" style="max-height:200px; max-width: 100px" ></center></td>
        </tr>
        <%}%>
        </tbody>
    </table>
        <%}%>
</div>
<br>

<figure class="text-center">

    <ul class="nav nav-tabs nav-fill mb-4 justify-content-around px-5">
        <li class="nav-item">
            <a class="nav-link text-white active" aria-current="page" href="#"
            ><h3>Funciones menos vistas</h3></a
            >
        </li>
    </ul>
</figure>

<div class="container-md">
    <%if(session.getAttribute("msg3")!=null){%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("msg3")%></div>
    <%session.removeAttribute("msg3");
    }else{%>
    <table class="table table-bordered border-danger">
        <thead>
        <tr>
            <td><h3><center>Película</center></h3></td><td><h3><center>Sede</center></h3></td><td><h3><center>Sala</center></h3></td><td><h3><center>Butacas/Stock</center></h3></td><td><h3><center>Foto</center></h3></td>
        </tr>
        </thead>

        <tbody>

        <%for (BFuncion vista: menosVista){%>
        <tr>
            <td><h4><center><%=vista.getbPelicula().getNombre()%></center> </h4></td><td><h4><center><%=vista.getbSede().getNombre()%></center> </h4></td><td><h4><center><%=vista.getbSala().getNumero()%></center> </h4></td>
            <td><h4><center><%=vista.getButacas()%>/<%=vista.getStock()%></center></h4></td><td><center><img  src="<%=vista.getbPelicula().getFoto()%>" style="max-height:200px; max-width: 100px" ></center></td>
        </tr>
        <%}%>

        </tbody>
    </table>
    <%}%>
</div>
    </main>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
