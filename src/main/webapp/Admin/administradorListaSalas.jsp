<%@ page import="com.example.javasticketscentro.Beans.BSala" %>
<%@ page import="com.example.javasticketscentro.Beans.BSede" %><%--
  Created by IntelliJ IDEA.
  User: david
  Date: 5/06/2022
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaSala" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BSala>" />
<jsp:useBean id="listaSedes" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BSede>"/>
<jsp:useBean id="filtro" scope="request" type="java.lang.String"/>
<jsp:useBean id="cant_paginas" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="pagina" scope="request" type="java.lang.Integer"/>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>PUCP-Lista de operadores</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/estilos.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/5733880de3.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="assets/css_2/checkout.css" />
    <script
            src="https://kit.fontawesome.com/5733880de3.js"
            crossorigin="anonymous"></script>

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
            height: 650px;
            position: absolute;
            margin-top: 30px;
            left: 1%;
            margin-left: 60px;
            margin-right: 50px;
        }
        .caja2{
            background-color: #ddd;
            width: 300px;
            height: 650px;
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
<a href="<%=request.getContextPath()%>/AdminListarSalasServlet?action=crear" class="btn-float">
    <i class="fas fa-plus my-float"></i>
</a>
<!--Cabecera principal Cine-->
<nav class="navbar navbar-light navbar-expand-md fixed-top navbar- shadow-sm navigation-clean-search d-flex justify-content-center"
     style="background-color: #e72d4b">
    <div class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2">
        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-2 ps-md-5 ps-lg-4 ps-xl-5 ps-xxl-2">
            <a href="<%=request.getContextPath()%>/AdminIndexServlet?action=index"><img src="img/logo.png" /></a>
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
                            <h4 class="mb-3">Rex Campos Díaz</h4>
                            <img
                                    src="img/images.png"
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
                        </div>
                    </div>
                </div>
            </div>
            <div class="mt-auto p-2 w-100">
                <div class="offcanvas-body border-top pt-4">
                    <a href="#" class="text-dark text-decoration-none">
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
            ><b>Lista de Salas</b></a
            >
        </li>
    </ul>

    <div class="caja2">
    </div>
    <div class="caja1">
        <form method="POST" action="<%=request.getContextPath()%>/AdminListarSalasServlet?action=filtrar">
        <div class="row g-3 align-items-center mt-2 ">
            <div class="rows-auto">
                <h4><center>FILTROS</center></h4>
                <label for="inputtext6" class="col-form-label">Sede</label>
                <input type="hidden" name="pagina" value="1">
            </div>
            <div class="rows-auto">
                <select class="form-select form-select-sm" name="filtro" aria-label=".form-select-sm example">
                    <option value="Selecciona la sede" <%="Selecciona la sede"==filtro ? "selected":""%>>Selecciona la sede</option>
                    <%for(BSede bSede : listaSedes){%>
                        <option value="<%=bSede.getNombre()%>" <%=bSede.getNombre().equals(filtro) ?"selected" : ""%> ><%=bSede.getNombre()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="row row-cols-3 justify-content-center">
            <input
                    class="btn btn-tele"
                    type="submit"
                    value="Filtrar"
            />
        </div>
        </form>
    </div>

    <div id="main-container">
        <table>
            <thead>
            <tr>
                <th>Nombre</th>
                <th>Aforo</th>
                <th>Numero</th>
                <th></th>
            </tr>
            </thead>
                <%for (BSala sala : listaSala ) {%>
            <tr>
                <td><%=sala.getNombre()%></td>
                <td><%=sala.getAforo()%></td>
                <td><%=sala.getNumero()%></td>
                <td>
                    <div class="col-sm-1 d-none d-md-block text-around">
                        <a href="<%=request.getContextPath()%>/AdminListarSalasServlet?action=editar&id=<%=sala.getIdSala()%>">
                            <i class="far fa-edit btn-tele p-1 rounded"></i>
                        </a>
                        <a href="<%=request.getContextPath()%>/AdminListarSalasServlet?action=eliminar&id=<%=sala.getIdSala()%>">
                            <i class="btn btn-danger p-1 fas fa-times-circle"></i>
                        </a>
                    </div>

                </td>
        </tr>
        <%}%>
        </table>
    </div>



    <div class="container">
        <div class="d-flex justify-content-center my-3">
            <nav aria-label="paginacion_productos">
                <ul class="pagination">
                    <form method="post" action="<%=request.getContextPath()%>/AdminListarSalasServlet?action=filtrar">
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
                    <form method="post" action="<%=request.getContextPath()%>/AdminListarSalasServlet?action=filtrar">
                        <input type="hidden" name="pagina" value="<%=i%>">
                        <input type="hidden" name="filtro" value="<%=filtro%>">

                        <%if(i==pagina){%>
                        <li class="page-item active"><button type="submit" class="page-link" href="#"><%=i%></button></li>
                        <%}else{%>
                        <li class="page-item"><button type="submit" class="page-link" href="#"><%=i%></button></li>
                        <%}%>
                    </form>
                    <%}%>
                    <form method="post" action="<%=request.getContextPath()%>/AdminListarSalasServlet?action=filtrar">
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

</main>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
