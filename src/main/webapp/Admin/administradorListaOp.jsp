
<%@ page import="com.example.javasticketscentro.Beans.BPersona" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaOperadores" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BPersona>" />
<jsp:useBean id="pagina" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="filtros" scope="request" type="java.util.ArrayList<java.lang.String>"/>
<jsp:useBean id="cant_paginas" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Centro Cultural PUCP -Lista de operadores</title>
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
<!--Bot??n flotante "+" para agregar producto-->
<a href="RegistrarOperadorServlet" class="btn-float">
    <i class="fas fa-plus my-float"></i>
</a>
<!--Cabecera principal Cine-->
<nav class="navbar navbar-light navbar-expand-md fixed-top navbar- shadow-sm navigation-clean-search d-flex justify-content-center"
     style="background-color: #e72d4b">
    <div class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2">
        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-2 ps-md-5 ps-lg-4 ps-xl-5 ps-xxl-2">
            <a href="<%=request.getContextPath()%>/AdminIndexServlet?action=index"><img src="img/logo.png" with="188px" height="97px" /></a>
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
                    <h5 class="mb-0">Men?? de Administrador</h5>
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
                                    <span>A??adir Actores y Directores</span>
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
            <h3><a class="nav-link text-white active" aria-current="page" href="#"
            ><h1>Lista de Operadores</h1></a
            ></h3>
        </li>
    </ul>
    <%boolean existeFiltro=false;for(String a: filtros){
        if(!a.equals("")){
            existeFiltro=true;
            break;
        }
    }%>
    <%if(existeFiltro){%>
    <%if(listaOperadores.size()!=0){%>
    <h3 class="dist-name title-peliculas">Resultados de su b??squeda</h3>
    <%}else{%>
    <h3 class="dist-name title-peliculas">No se encontraron resultados :(</h3>
    <%}%>
    <%}%>

    <div class="caja2">
    </div>
    <div class="caja1">
        <form method="post" action="<%=request.getContextPath()%>/ListarOperadorServlet?action=buscar">
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
                    <label for="inputtext6" class="col-form-label">Email</label>
                </div>
                <div class="rows-auto">
                    <%if(filtros.get(3).equals("")){%>
                    <input type="text" id="inputtext6" name="emailBuscar" class="form-control" aria-label="Filtrar por email" placeholder="Filtrar por email">
                    <%}else{%>
                    <input type="text" id="inputtext6" name="emailBuscar" class="form-control" aria-label="Filtrar por email" placeholder="Filtrar por email" value="<%=filtros.get(3)%>">
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

    <div id="main-container">
        <table>
            <thead>
            <tr>
                <th>Nombres</th>
                <th>DNI</th>
                <th>Email</th>
                <th>Tel??fono</th>
                <th>Direcci??n</th>
                <th></th>
            </tr>
            </thead>
                <% int a = 1;
                for (BPersona operador : listaOperadores ) {%>
            <tr>
                <td><%=operador.getNombre()+" "+operador.getApellido()%></td><td><%=operador.getDni()%></td>
                <td><%=operador.getEmail()%></td><td><%=operador.getNumCel()%></td><td><%=operador.getDireccion()%></td>
                <td>
                    <hr class="my-1" style="background-color: white" />
                    <button
                            class="btn btn-danger py-2 px-2"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#confirmacion<%=a%>">
                        <i class="fas fa-times-circle"></i>
                    </button>

    </div>
    <div class="d-flex justify-content-center my-2 d-md-none">

            <i class="far fa-edit btn-tele p-1 rounded"></i>

        <div class="mx-3"></div>
        <button
                class="btn btn-danger py-0 px-1"
                type="button"
                data-bs-toggle="modal"
                data-bs-target="#confirmacion<%=a%>"
        >
            <i class="fas fa-times-circle"></i>
        </button>
        </td>
        </tr>
        <div class="modal fade"
             id="confirmacion<%=a%>"
             tabindex="-1"
             aria-labelledby="conf_eliminar"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content border-0">
                    <div class="modal-header bg-danger text-white">
                        <h5 class="modal-title" id="conf_eliminar">Eliminar Operador</h5>
                        <button
                                type="button"
                                class="btn-close btn-close-white"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                        ></button>
                    </div>
                    <div class="modal-body">
                        Este operador ser?? eliminado y ya no podra recuperar la
                        informaci??n.<br />
                        ??Est?? seguro que desea eliminarlo de la lista?
                    </div>
                    <div class="modal-footer">
                        <a href="<%=request.getContextPath()%>/ListarOperadorServlet">
                            <button type="button"
                                class="btn btn-light"
                                data-bs-dismiss="modal">Cancelar</button>
                        </a>
                        <a href="<%=request.getContextPath()%>/EditarOperadorServlet?a=borrar&id=<%=operador.getIdPer()%>">
                            <button type="button" class="btn btn-danger">Eliminar Operador</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <% a++;
                }%>
        </table>
    </div>

    <%if(cant_paginas>1){%>
    <div class="container">
        <div class="d-flex justify-content-center my-3">
            <nav aria-label="paginacion_productos">
                <ul class="pagination">
                    <form method="post" action="<%=request.getContextPath()%>/ListarOperadorServlet?action=buscar">
                        <input type="hidden" name="pagina" value="<%=pagina-1%>">
                        <input type="hidden" name="nombreBuscar" value="<%=filtros.get(0)%>">
                        <input type="hidden" name="apellidoBuscar" value="<%=filtros.get(1)%>">
                        <input type="hidden" name="dniBuscar" value="<%=filtros.get(2)%>">
                        <input type="hidden" name="emailBuscar" value="<%=filtros.get(3)%>">
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
                    <form method="post" action="<%=request.getContextPath()%>/ListarOperadorServlet?action=buscar">
                        <input type="hidden" name="pagina" value="<%=i%>">
                        <input type="hidden" name="nombreBuscar" value="<%=filtros.get(0)%>">
                        <input type="hidden" name="apellidoBuscar" value="<%=filtros.get(1)%>">
                        <input type="hidden" name="dniBuscar" value="<%=filtros.get(2)%>">
                        <input type="hidden" name="emailBuscar" value="<%=filtros.get(3)%>">
                        <%if(i==pagina){%>
                        <li class="page-item active"><button type="submit" class="page-link" href="#"><%=i%></button></li>
                        <%}else{%>
                        <li class="page-item"><button type="submit" class="page-link" href="#"><%=i%></button></li>
                        <%}%>
                    </form>
                    <%}%>
                    <form method="post" action="<%=request.getContextPath()%>/ListarOperadorServlet?action=buscar">
                        <input type="hidden" name="pagina" value="<%=pagina+1%>">
                        <input type="hidden" name="nombreBuscar" value="<%=filtros.get(0)%>">
                        <input type="hidden" name="apellidoBuscar" value="<%=filtros.get(1)%>">
                        <input type="hidden" name="dniBuscar" value="<%=filtros.get(2)%>">
                        <input type="hidden" name="emailBuscar" value="<%=filtros.get(3)%>">
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

</main>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
