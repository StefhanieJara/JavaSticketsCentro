
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>PUCP - Perfil de usuario</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/estilos.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
            rel="stylesheet"
    />
    <script
            src="https://kit.fontawesome.com/5733880de3.js"
            crossorigin="anonymous"
    ></script>
    <style>
        #cambiarcolorboton{
            border-color: rgba(0, 0, 0, 0.87);
            background-color: rgba(0, 0, 0, 0.87);
        }
    </style>
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
                <a href="<%=request.getContextPath()%>/"><img src="img/logo.png" with="188px" height="97px" /></a>
            </a>
        </div>
        <!--Espacio-->
        <div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0"></div>
        <!--Carrito-->
        <%if(clienteLog.getRol().equals("Cliente")){%>
        <div
                class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end"
        >
            <a
                    class="btn btn-tele-inverso"
                    role="button"
                    href="<%=request.getContextPath()%>/UsuarioCarritoIndex"
            >
                <div style="font-size: 0.6rem">
                    <!--para cambios más precisos del tamaño-->
                    <i class="fas fa-cart-plus fa-3x"></i>
                </div>
            </a>
        </div>
        <%}%>
        <!--Boton atras-->
        <div class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <button class="btn" type="button" style=" color: white">
                <div style="font-size: 0.62rem">
                    <a href="<%=request.getContextPath()%>">
                        <i class="fa fa-caret-square-o-left fa-3x" style='color: #fff'></i></a>
                </div>
            </button>
        </div>
    </div>
</nav>
    </div>
</nav>




<!--Contenido-->
<main>
    <div class="banner-top container-fluid" id="home">
        <!-- header -->
        <header></header>
    </div>
        <div style="margin-bottom: 50px" class="contenerdor_perfil">
            <div class="container">
                <h2>Editar perfil</h2>
                <div class="row">
                    <div class="col">
                    <div class="row mb-4">
                        <div class="col-md-6" >
                            <label class="form-label" for="email">Correo</label>
                            <input disabled name ="email"
                                   type="text"
                                   id="email"
                                   class="form-control"
                                   value="<%=clienteLog.getEmail()%>"
                                   placeholder="Ingrese su email">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label" for="email">Edad</label>
                            <input disabled name ="email"
                                   type="text"
                                   class="form-control"
                                   value="<%=clienteLog.getEdad()%> años"
                                   placeholder="Ingrese su email">
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-6" >
                            <label class="form-label" for="codigo">Código PUCP</label>
                            <input disabled name="codigo"
                                   type="text"
                                   id="codigo"
                                   class="form-control"
                                    <%if (clienteLog.getCodigoPUCP() == 0) {%>
                                   value="No es alumno"
                                    <%}else{%>
                                   value="<%=clienteLog.getCodigoPUCP()%>"
                                    <%}%>
                                   placeholder="Ingrese su código PUCP"/>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label" for="email">DNI</label>
                            <input disabled name ="email"
                                   type="text"
                                   class="form-control"
                                   value="<%=clienteLog.getDni()%>"
                                   placeholder="Ingrese su email">
                        </div>
                    </div>
                        <div class="row mb-4">
                     <div class="col mb-1">
                         <form method="POST" action="<%=request.getContextPath()%>/UsuarioEditaPerfilServlet?action=actualizar" >
                         <div class="row mb-4">
                            <div class="col-md-6" >
                                <label class="form-label" for="nombre">Nombre</label>
                                <input required
                                        name ="nombre"
                                        type="text"
                                        id="nombre"
                                        class="form-control"
                                        value="<%=clienteLog.getNombre()%>"
                                        placeholder="Ingrese su Nombre">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label" for="apellido">Apellidos</label>
                                <input  required name ="apellido"
                                        type="text"
                                        id="apellido"
                                        class="form-control"
                                        value="<%=clienteLog.getApellido()%>"
                                        placeholder="Ingrese su Apellido">
                            </div>
                        </div>

                        <div class="row mb-4">
                            <div class="col-md-6" >
                                <label class="form-label" for="numCel">Usuario</label>
                                <input required name ="usuario"
                                        type="text"
                                        class="form-control"
                                        value="<%=clienteLog.getUsuario()%>"
                                        placeholder="Usuario">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label" for="numCel">Número de contacto</label>
                                <input  required
                                        name ="numCel"
                                        type="text"
                                        minlength="9"
                                        maxlength="9"
                                        id="numCel"
                                        class="form-control"
                                        value="<%=clienteLog.getNumCel()%>"
                                        placeholder="Ingrese su numero de celular">
                                <%if(session.getAttribute("msg")!=null){%>
                                <%if(session.getAttribute("msg").equals("errortexto")){%>
                                <div class="text-danger mb-2">Número inválido</div>
                                <%}else{%>
                                <div class="text-danger mb-2">El número debe comenzar con 9.</div>
                                <%}%>
                                <%}%>
                                <%session.removeAttribute("msg");%>
                            </div>
                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="direccion">Dirección</label>
                            <input  name ="direccion"
                                    type="text"
                                    id="direccion"
                                    class="form-control"
                                    value="<%=clienteLog.getDireccion()==null? "": clienteLog.getDireccion()%>"
                                    placeholder="Ingrese su direccion">
                        </div>


                        </div>
                             <button id="cambiarcolorboton" type="submit" class="btn btn-tele">Guardar Edicion</button>
                         </form>
                    </div>
                        </div>
                    <div class="col-1"></div>
                    <div class="col">
                        <div style="margin-top: 10px" class="col-md-6 mb-4 text-center">
                            <form method="POST" action="<%=request.getContextPath()%>/UsuarioEditaPerfilServlet?action=actualizarFoto" enctype="multipart/form-data">
                                <h4 class="form-label" >Imagen de perfil</h4>
                                <div class="text-center mt-2 mb-3">
                                    <img id="img-preview" src="<%=clienteLog.getFoto().contains("http") ?clienteLog.getFoto() :request.getContextPath()+"/UsuarioEditaPerfilServlet?action=entregarImagen"%>" style="max-width: 300px; resize: both; max-width: 300px" />
                                </div>
                                <!--progress class="text-center" id="img-upload-bar" width="8px" value="0" max="100"
                                          style="width: 100%"></progress-->
                                <!--input type="hidden" value="" name="photoUrl" id="photoUrl"/-->
                                <label>Archivos tipo: .jpg,.png,.jpeg,.webp,.heic</label>
                                <div class="d-flex justify-content-center my-3">
                                    <!--input type="file" id="img-uploader"-->
                                    <input type="file" accept=".jpg,.png,.jpeg,.webp,.heic" name="photoUrl">
                                </div>
                                <button  type="submit"  class="btn btn-tele">Cambiar foto de perfil</button>
                            </form>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
</main>

<!--JS-->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>
<script src="assets/appSubirImagen.js"></script>
</body>
</html>
