
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <head>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
        <meta charset="utf-8" />
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
        />
        <title>PUCP - Registrar Operador</title>
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
<nav class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger">
    <div class="row w-100 align-items-center pe-sm-4 ps-0 my-2">

        <div class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2">
            <a class="navbar-brand py-0" href="#">
                <a href="index.html"><img src="img/logo.png" /></a>
            </a>
        </div>
    </div>
</nav>

<section class="vh-100">
    <div class="container py-4 h-100">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div
                        class="card shadow-2-strong card-registration"
                        style="border-radius: 15px"
                >
                    <div
                            class="card-header"
                            style="background-color: #e72d4b; color: white"
                    >
                        <h4 class="my-2">Registrar Operador</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form method="POST" action="<%=request.getContextPath()%>/ListarOperadorServlet?action=crear">
                            <div class="row">
                                <div class="col-md-6 mb-1">

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="nombreOperador">Nombre</label>
                                        <input name="nombreOperador"
                                                type="text"
                                                id="nombreOperador"
                                                class="form-control"
                                                placeholder="Ingrese nombre"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="apellidoOperador">Apellidos</label>
                                        <input name="apellidoOperador"
                                               type="text"
                                               id="apellidoOperador"
                                               class="form-control"
                                               placeholder="Ingrese apellido"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="email">Correo</label>
                                        <input name="email"
                                               type="text"
                                               id="email"
                                               class="form-control"
                                               placeholder="Ingrese correo"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="direccion">Direccion</label>
                                        <input name="direccion"
                                               type="text"
                                               id="direccion"
                                               class="form-control"
                                               placeholder="Ingrese direccion"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="dni">DNI</label>
                                        <input name="dni"
                                                type="number"
                                                id="dni"
                                                class="form-control"
                                                placeholder="Ingrese su dni"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="numCel">Numero de contacto</label>
                                        <input name="numCel"
                                               type="number"
                                               id="numCel"
                                               class="form-control"
                                               placeholder="Ingrese numero"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="fechaNac">Ferha de Nacimiento</label>
                                        <input name="fechaNac"
                                               type="date"
                                               id="fechaNac"
                                               class="form-control"
                                               placeholder="aaaa-mm-dd"/>
                                    </div>

                                </div>

                                <div class="col-md-6 mb-4 text-center">
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="usuario">Usuario</label>
                                        <input name="usuario"
                                               type="text"
                                               id="usuario"
                                               class="form-control"
                                               placeholder="Ingrese su usuario"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="contrasenia">Contraseña</label>
                                        <input name="contrasenia"
                                               type="password"
                                               id="contrasenia"
                                               class="form-control"
                                               placeholder="Ingrese su contraseña"/>
                                    </div>
                                    <label for="formFile" class="form-label">Imagen referencial</label>
                                    <div class="text-center mt-2 mb-3">
                                        <img
                                                src="img/benedict.jpg"
                                                class="img-thumbnail"
                                                width="200x"
                                                height="400px"
                                                alt="medicamento"
                                        />
                                    </div>
                                    <input class="form-control" type="file" id="formFile" />

                                    <div class="d-flex justify-content-center my-3">
                                        <input
                                                class="btn btn-tele"
                                                type="submit"
                                                value="Subir imagen"
                                        />
                                    </div>
                                </div>
                            </div>

                            <div class="">
                                <a href="<%=request.getContextPath()%>/ListarOperadorServlet" class="btn btn-danger">Regresar</a>
                                <button type="submit" class="btn btn-tele">Crear Operador</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>