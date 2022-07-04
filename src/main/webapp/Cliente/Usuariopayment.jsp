<%@ page import="com.example.javasticketscentro.Beans.BTarjeta" %><%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 05/06/2022
  Time: 09:08 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="tarjetas" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BTarjeta>"/>
<jsp:useBean id="tarjetaSelect" scope="request" type="com.example.javasticketscentro.Beans.BTarjeta" class="com.example.javasticketscentro.Beans.BTarjeta"/>
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
                class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger">
            <div class="row w-100 align-items-center pe-sm-4 ps-0 my-2">
                <!--Logo Centro Cultural PUCP-->
                <div
                        class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2"
                >
                    <a class="navbar-brand py-0" href="#">
                        <a href="<%=request.getContextPath()%>/"><img src="img/logo.png" /></a>
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
            <!--Boton retornar-->
            <div
                    class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex">
                <a
                        class="btn btn-tele-inverso"
                        role="button"
                        href="<%=request.getContextPath()%>/UsuarioCarritoIndex?action=listar">
                    <div style="font-size: 0.6rem">
                        <!--para cambios más precisos del tamaño-->
                        <i class="fa fa-caret-square-o-left fa-3x"></i>
                    </div>
                </a>
            </div>
        </nav>

        <!--Menú de usuario2-->
        <div class="offcanvas offcanvas-end text-center" tabindex="-1" id="menuDeUsuario" aria-labelledby="menuDeUsuario">
            <div class="d-flex align-items-center flex-column mb-3 vh-100">
                <!--Título y botón-->
                <div class="p-2 w-100">
                    <div class="offcanvas-header border-bottom">
                        <h5 class="mb-0">Menú de Usuario</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                                aria-label="Close"></button>
                    </div>
                </div>
                <!--Foto usuario y opciones-->
                <div class="p-2">
                    <div class="offcanvas-body p-3">
                        <div class="d-flex flex-column">
                            <div class="my-2">
                                <h4 class="mb-3"><%=clienteLog.getNombre()+" "+clienteLog.getApellido()%></h4>
                                <img src="<%=clienteLog.getFoto()%>"
                                     class="rounded-circle mx-auto d-block mb-3 h-25 w-50" alt="profile image">
                            </div>
                            <div class="mb-3">
                                <div class="p-2">
                                    <a href="<%=request.getContextPath()%>/UsuarioEditaPerfilServlet?id=<%=clienteLog.getIdPer()%>" class="text-dark text-decoration-none">
                                        <span><i class="fas fa-user-edit"></i></span>
                                        <span>Editar perfil</span>
                                    </a>
                                </div>
                                <div class="p-2">
                                    <a href="<%=request.getContextPath()%>/UsuarioHistorial_2Servlet?action=listar" class="text-dark text-decoration-none">
                                        <span><i class="fas fa-list"></i></span>
                                        <span>Historial de tickets</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Footer cerrar sesión-->
                <div class="mt-auto p-2 w-100">
                    <div class="offcanvas-body border-top pt-4">
                        <a href="<%=request.getContextPath()%>/UsuariologinclientServlet?action=logout" class="text-dark text-decoration-none">
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
                                <div class="card-header"
                                        style="background-color: #e72d4b; color: white">
                                    <h4 class="my-2">Realice el pago:</h4>
                                </div>
                                <div class="card-body p-4 p-md-5">
                                    <div class="row mb-3">
                                        <div class="form-outline mb-4 py-4">
                                            <form method="POST" action="<%=request.getContextPath()%>/UsuarioCarritoIndex?action=cambiarTarjeta">
                                                <label class="form-label">Elija el tipo de tarjeta</label>
                                                <select name="tarjeta"
                                                        class="frm-field required sect">
                                                    <%for (BTarjeta tarjeta:tarjetas){%>
                                                    <option <%=tarjetaSelect.getIdTarjeta()==tarjeta.getIdTarjeta() ? "selected" : ""%> value="<%=tarjeta.getIdTarjeta()%>">Tarjeta ID: <%=tarjeta.getIdTarjeta()%></option>
                                                    <%}%>
                                                    <option  <%=tarjetaSelect.getIdTarjeta()==0 ? "selected" : ""%> value="-1">Ingresar una tarjeta no registrada</option>
                                                </select>
                                                <button class="btn btn-dark"
                                                        type="submit">Cambiar Tarjeta</button>
                                            </form>
                                        </div>
                                    </div>

                                    <form method="POST" action="<%=request.getContextPath()%>/UsuarioCarritoIndex?action=guardar">
                                        <%if(tarjetaSelect.getIdTarjeta()!=0){%>
                                            <input type="hidden" name="numeroTarjeta" value="<%=tarjetaSelect.getNumerTar()%>">
                                            <input type="hidden" name="cvv" value="<%=tarjetaSelect.getCVV()%>">
                                            <input type="hidden" name="fechaVencimiento" value="<%=tarjetaSelect.getFechaV()%>">
                                            <input type="hidden" name="bancoNombre" value="<%=tarjetaSelect.getBanco()%>">
                                            <input type="hidden" name="tipoTarjeta" value="<%=tarjetaSelect.getTipo()%>">
                                        <%}%>
                                        <input type="hidden" name="idTarjeta" value="<%=tarjetaSelect.getIdTarjeta()==0? -1 : tarjetaSelect.getIdTarjeta()%>">
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-outline">
                                                    <label class="form-label">
                                                        Ingrese el número de su tarjeta
                                                    </label>
                                                    <input <%= tarjetaSelect.getIdTarjeta()!=0 ? "disabled" : "required"%>
                                                            type="text"
                                                            class="form-control"
                                                            name="numeroTarjeta"
                                                            maxlength="16"
                                                            minlength="16"
                                                            placeholder="################"
                                                            value="<%= tarjetaSelect.getIdTarjeta()!=0 ?tarjetaSelect.getNumerTar() : ""%>"
                                                    />
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-outline">
                                                    <label class="form-label" for="Mail">CVV</label>
                                                    <input <%= tarjetaSelect.getIdTarjeta()!=0 ? "disabled" : "required"%>
                                                            type="text"
                                                            id="Mail"
                                                            class="form-control"
                                                            minlength="3"
                                                            maxlength="3"
                                                            name="cvv"
                                                            placeholder="Ingrese el cvv"
                                                            value="<%= tarjetaSelect.getIdTarjeta()!=0 ?tarjetaSelect.getCVV() : ""%>"
                                                    />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-outline">
                                                    <label class="form-label" for="Mail"
                                                    >Fecha de Vencimiento</label
                                                    >
                                                    <input <%= tarjetaSelect.getIdTarjeta()!=0 ? "disabled" : "required"%>
                                                            type="text"
                                                            class="form-control"
                                                            name="fechaVencimiento"
                                                            minlength="5"
                                                            maxlength="5"
                                                            placeholder="MM/YY"
                                                            value="<%= tarjetaSelect.getIdTarjeta()!=0 ?tarjetaSelect.getFechaV() : ""%>"
                                                    />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-outline">
                                                    <label class="form-label" for="Mail"
                                                    >Ingrese el banco</label
                                                    >
                                                    <input <%= tarjetaSelect.getIdTarjeta()!=0 ? "disabled" : "required"%>
                                                            type="text"
                                                            class="form-control"
                                                            name="bancoNombre"
                                                            placeholder="Ingrese el nombre del banco"
                                                            value="<%= tarjetaSelect.getIdTarjeta()!=0 ?tarjetaSelect.getBanco() : ""%>"
                                                    />
                                                </div>

                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-outline mb-4 py-4">
                                                <label class="form-label">Elija el tipo de tarjeta</label>
                                                <select name="tipoTarjeta"
                                                        class="frm-field required sect">
                                                    <option <%= tarjetaSelect.getIdTarjeta()!=0 ? "disabled" : ""%> value="tarjeta de crédito" <%=tarjetaSelect.getIdTarjeta()!=0 ? (tarjetaSelect.getTipo().equals("tarjeta de crédito") ? "selected" :"") :""%>>Credito</option>
                                                    <option <%= tarjetaSelect.getIdTarjeta()!=0 ? "disabled" : ""%> value="tarjeta de débito" <%=tarjetaSelect.getIdTarjeta()!=0 ? (tarjetaSelect.getTipo().equals("tarjeta de débito") ? "selected" :"") :""%>>Debito</option>
                                                </select>
                                                </div>
                                            </div>
                                        </div>
                                        <%if(session.getAttribute("msg")!=null){%>
                                        <%if(session.getAttribute("msg").equals("errorFV")){%>
                                            <div class="text-danger mb-2">El formato de Fecha de Vencimiento es inválido</div>
                                        <%}%>
                                        <%if(session.getAttribute("msg").equals("numTaroCVV")){%>
                                        <div class="text-danger mb-2">El CVV o el número de Tarjeta es inválido</div>
                                        <%}%>
                                        <%if(session.getAttribute("msg").equals("errorAntivirus")){%>
                                        <div class="text-warning mb-2">Porfavor, desactive su antivirus para realizar la compra y recibir un correo de confirmación!</div>
                                        <%}%>
                                        <%session.removeAttribute("msg");%>
                                        <%}%>
                                        <div class="row row-cols-3 justify-content-center">
                                            <button id="btnSubmit"
                                                    class="btn btn-tele"
                                                    type="submit">Realizar pago</button>
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

        <!-- JavaScript Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--JS-->
        <script>
            $("#btnSubmit").click(function (){
                $(this).html(
                    `<span class="spinner-border spinner-border-sm"
                role="status" aria-hidden="true"></span> Pagando...`
                );
            });
        </script>
    </body>
</html>