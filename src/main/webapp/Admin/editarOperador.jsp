<%@ page import="com.example.javasticketscentro.Beans.BPersona" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="Operador" scope="request" type="com.example.javasticketscentro.Beans.BPersona" />


<html lang="en">
<head>
    <head>
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

<nav class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger">
    <div class="row w-100 align-items-center pe-sm-4 ps-0 my-2">

        <div class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2">
            <a class="navbar-brand py-0" href="#">
                <a href="index.html"><img src="img/logo.png" /></a>
            </a>
        </div>
    </div>
</nav>

<main>
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div class="card shadow-2-strong card-registration"
                        style="border-radius: 15px">
                    <div class="card-header"
                         style="background-color: #e72d4b; color: white">
                        <h4 class="my-2">Editar Operador</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form method="POST" action="<%=request.getContextPath()%>/EditarOperadorServlet?a=actualizar">
                            <div class="row">
                                <div class="col-md-6 mb-1">
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="idPer">ID</label>
                                        <input name="idPer"
                                               type="text"
                                               id="idPer"
                                               class="form-control"
                                               value="<%=Operador.getIdPer()%>"
                                               placeholder=<%=Operador.getIdPer()%>
                                               readonly/></div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="nombre">Nombre</label>
                                        <input
                                                name ="nombre"
                                                type="text"
                                                id="nombre"
                                                class="form-control"
                                                value="<%=Operador.getNombre()%>"
                                                placeholder="Ingrese su Nombre"
                                        >
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="apellido">Apellidos</label>
                                        <input  name ="apellido"
                                                type="text"
                                                id="apellido"
                                                class="form-control"
                                                value="<%=Operador.getApellido()%>"
                                                placeholder="Ingrese su Apellido"
                                        >
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="email">Correo</label>
                                        <input  name ="email"
                                                type="text"
                                                id="email"
                                                class="form-control"
                                                value="<%=Operador.getEmail()%>"
                                                placeholder="Ingrese su email"
                                        >
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="direccion">Direccion</label>
                                        <input  name ="direccion"
                                                type="text"
                                                id="direccion"
                                                class="form-control"
                                                value="<%=Operador.getDireccion()%>"
                                                placeholder="Ingrese su direccion"
                                        >
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="numCel">Numero de contacto</label>
                                        <input  name ="numCel"
                                                type="text"
                                                id="numCel"
                                                class="form-control"
                                                value="<%=Operador.getNumCel()%>"
                                                placeholder="Ingrese su numero de celular"
                                        >
                                    </div>

                                </div>

                                <div class="col-md-6 mb-4 text-center">
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

                                </div>
                            </div>

                            <button type="submit" class="btn btn-tele">Guardar Edicion</button>

                        </form>
                    </div>
                </div>
            </div>
    </div>
</main>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>