<%@ page import="com.example.javasticketscentro.Beans.BCelebridad" %>
<%@ page import="com.example.javasticketscentro.Beans.BFuncion" %><%--
  Created by IntelliJ IDEA.
  User: stefh
  Date: 6/06/2022
  Time: 00:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="pelicula" scope="request" type="com.example.javasticketscentro.Beans.BPelicula"/>
<jsp:useBean id="funciones" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="funcionElegida" scope="request" type="com.example.javasticketscentro.Beans.BFuncion"/>
<jsp:useBean id="idClient" scope="request" type="java.lang.Integer"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>PUCP - Descripción de pelicula</title>
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
            margin: 56px ;
            width: 1400px;
            padding-top: 80px;
        }


    </STYLE>


</head>
<body>

<nav
        class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger"
>
    <div class="row w-100 align-items-center pe-sm-4 ps-0 my-2">
        <!--Logo Centro Cultural PUCP-->
        <div
                class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2"
        >
            <a class="navbar-brand py-0" href="#">
                <a href="index.html"><img src="img/logo.png" /></a>
            </a>
        </div>
        <!--Buscador de productos-->
        <div class="col-md-7 d-none d-md-block ps-0">
            <!--desaparece en menores a medium-->
            <div class="input-group">
                <div style="width: 50%">
                    <input
                            type="search"
                            id="buscador_producto"
                            class="form-control"
                            placeholder="Busca una pelicula"
                    />
                </div>
                <a
                        role="button"
                        class="btn btn-tele border-start-1"
                        href="usuarioProductoBuscado.html"
                >
                    <i class="fas fa-search"></i>
                </a>
            </div>
        </div>
        <!--Carrito-->
        <div
                class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end">

            <input type="hidden" name="idCliente" value="<%=idClient%>">
            <a class="btn btn-tele-inverso"
                    role="button"
                    href="<%=request.getContextPath()%>/UsuarioCarritoIndex?action=listar&id=<%=idClient%>">
            <div style="font-size: 0.6rem">
                    <!--para cambios más precisos del tamaño-->
                    <i class="fas fa-cart-plus fa-3x"></i></div></a>
        </div>
        <!--Menú usuario-->
        <div class="col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <button
                    class="btn btn-tele-inverso"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#menuDeUsuario"
                    aria-controls="menuDeUsuario"
            >
                <div style="font-size: 0.62rem">
                    <i class="fas fa-user-circle fa-3x"></i>
                </div>
            </button>
        </div>
    </div>
</nav>

<!--Menú de usuario-->
<div
        class="offcanvas offcanvas-end text-center"
        tabindex="-1"
        id="menuDeUsuario"
        aria-labelledby="menuDeUsuario"
>
    <div class="d-flex align-items-center flex-column mb-3 vh-100">
        <!--Título y botón-->
        <div class="p-2 w-100">
            <div class="offcanvas-header border-bottom">
                <h5 class="mb-0">Menú de Usuario</h5>
                <button
                        type="button"
                        class="btn-close text-reset"
                        data-bs-dismiss="offcanvas"
                        aria-label="Close"
                ></button>
            </div>
        </div>
        <!--Foto usuario y opciones-->
        <div class="p-2">
            <div class="offcanvas-body p-3">
                <div class="d-flex flex-column">
                    <div class="my-2">
                        <h4 class="mb-3">Paco Perez</h4>
                        <img
                                src="img/images.png"
                                class="rounded-circle mx-auto d-block mb-3 h-25 w-50"
                                alt="profile image"
                        />
                    </div>
                    <div class="mb-3">
                        <div class="p-2">
                            <a
                                    href="usuarioEditar.html"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-user-edit"></i></span>
                                <span>Editar usuario</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a
                                    href="usuarioHistorial.html"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-list"></i></span>
                                <span>Historial de compras</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Footer cerrar sesión-->
        <div class="mt-auto p-2 w-100">
            <div class="offcanvas-body border-top pt-4">
                <a href="index.html" class="text-dark text-decoration-none">
                    <span><i class="fas fa-sign-out-alt"></i></span>
                    <span>Cerrar sesión</span>
                </a>
            </div>
        </div>
    </div>
