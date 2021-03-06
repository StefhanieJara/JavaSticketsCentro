<%@ page import="com.example.javasticketscentro.Beans.Bticket" %><%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 05/06/2022
  Time: 09:14 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="carrito" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.Bticket>"/>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<!DOCTYPE html>
<html lang="en">
<style>
    #Funciones_seleccionadas{
        border-color: rgba(0, 0, 0, 0.87);
        background-color: rgba(0, 0, 0, 0.87);
    }
    #resumen{
        border-color: rgba(0, 0, 0, 0.87);
        background-color: rgba(0, 0, 0, 0.87);
    }
</style>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Centro Cultural PUCP -Carrito de compras</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/estilos.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/5733880de3.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="assets/css_2/checkout.css" />
    <script
            src="https://kit.fontawesome.com/5733880de3.js"
            crossorigin="anonymous"></script>
</head>
<body>
<!--Cabecera Principal cliente-->
<nav class="navbar navbar-expand-md fixed-top shadow-sm justify-content-center bg-danger">
    <div class="row w-100 align-items-center pe-sm-4 ps-0 my-2">
        <!--Logo Centro Cultural PUCP-->
        <div class="col-md-3 col-sm-5 col-6 d-flex justify-content-center ps-xxl-2 ps-xl-5 ps-lg-4 ps-md-5 ps-2">
            <a href="<%=request.getContextPath()%>/"><img src="img/logo.png" with="188px" height="97px" /></a>
        </div>
        <!--Carrito-->
        <div class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end ">
            <a class="btn btn-tele-inverso" role="button" href="<%=request.getContextPath()%>/UsuarioCarritoIndex">
                <div style="font-size: 0.60rem"> <!--para cambios m??s precisos del tama??o-->
                    <i class="fas fa-cart-plus fa-3x"></i>
                </div>
            </a>
        </div>
        <!--Men?? usuario-->
        <div class="col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <button class="btn btn-tele-inverso" type="button" data-bs-toggle="offcanvas" data-bs-target="#menuDeUsuario"
                    aria-controls="menuDeUsuario">
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
                href="<%=request.getContextPath()%>/<%=(Boolean)session.getAttribute("vieneDePeli") ? "UsuariodescripcionServlet?action=describir&id="+session.getAttribute("idPeli") : ""%>">
            <div style="font-size: 0.6rem">
                <!--para cambios m??s precisos del tama??o-->
                <i class="fa fa-caret-square-o-left fa-3x"></i>
            </div>
        </a>
    </div>
</nav>

    <!--Men?? de usuario2-->
    <div class="offcanvas offcanvas-end text-center" tabindex="-1" id="menuDeUsuario" aria-labelledby="menuDeUsuario">
        <div class="d-flex align-items-center flex-column mb-3 vh-100">
            <!--T??tulo y bot??n-->
            <div class="p-2 w-100">
                <div class="offcanvas-header border-bottom">
                    <h5 class="mb-0">Men?? de Usuario</h5>
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
                            <img src="<%=clienteLog.getFoto().contains("http") ?clienteLog.getFoto() :request.getContextPath()+"/UsuarioEditaPerfilServlet?action=entregarImagen"%>"
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
                                <a href="<%=request.getContextPath()%>/UsuarioHistorial_2Servlet" class="text-dark text-decoration-none">
                                    <span><i class="fas fa-list"></i></span>
                                    <span>Historial de tickets</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Footer cerrar sesi??n-->
            <div class="mt-auto p-2 w-100">
                <div class="offcanvas-body border-top pt-4">
                    <a href="<%=request.getContextPath()%>/UsuariologinclientServlet?action=logout" class="text-dark text-decoration-none">
                        <span><i class="fas fa-sign-out-alt"></i></span>
                        <span>Cerrar sesi??n</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
