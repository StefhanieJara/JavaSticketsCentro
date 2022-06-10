<%--
  Created by IntelliJ IDEA.
  User: stefh
  Date: 6/06/2022
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <meta charset="utf-8" />
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
        />
        <title>Centro Cultural PUCP - Editar Función</title>
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
                        <h4 class="my-2">Registrar función</h4>
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
                                        >Genero</label
                                        >
                                        <input
                                                type="text"
                                                id="productName"
                                                class="form-control"
                                                placeholder="Ingrese el género de la pelicula"
                                        />
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Ingrese la duración de la pelicula</label
                                        >
                                        <label class="form-label" for="productName"
                                        >Hora inicio</label
                                        >
                                        <input
                                                type="time"
                                                id="productName"
                                                class="form-control"
                                                placeholder="Ingrese la duracion de la pelicula"
                                        />
                                        <label class="form-label" for="productName"
                                        >Hora Fin</label
                                        >
                                        <input
                                                type="time"
                                                id="productName"
                                                class="form-control"
                                                placeholder="Ingrese la duracion de la pelicula"
                                        />
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Ingrese la fecha</label
                                        >
                                        <input
                                                type="date"
                                                id="productName"
                                                class="form-control"
                                                placeholder="Ingrese el nombre de la película"
                                        />
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Restricción de edad</label
                                        >
                                        <select
                                                id="country1"
                                                onchange="change_country(this.value)"
                                                class="frm-field required sect"
                                        >
                                            <option value="null">Seleccionar</option>
                                            <option value="null">Para todo publico (AA)</option>
                                            <option value="null">+12 (B)</option>
                                            <option value="null">+15(B15)</option>
                                            <option value="null">+18 (C)</option>
                                            <option value="null">
                                                Explicitas o lenguaje violento(D)
                                            </option>
                                        </select>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Elija el numero de sala</label
                                        >
                                        <select
                                                id="country1"
                                                onchange="change_country(this.value)"
                                                class="frm-field required sect"
                                        >
                                            <option value="null">Seleccionar</option>
                                            <option value="null">1A</option>
                                            <option value="null">1B</option>
                                            <option value="null">1C</option>
                                            <option value="null">1D</option>
                                        </select>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Grupo de mantenimiento</label
                                        >
                                        <select
                                                id="country1"
                                                onchange="change_country(this.value)"
                                                class="frm-field required sect"
                                        >
                                            <option value="null">Seleccionar</option>
                                            <option value="null">1</option>
                                            <option value="null">2</option>
                                            <option value="null">3</option>
                                            <option value="null">4</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6 mb-4 text-center">
                                    <label for="formFile" class="form-label"
                                    >Imagen Referencial</label
                                    >
                                    <div class="text-center mt-2 mb-3">
                                        <img
                                                src="assets/img/doctorStrange.jpg"
                                                class="img-thumbnail"
                                                width="100px"
                                                height="100px"
                                                alt="pelicula"
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
                                    <div class="form-outline">
                                        <label class="form-label" for="productPrice"
                                        >Precio por ticket</label
                                        >
                                        <input
                                                type="price"
                                                id="productPrice"
                                                class="form-control"
                                                placeholder="S/."
                                        />
                                    </div>

                                    <div class="form-outline mb-4 py-4">
                                        <label class="form-label" for="productName"
                                        >Elija la sede</label
                                        >
                                        <select
                                                id="country1"
                                                onchange="change_country(this.value)"
                                                class="frm-field required sect"
                                        >
                                            <option value="null">Seleccionar</option>
                                            <option value="null">Chacarilla</option>
                                            <option value="null">Molina</option>
                                            <option value="null">Lince</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-4 pb-2">
                                    <div class="form-outline">
                                        <label class="form-label" for="productoDescription"
                                        >Sinopsis</label
                                        >
                                        <textarea
                                                type="tel"
                                                id="productoDescription"
                                                class="form-control"
                                        ></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label" for="productName">Director</label>
                                <select
                                        id="country1"
                                        onchange="change_country(this.value)"
                                        class="frm-field required sect"
                                >
                                    <option value="null">Seleccionar</option>
                                    <option value="null">Sam Rami</option>
                                    <option value="null">Guilermo del Toro</option>
                                    <option value="null">Bong Joon-ho</option>
                                    <option value="null">Jon Watts</option>
                                </select>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label" for="productName"
                                >Actor/actriz protagonista 1</label
                                >
                                <select
                                        id="country1"
                                        onchange="change_country(this.value)"
                                        class="frm-field required sect"
                                >
                                    <option value="null">Seleccionar</option>
                                    <option value="null">Sam Rami</option>
                                    <option value="null">Guilermo del Toro</option>
                                    <option value="null">Bong Joon-ho</option>
                                    <option value="null">Jon Watts</option>
                                </select>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label" for="productName"
                                >Actor/actriz protagonista 2</label
                                >
                                <select
                                        id="country1"
                                        onchange="change_country(this.value)"
                                        class="frm-field required sect"
                                >
                                    <option value="null">Seleccionar</option>
                                    <option value="null">Sam Rami</option>
                                    <option value="null">Guilermo del Toro</option>
                                    <option value="null">Bong Joon-ho</option>
                                    <option value="null">Jon Watts</option>
                                </select>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label" for="productName"
                                >Actor/actriz protagonista 3</label
                                >
                                <select
                                        id="country1"
                                        onchange="change_country(this.value)"
                                        class="frm-field required sect"
                                >
                                    <option value="null">Seleccionar</option>
                                    <option value="null">Sam Rami</option>
                                    <option value="null">Guilermo del Toro</option>
                                    <option value="null">Bong Joon-ho</option>
                                    <option value="null">Jon Watts</option>
                                </select>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label" for="productName"
                                >Actor/actriz protagonista 4</label
                                >
                                <select
                                        id="country1"
                                        onchange="change_country(this.value)"
                                        class="frm-field required sect"
                                >
                                    <option value="null">Seleccionar</option>
                                    <option value="null">Sam Rami</option>
                                    <option value="null">Guilermo del Toro</option>
                                    <option value="null">Bong Joon-ho</option>
                                    <option value="null">Jon Watts</option>
                                </select>
                            </div>

                            <div class="">
                                <a
                                        href="<%=request.getContextPath()%>/peliculaVisualizacionServlet"
                                        class="btn btn-danger"
                                >Registrar Funcion</a>
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

