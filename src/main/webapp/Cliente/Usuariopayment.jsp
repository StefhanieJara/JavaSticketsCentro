<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 05/06/2022
  Time: 09:08 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
        <meta charset="utf-8" />
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
        />
        <title>Centro Cultural PUCP-Gestión Salas</title>
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
                                        src="img/images.png"
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
        <main>
            <section class="vh-100">
                <div class="container py-4 h-100">
                    <div class="row justify-content-center align-items-center h-100">
                        <div class="col-12 col-lg-9 col-xl-7">
                            <div
                                    class="card shadow-2-strong card-registration"
                                    style="border-radius: 15px">
                                <div
                                        class="card-header"
                                        style="background-color: #e72d4b; color: white">
                                    <h4 class="my-2">Realice el pago:</h4>
                                </div>
                                <div class="card-body p-4 p-md-5">
                                    <form method="POST" action="<%=request.getContextPath()%>/UsuarioCarritoIndex?action=guardar">
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-outline">
                                                    <label class="form-label" for="Name"
                                                    >Ingrese el número de su tarjeta</label
                                                    >
                                                    <input
                                                            type="number"
                                                            id="Name"
                                                            class="form-control"
                                                            name="numeroTarjeta"
                                                            placeholder="Ingrese numero de tarjeta"
                                                    />
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-outline">
                                                    <label class="form-label" for="Mail"
                                                    >CVV</label
                                                    >
                                                    <input
                                                            type="number"
                                                            id="Mail"
                                                            class="form-control"
                                                            name="cvv"
                                                            placeholder="Ingrese el cvv"
                                                    />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-outline">
                                                    <label class="form-label" for="Mail"
                                                    >Fecha de vencimiento</label
                                                    >
                                                    <input
                                                            type="text"
                                                            id="Mail"
                                                            class="form-control"
                                                            name="fechaVencimiento"
                                                            placeholder="07/2022"
                                                    />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-outline">
                                                    <label class="form-label" for="Mail"
                                                    >Ingrese el banco</label
                                                    >
                                                    <input
                                                            type="text"
                                                            id="Mail"
                                                            class="form-control"
                                                            name="bancoNombre"
                                                            placeholder="Ingrese el nombre del banco"
                                                    />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-outline">
                                                    <label class="form-label" for="Mail"
                                                    >Ingrese su id de cliente</label
                                                    >
                                                    <input
                                                            type="text"
                                                            id="Mail"
                                                            class="form-control"
                                                            name="id_cliente"
                                                            placeholder="Ingrese su id
                                                    />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">

                                            <div class="form-outline mb-4 py-4">
                                                <label class="form-label" for="productName"
                                                >Elija el tipo de tarjeta</label
                                                >
                                                <select name="tipoTarjeta"
                                                        id="country1"
                                                        onchange="change_country(this.value)"
                                                        class="frm-field required sect"
                                                >
                                                    <option selected="true" disabled="disabled">Select </option>
                                                    <option >Credito</option>
                                                    <option >Debito</option>
                                                </select>
                                            </div>

                                            <div class="row row-cols-3 justify-content-center">
                                                <input
                                                        class="btn btn-tele"
                                                        type="submit"
                                                        value="Realizar pago"
                                                />
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>

