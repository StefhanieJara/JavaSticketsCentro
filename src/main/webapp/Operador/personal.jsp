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
<jsp:useBean id="cant_paginas" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="pagina" scope="request" type="java.lang.Integer"/>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Centro Cultural PUCP  - Lista del Personal</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/estilos.css">
    <script src="https://kit.fontawesome.com/5733880de3.js" crossorigin="anonymous"></script>


    <STYLE TYPE="text/css">
        body{
            font-family: var(--bs-font-sans-serif);
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
<!--Bot??n flotante "+" para agregar producto-->
<a href="<%=request.getContextPath()%>/personalServlet?action=crear" class="btn-float">
    <i class="fas fa-plus my-float"></i>
</a>

<nav class="navbar navbar-light navbar-expand-md fixed-top navbar- shadow-sm navigation-clean-search d-flex justify-content-center"
     style="background-color: #e72d4b">
    <div class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2">
        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-2 ps-md-5 ps-lg-4 ps-xl-5 ps-xxl-2">
            <a href="<%=request.getContextPath()%>/indexOperadorServlet"><img src="img/logo.png" with="188px" height="97px"/></a>
        </div>

        <!--Espacio-->
        <div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0"></div>
        <!--Espacio-->

        <!--Men?? cine-->
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
                    <!--para cambios m??s precisos del tama??o-->
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
                    <h5 class="mb-0">Men?? de Operador</h5>
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
                                    <span>Gestione Pel??culas</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a
                                        href="<%=request.getContextPath()%>/operador_estadisticasServlet"
                                        class="text-dark text-decoration-none">
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Visualizar Estad??sticas</span>
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
                        <span>Cerrar sesi??n</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
<main>
    <!--Alinear cabecera con contenido-->
    <div class="card-header mt-5 mb-4"></div>

    <!--Pesta??as visualizaci??n y gesti??n-->
    <ul class="nav nav-tabs nav-fill mb-4 justify-content-around px-5">
        <li class="nav-item">
            <a class="nav-link text-white active" aria-current="page" href="#"
            ><h1>Lista de Personal de mantenimiento</h1></a
            >
        </li>
    </ul>
    <%if (session.getAttribute("filtrar")!=null){%>
    <%if(listaPersonal.size()!=0){%>
    <h3 class="dist-name title-peliculas">Resultados de su b??squeda</h3>
    <%}else{%>
    <h3 class="dist-name title-peliculas">No se encontraron resultados :(</h3>
    <%}%>
    <%}%>
    <div class="caja2">
    </div>
    <div class="caja1">
        <form method="post" action="<%=request.getContextPath()%>/personalServlet?action=filtrar">
        <div class="row g-3 align-items-center mt-2 ">
            <div class="rows-auto">
                <h4><center>FILTROS</center></h4>
                <label class="col-form-label">Nombre</label>
            </div>
            <div class="rows-auto">
                <input type="text" value="<%=session.getAttribute("nombrefil")==null?"":session.getAttribute("nombrefil")%>" name="nombrepersonal" placeholder="Filtrar por nombre" class="form-control" aria-describedby="textHelpInline">
            </div>
        </div>
        <div class="row g-3 align-items-center mt-2 ">
            <div class="rows-auto">
                <label class="col-form-label">Apellido</label>
            </div>
            <div class="rows-auto">
                <input type="text" value="<%=session.getAttribute("apellidofil")==null?"":session.getAttribute("apellidofil")%>" name="apellidopersonal" placeholder="Filtrar por apellido" class="form-control" aria-describedby="textHelpInline">
            </div>
        </div>
            <div class="row g-3 align-items-center mt-2">
                <div class="rows-auto">
                    <button type="submit" class="btn btn-primary" style="background-color:indianred; border-color:red; color:white">Aplicar filtros</button>
                </div>
            </div>
        </form>
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
                <%int i=0;for (BPersonal personal : listaPersonal) { %>
            <tr>
                <td><%=personal.getNombre()%></td>
                <td><%=personal.getApellido()%></td>
                <td><%=personal.getbSede().getNombre()%></td>
                <td style="width: 100px;">
                    <div class="col-sm-1 d-none d-md-block text-around">
                        <form action="<%=request.getContextPath()%>/personalServlet?action=editar" method="post">
                            <input type="hidden" value="<%=personal.getIdPersonal()%>" name="id">
                        <button type="submit"
                                class="btn-tele p-1 rounded">
                            <i class="far fa-edit "></i>
                        </button></form>
                        <hr class="my-1" style="background-color: white" />
                        <button type="button"
                                class="btn btn-danger py-1 px-1"
                                data-bs-toggle="modal"
                                data-bs-target="#eliminar<%=i%>">
                            <i class="fas fa-times-circle"></i>
                        </button>
                    </div>
                </td>
            </tr>
            <%i++;}%>
        </table>
    </div>
    <%if(cant_paginas>1){%>
    <div class="container">
        <div class="d-flex justify-content-center my-3">
            <nav aria-label="paginacion_productos">
                <ul class="pagination">
                    <form method="post" action="<%=request.getContextPath()%>/personalServlet?action=paginar">
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
                    <form method="post" action="<%=request.getContextPath()%>/personalServlet?action=paginar">
                        <input type="hidden" name="pagina" value="<%=i%>">
                        <%if(i==pagina){%>
                        <li class="page-item active"><button type="submit" class="page-link" href="#"><%=i%></button></li>
                        <%}else{%>
                        <li class="page-item"><button type="submit" class="page-link" href="#"><%=i%></button></li>
                        <%}%>
                    </form>
                    <%}%>
                    <form method="post" action="<%=request.getContextPath()%>/personalServlet?action=paginar">
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
    <%i=0;for (BPersonal personal : listaPersonal) {%>
    <div    class="modal fade"
            id="eliminar<%=i%>"
            tabindex="-1"
            aria-labelledby="err_eliminar"
            aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content border-0">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="err_eliminar">??Despedir Personal?</h5>
                    <button
                            type="button"
                            class="btn-close btn-close-white"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                    ></button>
                </div>
                <div class="modal-body">
                    <form class="dist-name">Si desea despedir a este personal, click en el bot??n "Despedir".</form>

                    <center>Nombre de trabajador: <%=personal.getNombre()+" "+personal.getApellido()%></center>
                </div>
                <form method="post" action="<%=request.getContextPath()%>/personalServlet?action=eliminar">
                <input type="hidden" name="idPersonal" value="<%=personal.getIdPersonal()%>">

                    <center>
                        <div style="padding-right: 10px">

                                <button type="button" class="btn btn-secondary" width="15%" data-bs-dismiss="modal">Cancelar</button>
                                <button
                                            type="submit"
                                            class="btn btn-danger"
                                            data-bs-dismiss="modal">
                                        Despedir
                                    </button>
                        </div>
                    </center>

                </form>
            </div>
        </div>
    </div>
    <%i++;}%>
</main>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>