<!--Contenido-->
<main>
    <br><br>
    <!--Alinear cabecera con contenido-->
    <div class="card-header my-5"></div>
    <!--Carrito-->
    <div class="container pb-5 mt-2 mt-md-3">
        <div class="row">
            <!--Productos en carrito-->
            <div class="col-md-9 col-xl-8">
                <!--Items de la 1-->
                <div>
                    <!--Nombre cabecera-->
                    <h3 id="Funciones_seleccionadas" class="cart-header px-4 py-3">
                        <span>Funciones Seleccionadas</span>
                    </h3>
                    <!--A??ADO ADVERTENCIAS-->
                    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                        </symbol>
                        <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                        </symbol>
                        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                        </symbol>
                    </svg>
                    <%boolean noHayVacantes=false;%>
                    <%if(carrito.size()!=0){%>
                    <%if(carrito.get(0).getbFuncion().getFecha()!=null){%>
                    <!---->
                    <%for(Bticket bticket: carrito){%>
                    <!--Producto-->
                    <div class="d-sm-flex justify-content-between my-4 px-lg-2 px-xl-5 pb-4 border-bottom">
                        <!--Bloque 1-->
                        <div class="d-sm-flex">
                            <!--Imagen del producto-->
                            <div class="cart-item-thumb mx-auto">
                                <img src="<%=bticket.getbFuncion().getbPelicula().getFoto()%>"
                                     class="img-carrito">
                            </div>
                            <!--Info del producto-->
                            <div class="pt-1 pt-md-3 ps-sm-3 ps-0 text-sm-start text-center">
                                <!--Nombre-->
                                <h5 class="mb-sm-3 mb-1"><%=bticket.getbFuncion().getbPelicula().getNombre()%></h5>
                                <!--Precios-->
                                <div>
                                    <span class="text-muted">Precio:</span>
                                    <span class="font-size-lgr ms-sm-2 ms-0 ">s/ <%=bticket.getbFuncion().getPrecio()%></span>
                                </div>
                                <div>
                                    <span class="text-muted">Hora:</span>
                                    <span class="font-size-lgr ms-sm-2 ms-0 "><%=bticket.getbFuncion().getHoraInicio()%></span>
                                </div>
                                <div>
                                    <span class="text-muted">Cupos disponibles:</span>
                                    <span class="font-size-lgr ms-sm-2 ms-0 "><%=bticket.getbFuncion().getStock()%></span>
                                </div>
                                <%if(bticket.getbFuncion().getStock()==0){noHayVacantes=true;}%>
                            </div>
                            <div class="pt-1 pt-md-3 ps-sm-3 ps-0 text-sm-start text-center">
                                <br>
                                <!--Fecha-->
                                <div>
                                    <span class="text-muted">Fecha:</span>
                                    <span class="ms-sm-2 ms-0 "><%=bticket.getbFuncion().getFecha()%></span>
                                </div>
                                <!--Sede-->
                                <div>
                                    <span class="text-muted">Sede:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <span class="font-size-lgr ms-sm-2 ms-0 "><%=bticket.getbFuncion().getbSede().getNombre()%></span>
                                </div>
                                <!--Sala-->
                                <div>
                                    <span class="text-muted">Sala:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <span class="font-size-lgr ms-sm-2 ms-0 "><%=bticket.getbFuncion().getbSala().getNumero()%></span>
                                </div>
                            </div>
                        </div>
                        <!--Bloque 2-->
                        <div class="pt-sm-0 pt-2 pe-md-3 pe-0 mx-sm-0 mx-auto text-sm-left text-center"
                             style="max-width: 10rem;">
                            <form method="POST" action="<%=request.getContextPath()%>/UsuarioCarritoIndex?action=listar">
                                <input type="hidden" name="idCompra" value="<%=bticket.getbCompra().getIdCompra()%>">
                                <input type="hidden" name="idFuncion" value="<%=bticket.getbFuncion().getIdFuncion()%>">
                            <!--Cantidad-->
                            <div class="form-group mt-sm-4 mt-0">
                                <!--Label-->
                                <span class="text-muted">Cantidad:</span>
                                <!--Botones-->
                                <div class="d-flex justify-content-center">
                                    <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                                            class="btn btn-tele" id="menos" type="button">
                                        <i class="fas fa-minus fa-xs"></i>
                                    </button>
                                    <input class="form-control border-start-0 border-end-0 text-center"
                                           type="number" style="width:46px;" id="contador"
                                           value="<%=bticket.getCantButaca()==0 ? "1": bticket.getCantButaca()%>" max="<%=bticket.getbFuncion().getStock()%>" name="butacas" min="1"/>
                                    <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                                            class="btn btn-tele" id="mas" type="button">
                                        <i class="fas fa-plus fa-xs"></i>
                                    </button>
                                </div>
                            </div>
                            <!--Bot??n agregar-->
                            <button class="btn btn-success btn-sm mt-sm-4 mt-2 w-100" type="submit">
                                Agregar
                            </button>
                            </form>
                            <form method="POST" action="<%=request.getContextPath()%>/UsuarioCarritoIndex?action=borrar">
                                <input type="hidden" name="idCompra" value="<%=bticket.getbCompra().getIdCompra()%>">
                                <input type="hidden" name="idFuncion" value="<%=bticket.getbFuncion().getIdFuncion()%>">
                            <!--Bot??n borrar-->
                            <button class="btn btn-danger btn-sm mt-sm-4 mt-2 w-100" type="submit">
                                <i class="far fa-trash-alt"></i>
                            </button>
                            </form>
                        </div>
                    </div>
                    <%}%>
                    <%if(noHayVacantes){%>
                    <div class="alert alert-danger" role="alert">
                        <h4 class="alert-heading"><svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Info:"><use xlink:href="#info-fill"/></svg>Lo sentimos!</h4>
                        <hr>
                        <p class="mb-0">Ya no hay cupos para una funci??n que hab??a escogido. Elimine el producto de su carrito para seguir la compra.</p>
                    </div>
                    <%}%>
                    <%}else{%>
                    <%if(session.getAttribute("exitosoMSG")!=null){%>
                    <div class="alert alert-success d-flex align-items-center alert-dismissible fade show" role="alert">
                        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                        <div>
                            Compra exitosa! Mensaje de confirmaci??n enviada a su correo, junto a sus c??digos qr.<a href="<%=request.getContextPath()%>/" class="alert-link"> Elegir una pel??cula!</a>.
                        </div>
                        <button type="button" data-bs-dismiss="alert" class="btn-close" aria-label="Close"></button>
                    </div>
                    <%session.removeAttribute("exitosoMSG");}else{%>
                    <div class="alert alert-secondary" role="alert">
                        <h4 class="alert-heading"><svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Info:"><use xlink:href="#info-fill"/></svg>El carrito de compras est?? vac??o!</h4>
                        <hr>
                        <p class="mb-0">Para a??adir una compra, debes elegir una funci??n de la pel??cula que deseas ver! <a href="<%=request.getContextPath()%>/" class="alert-link">Elegir una pel??cula!</a>.</p>
                    </div>
                    <%}}%>
                    <%}else{%>
                    <%if(session.getAttribute("exitosoMSG")!=null){%>
                    <div class="alert alert-success" role="alert">
                        <h4 class="alert-heading"><svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Info:"><use xlink:href="#info-fill"/></svg>Compra exitosa!</h4>
                        <hr>
                        <p class="mb-0">Mensaje de confirmaci??n enviada a su correo, junto a sus c??digos qr. Te esperamos! <a href="<%=request.getContextPath()%>/" class="alert-link"> Elegir una pel??cula!</a>.</p>
                    </div>
                    <%session.removeAttribute("exitosoMSG");}else{%>
                    <div class="alert alert-secondary" role="alert">
                        <h4 class="alert-heading"><svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Info:"><use xlink:href="#info-fill"/></svg>El carrito de compras est?? vac??o!</h4>
                        <hr>
                        <p class="mb-0">Para a??adir una compra, debes elegir una funci??n de la pel??cula que deseas ver! <a href="<%=request.getContextPath()%>/" class="alert-link">Elegir una pel??cula!</a>.</p>
                    </div>
                    <%}}%>
                </div>
            </div>

            <!--Costo total-->
            <div class="col-md-3 col-xl-4 pt-3 pt-md-0">
                <div class="row">
                    <!--Cabecera resumen-->
                    <h3 id="resumen" class="cart-header px-4 py-3 justify-content-center">Resumen</h3>
                    <!--Tabla resumen-->
                    <div class="table-responsive">
                        <table class="table table-striped text-center mb-0">
                            <thead>
                            <tr>
                                <th scope="col">Pelicula</th>
                                <th scope="col">Sede</th>
                                <th scope="col">Butacas</th>
                                <th scope="col">Subtotal</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%double costoTotal=0;%>
                            <%if(carrito.size()!=0){%>
                            <%if(carrito.get(0).getbFuncion().getFecha()!=null){%>
                            <%for(Bticket bticket: carrito){%>
                            <tr>
                                <td><%=bticket.getbFuncion().getbPelicula().getNombre()%></td>
                                <td><%=bticket.getbFuncion().getbSede().getNombre()%></td>
                                <td class="text-center"><%=bticket.getCantButaca()%></td>
                                <td>s/ <%=(Math.round(bticket.getCantButaca()*bticket.getbFuncion().getPrecio()*100.0)/100.0)%></td>
                                <%costoTotal+=(bticket.getCantButaca()*bticket.getbFuncion().getPrecio());%>
                            </tr>
                            <%}%>
                            <%}}%>
                            </tbody>
                        </table>
                    </div>
                    <!--Total-->
                    <div class="h4 text-center py-2">
                        <span class="font-size-lg">Total:</span>
                        <span>&nbsp;s/ <%=(Math.round(costoTotal*100.0)/100.0)%></span>
                    </div>
                    <%if(carrito.size()!=0){%>
                    <%if(carrito.get(0).getbFuncion().getFecha()!=null && !noHayVacantes){%>
                    <div class="d-flex justify-content-center">
                        <a href="<%=request.getContextPath()%>/UsuarioCarritoIndex?action=pagar" class="btn btn-danger">Pagar</a>
                    </div>
                    <%}%>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</main>

<!--JS-->
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<!--close-->
<script>
    $(document).ready(function (c) {
        $(".close1").on("click", function (c) {
            $(".rem1").fadeOut("slow", function (c) {
                $(".rem1").remove();
            });
        });
    });
</script>
<script>
    $(document).ready(function (c) {
        $(".close2").on("click", function (c) {
            $(".rem2").fadeOut("slow", function (c) {
                $(".rem2").remove();
            });
        });
    });
</script>
<script>
    $(document).ready(function (c) {
        $(".close3").on("click", function (c) {
            $(".rem3").fadeOut("slow", function (c) {
                $(".rem3").remove();
            });
        });
    });
</script>
<!--//close-->
</body>
</html>