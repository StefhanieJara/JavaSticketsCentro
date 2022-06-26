<%@ page import="com.example.javasticketscentro.Servlets.ADServlet" %><%--
  Created by IntelliJ IDEA.
  User: stefh
  Date: 6/06/2022
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
        <meta charset="utf-8" />
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
        />
        <title>Centro Cultural PUCP Registrar Celebridad</title>
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
                        <h4 class="my-2">Registrar Celebridad</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form method="POST" action="<%=request.getContextPath()%>/ADServlet?action=crear">
                            <div class="row">
                                <div class="col-md-6 mb-1">
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Nombres de la celebridad</label
                                        >
                                        <input
                                                name = "nombresCeleb"
                                                type="text"
                                                id="productName"
                                                class="form-control"
                                                placeholder="Ingrese los nombres"
                                        />
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Apellidos de la celebridad</label
                                        >
                                        <input
                                                name = "apellidosCeleb"
                                                type="text"
                                                id="productName"
                                                class="form-control"
                                                placeholder="Ingrese los apellidos"
                                        />
                                    </div>
                                    <div class="d-flex justify-content-start my-3">
                                        <div class="pb-1">Rol:&nbsp;&nbsp;&nbsp;</div>
                                        <div class="form-outline mb-4 py-4 dropdown">
                                            <select name="rol"
                                                    id="country1"
                                                    class="frm-field required sect"
                                            >
                                                <option selected="true" disabled="disabled">Seleccione el rol</option>
                                                <option >Actor</option>
                                                <option >Director</option>
                                            </select>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-md-6 mb-4 text-center">
                                    <div class="text-center mt-2 mb-3">
                                        <img id="img-preview" style="max-width: 300px; resize: both; max-width: 300px" />
                                    </div>
                                    <div class="d-flex justify-content-center my-3">
                                        <input type="file" id="img-uploader">

                                    </div>
                                    <progress id="img-upload-bar" width="10px" value="0" max="100"
                                              style="width: 100%"></progress>
                                </div>
                                <input type="hidden" name="photoUrl" id="photoUrl" />
                            </div>
                            <button type="submit" id="enviar" class="btn btn-danger">Registrar celebridad</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.min.js"></script>
<script src="assets/appSubirImagen.js"></script>
</body>
</html>

