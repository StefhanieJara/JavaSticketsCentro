<%@ page import="com.example.javasticketscentro.Beans.BSede" %>
<%@ page import="java.nio.file.Paths" %><%--
  Created by IntelliJ IDEA.
  User: CARLOS
  Date: 5/06/2022
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="Listapeliculas" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BPelicula>"/>
<jsp:useBean id="ListaSedes" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BSede>"/>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona" class="com.example.javasticketscentro.Beans.BPersona"/>
<jsp:useBean id="filtro" scope="request" type="java.lang.String" class="java.lang.String"/>
<%int idClient= clienteLog.getIdPer();%>
<!DOCTYPE html>
<html lang="en">
<head>

    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Centro Cultural PUCP</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- CSS Personales-->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/estilos.css">
    <link rel="stylesheet" href="assets/css/estilosindex.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="assets/css_2/estilos_carrusel.css">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/5733880de3.js" crossorigin="anonymous"></script>

    <style>
        #btnSubmit{
            border-color: rgba(0, 0, 0, 0.87);
            background-color: rgba(0, 0, 0, 0.87);
        }
        .f1 {background-image: url("img/sedeChacarilla.jpg");background-size: cover;}
        .f2 {background-image: url("img/sedeLince.jpg");background-size: cover;}
        .f3 {background-image: url("img/sedeMiraflores.jpg");background-size: cover;}
    </style>
</head>
<body>
<!--Cabecera Principal cliente-->
<nav class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger">
    <div class="row w-100 align-items-center pe-sm-4 ps-0 my-2">
        <!--Logo Centro Cultural PUCP-->
        <div
                class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2"
        >
            <a class="navbar-brand py-0">
                <a href="<%=request.getContextPath()%>/"><img src="img/logo.png" with="188px" height="97px"></a>
            </a>
        </div>
        <!--Buscador de productos-->
        <div class="col-md-7 d-none d-md-block ps-0">

            <!--desaparece en menores a medium-->
            <form method="post" action="<%=request.getContextPath()%>/Index">
            <div class="input-group">
                <div style="width: 50%">
                    <input
                            name="filtro"
                            value="<%=filtro%>"
                            type="search"
                            class="form-control"
                            placeholder="Busca una pelicula"/></div>
                <button id="btnSubmit" type="submit"
                        class="btn btn-tele border-start-1">
                    <i class="fas fa-search"></i></button>
            </div>
            </form>
        </div>
        <!--Carrito-->
        <div
                class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end">
            <a class="btn btn-tele-inverso"
                    role="button"
                    href="<%=request.getContextPath()%>/UsuarioCarritoIndex">
                <div style="font-size: 0.6rem">
                    <!--para cambios m??s precisos del tama??o-->
                    <i class="fas fa-cart-plus fa-3x"></i>
                </div>
            </a>
        </div>
        <div class="col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <%if(idClient!=0){%>
            <button
                    class="btn btn-tele-inverso"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#menuDeUsuario"
                    aria-controls="menuDeUsuario">
                <div style="font-size: 0.62rem">
                    <i class="fas fa-user-circle fa-3x"></i>
                </div>
            </button>
            <%}else{%>
            <a
                    class="btn btn-tele-inverso"
                    role="button"
                    href="<%=request.getContextPath()%>/UsuariologinclientServlet">
                <div style="font-size: 0.6rem">
                    <!--para cambios m??s precisos del tama??o-->
                    <i class="fa fa-user-circle fa-3x"></i>
                </div>
            </a>
            <%}%>
        </div>
    </div>
</nav>
    <!--Men?? de usuario2-->
    <div class="offcanvas offcanvas-end text-center" tabindex="-1" id="menuDeUsuario" aria-labelledby="menuDeUsuario">
        <div class="d-flex align-items-center flex-column mb-3 vh-100">
            <!--T??tulo y bot??n-->
            <div class="p-2 w-100">
                <div class="offcanvas-header border-bottom">
                    <h5 class="mb-0">Men?? de Usuario</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                            aria-label="Close"></button>
                </div>
            </div>
            <!--Foto usuario y opciones-->
            <div class="p-2">
                <div class="offcanvas-body p-3">
                    <div class="d-flex flex-column">
                        <div class="my-2">
                            <h4 class="mb-3"><%=clienteLog.getNombre()+" "+clienteLog.getApellido()%></h4>
                            <img src="<%=(clienteLog.getFoto()!=null? (clienteLog.getFoto().contains("http") ?clienteLog.getFoto() :request.getContextPath()+"/UsuarioEditaPerfilServlet?action=entregarImagen"): "")%>"
                                 class="rounded-circle mx-auto d-block mb-3 h-25 w-50" alt="profile image">
                        </div>
                        <div class="mb-3">
                            <div class="p-2">
                                <a href="<%=request.getContextPath()%>/UsuarioEditaPerfilServlet" class="text-dark text-decoration-none">
                                    <span><i class="fas fa-user-edit"></i></span>
                                    <span>Editar perfil</span>
                                </a>
                            </div>
                            <div class="p-2">
                                <a href="<%=request.getContextPath()%>/UsuarioHistorial_2Servlet" class="text-dark text-decoration-none">
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Historial de tickets</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Footer cerrar sesi??n-->
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


