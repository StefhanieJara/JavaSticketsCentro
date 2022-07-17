<%@ page import="com.example.javasticketscentro.Beans.BPersona" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="Admin" scope="request" type="com.example.javasticketscentro.Beans.BPersona" />


<html lang="en">
<head>
    <head>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
        <meta charset="utf-8" />
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
        />
        <title>PUCP - Editar Operador</title>
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
</head>
<body>

<nav
        class="navbar navbar-light navbar-expand-md fixed-top navbar- shadow-sm navigation-clean-search d-flex justify-content-center"
        style="background-color: #e72d4b"
>
    <div
            class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2"
    >
        <!--Logo Centro Cultural PUCP-->
        <div
                class="col-xl-3 col-lg-3 col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-2 ps-md-5 ps-lg-4 ps-xl-5 ps-xxl-2"
        >
            <a class="navbar-brand py-0" href="usuario.html">
                <a href="<%=request.getContextPath()%>/AdminIndexServlet?action=index"><img src="img/logo.png" with="188px" height="97px"/></a>
            </a>
        </div>
        <!--Espacio-->
        <div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0"></div>
        <!--Espacio-->

        <!--Menú-->

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
<br><br><br><br><br><br><br><br>

<main>
    <div class="row justify-content-center align-items-center h-100">
        <div class="col-12 col-lg-9 col-xl-7">
            <div class="card shadow-2-strong card-registration"
                 style="border-radius: 15px">
                <div class="card-header"
                     style="background-color: #e72d4b; color: white">
                    <h4 class="my-2">Editar Admin</h4>
                </div>
                <div class="card-body p-4 p-md-5">
                    <form method="POST" action="<%=request.getContextPath()%>/EditarOperadorServlet?action=actualizar1">
                        <div class="row">
                            <div class="col-md-6 mb-1">
                                <div class="form-outline mb-4">
                                    <label class="form-label" for="idPer"></label>
                                    <input name="idPer"
                                           type="hidden"
                                           id="idPer"
                                           class="form-control"
                                           value="<%=Admin.getIdPer()%>"
                                           placeholder=<%=Admin.gtIdPer()%>
                                                   readonly/></div>
                                <div class="form-outline mb-4">
                                    <label class="form-label" for="nombre">Nombre</label>
                                    <input
                                            name ="nombre"
                                            type="text"
                                            id="nombre"
                                            class="form-control"
                                            value="<%=Admin.getNombre()%>"
                                            placeholder="Ingrese su Nombre"
                                    >
                                </div>
                                <div class="form-outline mb-4">
                                    <label class="form-label" for="apellido">Apellidos</label>
                                    <input  name ="apellido"
                                            type="text"
                                            id="apellido"
                                            class="form-control"
                                            value="<%=Admin.getApellido()%>"
                                            placeholder="Ingrese su Apellido"
                                    >
                                </div>
                                <div class="form-outline mb-4">
                                    <label class="form-label" for="email"></label>
                                    <input  type="hidden"
                                            name ="email"
                                            type="email"
                                            id="email"
                                            class="form-control"
                                            value="<%=Admin.getEmail()%>"
                                            placeholder="Ingrese su email"
                                    >
                                </div>
                                <div class="form-outline mb-4">
                                    <label class="form-label" for="direccion">Direccion</label>
                                    <input  name ="direccion"
                                            type="text"
                                            id="direccion"
                                            class="form-control"
                                            value="<%=Admin.getDireccion()%>"
                                            placeholder="Ingrese su direccion"
                                    >
                                </div>
                                <div class="form-outline mb-4">
                                    <label class="form-label" for="numCel">Numero de contacto</label>
                                    <input  name ="numCel"
                                            type="number"
                                            id="numCel"
                                            class="form-control"
                                            value="<%=Admin.getNumCel()%>"
                                            placeholder="Ingrese su numero de celular"
                                            min="100000000" max="999999999"
                                    >
                                </div>
                                <%if(session.getAttribute("error")!=null && session.getAttribute("error").equals("negativo")){%>
                                <div class="text-danger mb-2">No debe ser negativo</div>
                                <%}%>
                                <%if(session.getAttribute("error")!=null && session.getAttribute("error").equals("digito")){%>
                                <div class="text-danger mb-2">Debe tener 9 digitos</div>
                                <%}%>
                                <%if(session.getAttribute("error")!=null && session.getAttribute("error").equals("comienzo")){%>
                                <div class="text-danger mb-2">Los numero deben comenzar con 9</div>
                                <%}%>

                            </div>

                            <div style="margin-top: 10px" class="col-md-6 mb-4 text-center">
                                <h4 class="form-label" >Foto Admin</h4>
                                <div class="text-center mt-2 mb-3">
                                    <img id="img-preview" src="img/benedict.jpg" style="max-width: 300px; resize: both; max-width: 300px" />
                                </div>
                                <div class="d-flex justify-content-center my-3">
                                    <input type="file" id="img-uploader">
                                </div>
                                <progress class="text-center" id="img-upload-bar" width="8px" value="0" max="100"
                                          style="width: 100%"></progress>
                                <input type="hidden" name="photoUrl" id="photoUrl" />
                            </div>
                        </div>

                        <button type="submit" class="btn btn-tele">Guardar Edicion</button>
                        <%session.removeAttribute("error");%>
                    </form>
                </div>
            </div>
        </div>
    </div>





</main>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>
<script src="assets/appSubirImagen.js"></script>
</body>
</html>