<%@ page import="com.example.javasticketscentro.Beans.BPersona" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: stefh
  Date: 5/06/2022
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaClientes" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BPersona>" />
<jsp:useBean id="pagina" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="filtros" scope="request" type="java.util.ArrayList<java.lang.String>"/>
<jsp:useBean id="cant_paginas" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Lista de clientes</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/estilos.css">
    <script src="https://kit.fontawesome.com/5733880de3.js" crossorigin="anonymous"></script>

    <STYLE TYPE="text/css">
        div.scrollmenu {
            overflow: auto;
            white-space: nowrap;
        }
        body{
            font-family: Arial;
        }
        #main-container{
            text-align: left;
            border-collapse: collapse;
            width: 70%;
            position: static;
            left: 90%;
            margin-left: 380px;
            top: 300%;
            margin-top: 10px;
        }
        table{
            background-color: white;
            text-align: left;
            border-collapse: collapse;
            width: 100%;
            position: static;
            left: 100%;
            margin-left: 20px;
            top: 0%;
            margin-top: 0px;
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
            height: 570px;
            position: absolute;
            margin-top: 30px;
            left: 1%;
            margin-left: 60px;
            margin-right: 50px;
        }
        .caja2{
            background-color: #ddd;
            width: 300px;
            height: 600px;
            position: absolute;
            margin-top: 30px;
            left: 1%;
            margin-left: 40px;
            margin-right: 50px;
        }
    </STYLE>

</head>
<body>

<nav class="navbar navbar-light navbar-expand-md fixed-top navbar- shadow-sm navigation-clean-search d-flex justify-content-center"
     style="background-color: #e72d4b">
    <div class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2">
        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-2 ps-md-5 ps-lg-4 ps-xl-5 ps-xxl-2">
            <a href="<%=request.getContextPath()%>/AdminIndexServlet?action=index"><img src="img/logo.png" with="188px" height="97px"/></a>
        </div>

        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end ">
        </div>


        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBackdrop"
                    aria-controls="offcanvasWithBackdrop" style="color: #fff">
                <div style="font-size: 0.62rem">
                    <i class="fas fa-user-circle fa-3x "></i>
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
    <div class="card-header my-5"></div>
    <ul class="nav nav-tabs nav-fill mb-4 justify-content-around px-5">
        <li class="nav-item">
            <a class="nav-link text-white active" aria-current="page" href="#"
            ><h1>Lista de Clientes</h1></a
            >
        </li>
    </ul>
</main>
<div class="caja2">
</div>

<div class="caja1">
    <form method="post" action="<%=request.getContextPath()%>/AdminClienteServlet?a=buscar">
    <div class="row g-3 align-items-center mt-2 ">
        <div class="rows-auto">
            <h4>FILTROS</h4>
            <input type="hidden" name="pagina" value="1">
            <label for="inputtext6" class="col-form-label">Nombre</label>
        </div>
        <div class="rows-auto">
            <%if(filtros.get(0).equals("")){%>
                <input type="text" id="inputtext6" name="nombreBuscar" class="form-control" aria-label="Filtrar por nombre" placeholder="Filtrar por nombre">
            <%}else{%>
                <input type="text" id="inputtext6" name="nombreBuscar" class="form-control" aria-label="Filtrar por nombre" placeholder="Filtrar por nombre" value="<%=filtros.get(0)%>">
            <%}%>
        </div>
    </div>
    <div class="row g-3 align-items-center mt-2 ">
        <div class="rows-auto">
            <label for="inputtext6" class="col-form-label">Apellido</label>
        </div>
        <div class="rows-auto">
            <%if(filtros.get(1).equals("")){%>
                <input type="text" id="inputtext6" name="apellidoBuscar" class="form-control" aria-label="Filtrar por apellido" placeholder="Filtrar por apellido">
            <%}else{%>
                <input type="text" id="inputtext6" name="apellidoBuscar" class="form-control" aria-label="Filtrar por apellido" placeholder="Filtrar por apellido" value="<%=filtros.get(1)%>">
            <%}%>
        </div>
    </div>
    <div class="row g-3 align-items-center mt-2">
        <div class="rows-auto ">
            <label for="inputtext6" class="col-form-label"> DNI</label>
        </div>
        <div class="rows-auto">
            <%if(filtros.get(2).equals("")){%>
                <input type="text" id="inputtext6" name="dniBuscar" class="form-control" aria-label="Filtrar por DNI" placeholder="Filtrar por DNI">
            <%}else{%>
                <input type="text" id="inputtext6" name="dniBuscar" class="form-control" aria-label="Filtrar por DNI" placeholder="Filtrar por DNI" value="<%=filtros.get(2)%>">
            <%}%>
        </div>
    </div>
    <div class="row g-3 align-items-center mt-2">
        <div class="rows-auto">
            <label for="inputtext6" class="col-form-label">Codigo Pucp</label>
        </div>
        <div class="rows-auto">
            <%if(filtros.get(3).equals("")){%>
                <input type="text" id="inputtext6" name="codigoBuscar" class="form-control" aria-label="Filtrar por codigo" placeholder="Filtrar por codigo">
            <%}else{%>
                <input type="text" id="inputtext6" name="codigoBuscar" class="form-control" aria-label="Filtrar por codigo" placeholder="Filtrar por codigo" value="<%=filtros.get(3)%>">
            <%}%>
        </div>
    </div>
    <div class="row g-3 align-items-center mt-2">
        <div class="rows-auto">
            <button type="submit" class="btn btn-primary" style="background-color:indianred; border-color:red; color:white">Aplicar filtros</button>
        </div>
    </div>
    </form>
