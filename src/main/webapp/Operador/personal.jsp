<%@ page import="com.example.javasticketscentro.Beans.BPersonal" %><%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 06/06/2022
  Time: 00:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaPersonal" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BPersonal>" />
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>PUCP - Lista del Personal</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/estilos.css">
    <script src="https://kit.fontawesome.com/5733880de3.js" crossorigin="anonymous"></script>


    <STYLE TYPE="text/css">
        body{
            font-family: Arial;
        }
        #main-container{
            margin: 52px ;
            width: 1200px;
        }
        table{
            background-color: white;
            text-align: left;
            border-collapse: collapse;
            width: 86%;
            position: static;
            left: 90%;
            margin-left: 355px;
            top: 300%;
            margin-top: -20px;
        }
        th, td{
            padding: 20px;
        }
        thead{
            background-color: #D62457;
            border-bottom: solid 5px #0F362D;
            color: white;
        }
        tr:nth-child(even){
            background-color: #ddd;
        }
        tr:hover td{
            background-color: #d54b80;
            color: white;
        }
        .caja1{
            background-color: #ddd;
            width: 250px;
            height: 400px;
            position: absolute;
            margin-top: 30px;
            left: 1%;
            margin-left: 60px;
            margin-right: 50px;
        }
        .caja2{
            background-color: #ddd;
            width: 300px;
            height: 400px;
            position: absolute;
            margin-top: 30px;
            left: 1%;
            margin-left: 40px;
            margin-right: 50px;
        }
    </STYLE>

</head>
<body>
<!--Botón flotante "+" para agregar producto-->
<a href="<%=request.getContextPath()%>/personalServlet?action=crear" class="btn-float">
    <i class="fas fa-plus my-float"></i>
</a>

<nav class="navbar navbar-light navbar-expand-md fixed-top navbar- shadow-sm navigation-clean-search d-flex justify-content-center"
     style="background-color: #e72d4b">
    <div class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2">
        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-2 ps-md-5 ps-lg-4 ps-xl-5 ps-xxl-2">
            <a href="<%=request.getContextPath()%>/indexOperadorServlet"><img src="img/logo.png" /></a>
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
                                        href="<%=request.getContextPath()%>/peliculaVisualizacionServlet"
                                        class="text-dark text-decoration-none"
                                >
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Gestione Funciones</span>
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
    <!--Alinear cabecera con contenido-->
    <div class="card-header mt-5 mb-4"></div>

    <!--Pestañas visualización y gestión-->
    <ul class="nav nav-tabs nav-fill mb-4 justify-content-around px-5">
        <li class="nav-item">
            <a class="nav-link text-white active" aria-current="page" href="#"
            ><b>Lista de Personal de mantenimiento</b></a
            >
        </li>
    </ul>

    <div class="caja2">
    </div>
    <div class="caja1">
        <div class="row g-3 align-items-center mt-2 ">
            <div class="rows-auto">
                <h4><center>FILTROS</center></h4>
                <label for="inputtext6" class="col-form-label">Nombre</label>
            </div>
            <div class="rows-auto">
                <input type="text" id="inputtext6" class="form-control" aria-describedby="textHelpInline">
            </div>
        </div>
        <div class="row g-3 align-items-center mt-2 ">
            <div class="rows-auto">
                <label for="inputtext6" class="col-form-label">Apellido</label>
            </div>
            <div class="rows-auto">
                <input type="text" class="form-control" aria-describedby="textHelpInline">
            </div>
        </div>


    </div>

    <div id="main-container">
        <table>
            <thead>
            <tr>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Sede</th>
                <th>Opciones</th>
            </tr>
            </thead>
                <%for (BPersonal personal : listaPersonal) { %>
            <tr>
                <td><%=personal.getNombre()%></td>
                <td><%=personal.getApellido()%></td>
                <td><%=personal.getNombre_sede()%></td>
                <td style="width: 100px;">
                    <div class="col-sm-1 d-none d-md-block text-around">
                        <a href="<%=request.getContextPath()%>/personalServlet?action=editar&id=<%=personal.getIdPersonal()%>">
                            <i class="far fa-edit btn-tele p-1 rounded"></i>
                        </a>
                        <a href="<%=request.getContextPath()%>/personalServlet?action=eliminar&id=<%=personal.getIdPersonal()%>">
                            <i class="btn btn-danger p-1 fas fa-times-circle"></i>
                        </a>
                    </div>
    </div>
    <!--Icono para eliminar-->

    <div class="d-flex justify-content-center my-2 d-md-none">
        <a href="editaOperador.html">
            <i class="far fa-edit btn-tele p-1 rounded"></i>
        </a>
        <div class="mx-3"></div>
        <button
                class="btn btn-danger py-0 px-1"
                type="button"
                data-bs-toggle="modal"
                data-bs-target="#confirmacion"
        >
            <i class="fas fa-times-circle"></i>
        </button>
        </td>
        <%} %>
        </tr>

        </table>
    </div>



    <div class="container">
        <div class="d-flex justify-content-center my-3">
            <nav aria-label="paginacion_productos">
                <ul class="pagination">
                    <li class="page-item disabled">
                        <a class="page-link">Anterior</a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item" aria-current="page">
                        <a class="page-link" href="#">2</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Siguiente</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</main>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>