</div>
<main>
    <br><br>
    <div class="main-container">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div class="card-header my-5"></div>
                <div class="container">
                    <table>
                        <thead>
                        <br>
                        <tr>
                            <center><h1 class="text-dark" ><%=pelicula.getNombre()%></h1><center>
                        </tr>
                        </thead>
                        <br>
                        <br>
                        <br>
                        <tr>
                            <img src="img/s2.jpg"
                                 style="float:left; padding-right: 10px;" width="400" height="620" alt="Foto Dr Strange" >
                        </tr>
                        <br>
                        <br>
                        <br>
                        <tr>
                            <b class="text-dark">Descripcion:</b>
                        </tr>
                        <tr>
                            <p class="text-dark"><%=pelicula.getSinopsis()%></p>
                        </tr>
                        <tr>
                            <b class="text-dark">Genero:</b>
                        </tr>
                        <tr>
                            <p class="text-dark"><%=pelicula.getGenero()%></p>
                        </tr>
                        <tr>
                            <b class="text-dark">Duracion:</b>
                        </tr>
                        <tr>
                            <%String[] horario= pelicula.getDuracion().split(":");%>
                            <%String hora= horario[0], minuto=horario[1];%>
                            <h6 class="text-dark"><%=hora%> h<%=" "+minuto%> m</h6>
                        </tr>
                        <tr>
                            <b class="text-dark">Directores:</b>
                        </tr>
                        <tr>
                            <h6 class="text-dark">
                                <%int i=1;%>
                                <% for(BCelebridad bCelebridad: pelicula.getDirectores()){%>
                                    <%if(i<pelicula.getDirectores().size()){%>
                                        <%=bCelebridad.getNombre()+" "+bCelebridad.getApellido()+", "%>
                                    <%}else{%>
                                        <%=bCelebridad.getNombre()+" "+bCelebridad.getApellido()%>
                                    <%}%>
                                <% i++;}%>
                            </h6>
                        </tr>
                        <tr>
                            <b class="text-dark">Actores:</b>
                        </tr>
                        <tr>
                            <ul>
                                <li type="circle"><h6 class="text-dark">
                                    <%i=1;%>
                                    <%for(BCelebridad bCelebridad: pelicula.getActores()){%>
                                        <%if(i<pelicula.getDirectores().size()){%>
                                            <%=bCelebridad.getNombre()+" "+bCelebridad.getApellido()+", "%>
                                        <%}else{%>
                                            <%=bCelebridad.getNombre()+" "+bCelebridad.getApellido()%>
                                        <%}%>
                                    <%i++;}%>
                                </h6></li>
                            </ul>
                        </tr>
                    </table>
                </div>
                <div class="main-container">
                <form method="POST" action="<%=request.getContextPath()%>/UsuariodescripcionServlet?action=anadirCarro">
                    <table class="table table-sm table-borderless">
                        <tbody>
                        <!--Label-->
                        <br><br><br><br>
                        <input type="hidden" name="idClient" value="<%=idClient%>">
                        <input type="hidden" name="idPeli" value="<%=pelicula.getIdPelicula()%>">
                            <!--Señal de alerta-->
                            <%if(funcionElegida.getId()!=0){%>
                            <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                                <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                </symbol>
                                <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                                </symbol>
                                <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                </symbol>
                            </svg>
                            <%if(funcionElegida.getCarrito()==1){%>
                            <div class="alert alert-success d-flex align-items-center alert-dismissible fade show" role="alert">
                                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                                <div>
                                    Función añadida al carrito de compras exitosamente!
                                </div>
                                <button type="button" data-bs-dismiss="alert" class="btn-close" aria-label="Close"></button>
                            </div>
                            <%}else{%>
                            <div class="alert alert-primary d-flex align-items-center alert-dismissible fade show" role="alert">
                                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Info:"><use xlink:href="#info-fill"/></svg>
                                <div>
                                    Función comprada!
                                </div>
                                <button type="button" data-bs-dismiss="alert" class="btn-close" aria-label="Close"></button>
                            </div>
                            <%}%>
                            <%}%>
                        <select class="form-select" name="funcionEscogida">
                            <option value="Funciones" <%=funcionElegida.getId()==0 ? "selected": ""%> disabled>Funciones</option>
                            <%for(BFuncion bFuncion: funciones){%>
                                <option value="<%=bFuncion.getId()%>" <%=funcionElegida.getId()==bFuncion.getId()? "selected" : ""%> <%=funcionElegida.getId()==0 ? "" : "disabled"%> ><%="Hora de Inicio: "+bFuncion.getHoraInicio()%>pm <%=" Fecha:"+bFuncion.getFecha()%></option>
                            <%}%>
                        </select>
                        <br>
                        <table>
                        </br>
                        <table ALIGN="right">

                            <tr>
                                <td class="text-end">
                                    <button type="<%=funcionElegida.getId()==0 ? "submit" : "button"%>" class="btn btn-tele btn-md mr-1 mb-2">
                                        <i class="fas fa-shopping-cart"></i> Añadir al carrito
                                    </button>


                                </td>
                            </tr>
                        </table>
                    </table>
                </form>
                </div>
            <h2 class="text-dark"> </h2>


        </div>
    </div>
    </div>
</main>







<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
