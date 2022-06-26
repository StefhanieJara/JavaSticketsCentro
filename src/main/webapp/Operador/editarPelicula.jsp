<%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 06/06/2022
  Time: 01:20
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
        <title>Centro Cultural PUCP - Editar Producto</title>
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
                        <h4 class="my-2">Editar función</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-1">
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Nombre de la pelicula</label
                                        >
                                        <input
                                                type="text"
                                                id="productName"
                                                class="form-control"
                                                placeholder="Ingrese el nombre de la película"
                                        />
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Género de la pelicula</label
                                        >
                                        <input
                                                type="text"
                                                id="productName"
                                                class="form-control"
                                                placeholder="Ingrese el nombre de la película"
                                        />
                                    </div>
                                </div>

                                <div class="col-md-6 mb-4 text-center">
                                    <label for="formFile" class="form-label"
                                    >Imagen Referencial</label
                                    >
                                    <div class="text-center mt-2 mb-3">
                                        <img
                                                src="img/doctorStrange.jpg"
                                                class="img-thumbnail"
                                                width="100px"
                                                height="100px"
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
                                    <div class="d-flex justify-content-start my-3">
                                        <div class="pb-1">
                                            ¿Desea cambiar el aforo?&nbsp;&nbsp;&nbsp;
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="inlineRadioOptions"
                                                    id="siReceta"
                                                    value="option1"
                                                    checked
                                            />
                                            <label class="form-check-label" for="siReceta"
                                            >Sí</label
                                            >
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="inlineRadioOptions"
                                                    id="noReceta"
                                                    value="option2"
                                            />
                                            <label class="form-check-label" for="noReceta"
                                            >No</label
                                            >
                                        </div>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productStock"
                                        >Stock de tickets disponible</label
                                        >
                                        <input
                                                type="number"
                                                id="productStock"
                                                class="form-control"
                                                placeholder="0"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="">
                                <a
                                        href="<%=request.getContextPath()%>/editarPeliculaServlet"
                                        class="btn btn-danger"
                                >Editar Pelicula</a>
                            </div>
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