<!--Contenido de p??gina-->
<main>
    <!--Alinear cabecera con contenido-->
    <div class="card-header my-5"></div>

    <!-- Banner -->
    <%if(filtro.isEmpty()){%>
    <!-- Banner presentaci??n -->
    <div class="slider_carr">
        <div class="carousel-caption text-center">
            <h1 style="margin-bottom: 40px"><mark><b>BIENVENIDOS AL</b></mark></h1>
            <h2 style="margin-bottom: 50px"><mark><b>CENTRO CULTURAL PUCP</b></mark></h2>
            <span>??Disfruta de nuestra amplia cartelera de cine!</span>
        </div>
        <ul>
            <li><img  src="img/banner3.jpg" alt=""></li>
            <li><img  src="img/ccpucp.jpg" alt=""></li>
            <li><img  src="img/banner3.jpg" alt=""></li>
            <li><img  src="img/ccpucp.jpg" alt=""></li>
        </ul>

    </div>
    <!-- -->
    <%}%>
    <%session.removeAttribute("vieneDePeli");session.removeAttribute("idPeli");%>
    <%session.setAttribute("vieneDePeli", false);%>

    <% for (int j=0; j<Math.ceil((double) Listapeliculas.size()/4);j++) {%>
        <div class="container px-8 py-2">
            <div class="row">
                <% if (j==0) {%>
                <h3 class="dist-name title-peliculas"><%=filtro.isEmpty()?"Pel??culas en cartelera": "Resultados de su b??squeda"%></h3>
                <%}%>
                <div class="row container-pelicula">
                    <% for (int i=j*4; i<(j+1)*4; i++) { %>
                    <%if(i<Listapeliculas.size()){%>
                    <div class="col-pelicula1">
                        <a href="<%=request.getContextPath()%>/Index?action=describir&id=<%=Listapeliculas.get(i).getIdPelicula()%>"><img src="<%=Listapeliculas.get(i).getFoto()%>" class="imagenPeli" height="350px" width="250px"></a>
                        <div class="textoPeliculas"  ><%=Listapeliculas.get(i).getNombre()%></div>
                        <br><br>
                    </div>
                    <%}%>
                    <%}%>
                </div>
            </div>
        </div>
    <%}%>

    <div class="container">
        <div class="row">
            <div class="container px-5 py-2" id="custom-cards-san-miguel">
                <h4 class="dist-name" style="color:#E72D4B; font-weight: bold; margin-top: 30px">Nuestras Sedes</h4>
                <div class="row row-cols-1 row-cols-lg-3 g-4 py-3">
                    <%int i=1;%>
                    <% for (BSede sede : ListaSedes) {%>
                    <div class="col">
                        <div onclick="" class="card card-farmacia f<%=i%>">
                            <a href="https://www.google.com/maps/place/<%=sede.getNombre()%>,<%=sede.getDireccion()%>" style="text-decoration:none ; color:white"  target="_blank">
                            <h2><%=sede.getNombre()%></h2>
                            </a>
                            <ul>
                                <li>
                                    <i class="fas fa-map-marker-alt fa-xs"></i>
                                    <a href="https://www.google.com/maps/place/<%=sede.getNombre()%>,<%=sede.getDireccion()%>" style="text-decoration:none ; color:white" target="_blank"><small><%=sede.getDireccion()%></small></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <%i++;%>
                    <%}%>
                </div>
            </div>
        </div>
    </div>


</main>

    <footer class="py-lg-5 py-4">
        <p class="copy-right text-center ">&copy; 2022 JavaSticket. All Rights Reserved</p>
    </footer>


    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- JavaScript Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!--JS-->
    <script>
        $("#btnSubmit").click(function (){
            $(this).html(
                `<i class="fas fa-search"></i>...<span class="spinner-border spinner-border-sm"
                role="status" aria-hidden="true" ></span>`
            );
        });
    </script>
</body>
</html>