</div>
<div id="main-container" class="scrollmenu">
    <table>
        <thead>
        <tr>
            <th>Nombres</th>
            <th>Email</th>
            <th>Telefono</th>
            <th>Direccion</th>
        </tr>
        </thead>
        <tbody>
        <%for (BPersona cliente : listaClientes) { %>
        <tr>
            <td><%=cliente.getNombre() +" "+ cliente.getApellido()%></td>
            <td><%=cliente.getEmail()%></td>
            <td><%=cliente.getNumCel()%></td>
            <td><%=cliente.getDireccion()%></td>
        </tr>
        <%} %>
        </tbody>
    </table>
</div>



<div class="container">
    <div class="d-flex justify-content-center my-3">
        <nav aria-label="paginacion_productos">
            <ul class="pagination">
                <form method="post" action="<%=request.getContextPath()%>/AdminClienteServlet?a=buscar">
                    <input type="hidden" name="pagina" value="<%=pagina-1%>">
                    <input type="hidden" name="nombreBuscar" value="<%=filtros.get(0)%>">
                    <input type="hidden" name="apellidoBuscar" value="<%=filtros.get(1)%>">
                    <input type="hidden" name="dniBuscar" value="<%=filtros.get(2)%>">
                    <input type="hidden" name="codigoBuscar" value="<%=filtros.get(3)%>">
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
                <form method="post" action="<%=request.getContextPath()%>/AdminClienteServlet?a=buscar">
                    <input type="hidden" name="pagina" value="<%=i%>">
                    <input type="hidden" name="nombreBuscar" value="<%=filtros.get(0)%>">
                    <input type="hidden" name="apellidoBuscar" value="<%=filtros.get(1)%>">
                    <input type="hidden" name="dniBuscar" value="<%=filtros.get(2)%>">
                    <input type="hidden" name="codigoBuscar" value="<%=filtros.get(3)%>">
                    <%if(i==pagina){%>
                        <li class="page-item active"><button type="submit" class="page-link" href="#"><%=i%></button></li>
                    <%}else{%>
                        <li class="page-item"><button type="submit" class="page-link" href="#"><%=i%></button></li>
                    <%}%>
                </form>
                <%}%>
                <form method="post" action="<%=request.getContextPath()%>/AdminClienteServlet?a=buscar">
                    <input type="hidden" name="pagina" value="<%=pagina+1%>">
                    <input type="hidden" name="nombreBuscar" value="<%=filtros.get(0)%>">
                    <input type="hidden" name="apellidoBuscar" value="<%=filtros.get(1)%>">
                    <input type="hidden" name="dniBuscar" value="<%=filtros.get(2)%>">
                    <input type="hidden" name="codigoBuscar" value="<%=filtros.get(3)%>">
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
            <form method="post" action="<%=request.getContextPath()%>/AdminClienteServlet?a=descargar">
                <button type="submit" class="page-link" href="#">Descargar Lista</button>
            </form>
        </nav>
    </div>
</div>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>