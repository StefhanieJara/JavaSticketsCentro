<%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 06/06/2022
  Time: 00:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Centro Cultural PUCP - Historial de Compras</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/estilos.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/5733880de3.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="assets/css/styles_veneko.css"/>
</head>
<body>
<nav
        class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger"
>
    <div
            class="row w-100 align-items-center d-sm-flex d-flex pe-sm-4 ps-0 my-2"
    >
        <div
                class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2"
        >
            <a class="navbar-brand py-0" href="#">
                <a href="personal.html"><img src="img/logo.png" /></a>
            </a>
        </div>

        <div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0">
            <div class="input-group">
                <div class="form-outline" style="width: 50%">
                    <input
                            type="search"
                            id="form1"
                            class="form-control"
                            placeholder="Buscar operador"
                    />
                </div>
                <button type="button" class="btn btn-tele border-start-1">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
        <div
                class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end"
        ></div>
        <div
                class="col-xl-1 col-lg-1 col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0"
        >
            <button
                    class="btn"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasWithBackdrop"
                    aria-controls="offcanvasWithBackdrop"
                    style="color: #ffffff"
            >
                <div style="font-size: 0.62rem">
                    <i class="fas fa-user-circle fa-3x"></i>
                </div>
            </button>
        </div>
    </div>
</nav>
<div
        class="offcanvas offcanvas-end text-center"
        tabindex="-1"
        id="offcanvasWithBackdrop"
        aria-labelledby="offcanvasWithBackdropLabel"
>
    <div class="d-flex align-items-center flex-column mb-3 vh-100">
        <div class="p-2 w-100">
            <div class="offcanvas-header border-bottom">
                <h5 class="mb-0">Menú de Administrador</h5>
                <button
                        type="button"
                        class="btn-close text-reset"
                        data-bs-dismiss="offcanvas"
                        aria-label="Close"
                ></button>
            </div>
        </div>
        <div class="p-2">
            <div class="offcanvas-body p-3">
                <div class="d-flex flex-column">
                    <div class="my-2">
                        <h4 class="mb-3">Rex Campos Díaz</h4>
                        <img
                                src="img/images.png"
                                class="rounded-circle mx-auto d-block mb-3 h-25 w-50"
                                alt="profile image"
                        />
                    </div>
                    <div class="mb-3">
                        <div class="p-2">
                            <a
                                    href="gestionSalas.html"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-list"></i></span>
                                <span>Gestione Personal</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a
                                    href="peliculaVisualizacion.html"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-list"></i></span>
                                <span>Gestione Funciones</span>
                            </a>
                        </div>
                        <div class="p-2">
                            <a
                                    href="visualizacionOperadores.html"
                                    class="text-dark text-decoration-none"
                            >
                                <span><i class="fas fa-list"></i></span>
                                <span>Visualizar Estadísticas</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-auto p-2 w-100">
            <div class="offcanvas-body border-top pt-4">
                <a href="#" class="text-dark text-decoration-none">
                    <span><i class="fas fa-sign-out-alt"></i></span>
                    <span>Cerrar sesión</span>
                </a>
            </div>
        </div>
    </div>
</div>

<!--Card Historial de Compras-->
<div class="container-transition">
    <div class="card">
        <!--Título-->
        <div class="card-header card-header-tele" style="background:#E72D4B">
            <h4 class="my-2">Mantenimiento de operadores</h4>
        </div>
        <!--Contenido-->
        <div class="card-body">
            <div class="rounded py-2">
                <div class="table-responsive">
                    <table class="table">
                        <!--Cabecera pedidos-->
                        <thead>
                        <tr class="text-center">
                            <th class="col-1">ID</th>
                            <th class="col-2">Nombre</th>
                            <th class="col-2">Apellido</th>
                            <th class="col-1">Foto</th>
                            <th class="col-2">Fecha</th>
                            <th class="col-1">Ingreso</th>
                            <th class="col-1">Sede</th>
                        </tr>
                        </thead>
                        <!--Pedidos-->
                        <tbody class="text-center">
                        <!--Pedido 1-->
                        <tr class="cell-1">
                            <td>#412</td>
                            <td>Stephanie Martha</td>
                            <td>Gutarra Luren</td>
                            <td><img width=160px; height=80px; src="img/cinePersonal.jpg"/></td>
                            <td><i class="far fa-clock"></i>&nbsp;&nbsp;15/07/2022 </td>
                            <td>17:20</td>
                            <td>Miraflores</td>
                        </tr>


                        <!--Pedido 2-->
                        <tr class="cell-1">
                            <td>#173</td>
                            <td>Marko Julio</td>
                            <td>Merkas Atenue</td>
                            <td><img width=160px; height=80px; src="img/hombreBoletos.jpg"/></td>
                            <td><i class="far fa-clock"></i>&nbsp;&nbsp;12/07/2022 </td>
                            <td>19:20</td>
                            <td>Chacarilla</td>
                        </tr>


                        <!--Pedido 3-->
                        <tr class="cell-1">
                            <td>#641</td>
                            <td>Jhon Pardo</td>
                            <td>Custodio Dotena</td>
                            <td><img width=160px; height=80px; src="img/Clientes.jpg"/></td>
                            <td><i class="far fa-clock"></i>&nbsp;&nbsp;13/07/2022 </td>
                            <td>15:10</td>
                            <td>Lince</td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <br><br>
    <div class="container px-4">
        <div class="row gx-5">
            <div class="col text-center">
                <a href="#" onclick="toggleLogin()" class="btn btn-danger rounded-pill botonInicio" style=" background-color: #E72D4B; color: white">Crear Operador</a>
            </div>
            <div class="col text-center">
                <a href="#" class="btn btn-danger rounded-pill botonInicio" style=" background-color: #E72D4B; color: white">Seleccionar Operador</a>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<div class="overlay">
    <div class="container px-4" style="background:white">
        <br>
        <div class="header">
            <h1>Ingrese nuevo operador</h1>
            <i class="btn fas fa-times" onclick="toggleLogin()"></i>
        </div>
        <br>
        <div class="row">
            <div class="col-md-4">
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput">Ingrese sus nombres</label>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput">Ingrese sus apellidos</label>
                </div>
            </div>
        </div>
        <div class="row gx-5">
            <div class="col">
                Ingrese Fecha:
                <div class="form-floating mb-3">
                    <input type="date" class="form-control" id="floatingInput1">
                    <label for="floatingInput1">Ingrese aquí</label>
                </div>
            </div>
            <div class="col">
                Hora de ingreso:
                <div class="form-floating mb-3">
                    <input type="time" class="form-control" id="floatingInput2" placeholder="Hora">
                    <label for="floatingInput2">Ingrese aquí</label>
                </div>
            </div>
            <div class="col">
                Seleccione Sede:
                <select class="form-select" aria-label="Default select example">
                    <option selected>Elije la sede</option>
                    <option value="1">Lince</option>
                    <option value="2">Miraflores</option>
                    <option value="3">Chacarilla</option>
                </select>
            </div>
        </div>
        <br>
    </div>
</div>
<!--JS-->
<script src="main.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
<script>
    function toggleLogin() {
        document.querySelector(".overlay").classList.toggle("open");
    }
</script>
</html>