<%@ page import="com.example.javasticketscentro.Beans.BSede" %>
<%@ page import="com.example.javasticketscentro.Beans.BSala" %>
<%@ page import="com.example.javasticketscentro.Beans.BCelebridad" %><%--
  Created by IntelliJ IDEA.
  User: stefh
  Date: 6/06/2022
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listarsala" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BSala>"/>
<jsp:useBean id="listarsede" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BSede>"/>
<jsp:useBean id="listarDirector" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BCelebridad>"/>
<jsp:useBean id="listarActor" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BCelebridad>"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>Centro Cultural PUCP - Perfil de usuario</title>
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
                class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end"
        >
            <a
                    class="btn btn-tele-inverso"
                    role="button"
                    href="usuarioCarrito.html"
            >
                <div style="font-size: 0.6rem">
                    <!--para cambios más precisos del tamaño-->
                    <i class="fas fa-cart-plus fa-3x"></i>
                </div>
            </a>
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
                                src="assets/img/images.png"
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
<body>
<section class="vh-100 py-5">
    <div class="container py-2 h-50">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div
                        class="card shadow-2-strong card-registration"
                        style="border-radius: 15px; margin-top: 100px"
                >
                    <div
                            class="card-header"
                            style="background-color: #e72d4b; color: white"
                    >
                        <h4 class="my-8">Registrar función</h4>
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <form method="POST" action="<%=request.getContextPath()%>/peliculaVisualizacionServlet?action=guardar">
                            <div class="row">
                                <div class="col-md-6 mb-1">
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Nombre de la pelicula</label
                                        >
                                        <input
                                                type="text"
                                                name="nombrePeli"
                                                id="productName"
                                                class="form-control"
                                                placeholder="Ingrese el nombre de la película"/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Genero</label
                                        >
                                        <input
                                                type="text"
                                                name="genero"
                                                id="productName"
                                                class="form-control"
                                                placeholder="Ingrese el género de la pelicula"
                                        />
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName">Ingrese la duración de la pelicula</label>
                                        <label class="form-label" for="productName">Tiempo de duración</label>
                                        <input
                                                type="time"
                                                name="tiempo"
                                                id="productName"
                                                class="form-control"
                                                placeholder="Ingrese la duracion de la pelicula"/> </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Ingrese la fecha</label
                                        >
                                        <input
                                                type="date"
                                                name="fecha"
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
                                                name="restriccionEdad"
                                                onchange="change_country(this.value)"
                                                class="frm-field required sect"
                                        >
                                            <option>Seleccionar</option>
                                            <option>Para todo publico (AA)</option>
                                            <option>+12 (B)</option>
                                            <option>+15(B15)</option>
                                            <option>+18 (C)</option>
                                            <option>Explicitas o lenguaje violento(D)</option>
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
                                            <option>Seleccionar</option>
                                            <%for(BSala bsalas : listarsala){%>
                                            <option value="<%=bsalas.getNumero()%>"><%=bsalas.getNumero()%></option>
                                            <%}%>
                                        </select>
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
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="productName"
                                        >Desea Cambiar el aforo: </label
                                        >
                                        <select
                                                id="country1"
                                                name="restriccionEdad"
                                                onchange="change_country(this.value)"
                                                class="frm-field required sect"
                                        >
                                            <option>Si</option>
                                            <option>No</option>
                                        </select>
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
                                            <%for(BSede bSede : listarsede){%>
                                            <option value="<%=bSede.getNombre()%>"><%=bSede.getNombre()%></option>
                                            <%}%>
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
                                    <%for(BCelebridad bCelebridad : listarDirector){%>
                                    <option value="<%=bCelebridad.getNombre()%>"><%=bCelebridad.getNombre()%></option>
                                    <%}%>
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
                                    <%for(BCelebridad bCelebridad : listarActor){%>
                                    <option value="<%=bCelebridad.getNombre()%>"><%=bCelebridad.getNombre()%></option>
                                    <%}%>
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
                                    <%for(BCelebridad bCelebridad : listarActor){%>
                                    <option value="<%=bCelebridad.getNombre()%>"><%=bCelebridad.getNombre()%></option>
                                    <%}%>
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
                                    <%for(BCelebridad bCelebridad : listarActor){%>
                                    <option value="<%=bCelebridad.getNombre()%>"><%=bCelebridad.getNombre()%></option>
                                    <%}%>
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
                                    <%for(BCelebridad bCelebridad : listarActor){%>
                                    <option value="<%=bCelebridad.getNombre()%>"><%=bCelebridad.getNombre()%></option>
                                    <%}%>
                                </select>
                            </div>

                            <div class="">
                                <a
                                        href="<%=request.getContextPath()%>/peliculaVisualizacionServlet"
                                        class="btn btn-danger" type="submit"
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

