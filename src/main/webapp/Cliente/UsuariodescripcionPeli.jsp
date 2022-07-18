<%@ page import="com.example.javasticketscentro.Beans.BCelebridad" %>
<%@ page import="com.example.javasticketscentro.Beans.BFuncion" %>
<%@ page import="com.example.javasticketscentro.Beans.Bticket" %><%--
  Created by IntelliJ IDEA.
  User: stefh
  Date: 6/06/2022
  Time: 00:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="pelicula" scope="request" type="com.example.javasticketscentro.Beans.BPelicula"/>
<jsp:useBean id="funciones" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="funcionesCliente" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.Bticket>"/>
<jsp:useBean id="clienteLog" scope="session" type="com.example.javasticketscentro.Beans.BPersona"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Centro Cultural PUCP  - Descripción de pelicula</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/estilos.css">
    <script src="https://kit.fontawesome.com/5733880de3.js" crossorigin="anonymous"></script>


    <STYLE TYPE="text/css">
        body{
            font-family: Arial;
        }
        #main-container{
            margin: 56px ;
            width: 1400px;
            padding-top: 80px;
        }
        #btncarrito{
            border-color: rgba(0, 0, 0, 0.87);
            background-color: rgba(0, 0, 0, 0.87);
        }

    </STYLE>


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
                <a href="<%=request.getContextPath()%>/"><img src="img/logo.png" with="188px" height="97px"/></a>
            </a>
        </div>
        <%session.removeAttribute("vieneDePeli");session.removeAttribute("idPeli");%>
        <!--Carrito-->
        <div
                class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex justify-content-end">
            <%session.setAttribute("vieneDePeli", true);session.setAttribute("idPeli", pelicula.getIdPelicula());%>

            <a class="btn btn-tele-inverso"
                    role="button"
                    href="<%=request.getContextPath()%>/UsuarioCarritoIndex">
            <div style="font-size: 0.6rem">
                    <!--para cambios más precisos del tamaño-->
                    <i class="fas fa-cart-plus fa-3x"></i></div></a>
        </div>

        <!--Menú usuario-->
        <div class="col-md-1 col-sm-2 col-2 d-flex justify-content-start ps-0">
            <%if(clienteLog.getIdPer()!=0 && clienteLog!=null){%>
            <button
                    class="btn btn-tele-inverso"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#menuDeUsuario"
                    aria-controls="menuDeUsuario">
                <div style="font-size: 0.62rem">
                    <i class="fas fa-user-circle fa-3x"></i>
                </div>
            </button>
            <%}else{%>
            <a
                    class="btn btn-tele-inverso"
                    role="button"
                    href="<%=request.getContextPath()%>/UsuariologinclientServlet">
                <div style="font-size: 0.6rem">
                    <!--para cambios más precisos del tamaño-->
                    <i class="fa fa-user-circle fa-3x"></i>
                </div>
            </a>
            <%}%>
        </div>
    </div>
    <!--Boton retornar-->
    <div
            class="col-md-1 col-sm-2 col-2 ms-sm-auto ms-auto d-flex">
        <a
                class="btn btn-tele-inverso"
                role="button"
                href="<%=request.getContextPath()%>/"
        >
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
                            <img src="<%=(clienteLog.getFoto()!=null? (clienteLog.getFoto().contains("http") ?clienteLog.getFoto() :request.getContextPath()+"/UsuarioEditaPerfilServlet?action=entregarImagen"): "")%>"
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
    <br><br>
    <div class="main-container">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12  col-12 col-lg-9 col-xl-7">
                <div class="card-header my-5"></div>
                <div class="container">
                    <table >
                        <thead>
                        <br>
                        <tr  >
                                <center>
                                <b><h1 face="Tahoma,sans-serif " size="10px" class="dist-name" style="color:#e72d4b" ><%=pelicula.getNombre()%></h1>
                                </b>
                            </center>
                        </tr>
                        </thead>
                        <br>
                        <br>

                        <tr>
                            <img src="<%=pelicula.getFoto()%>"
                                 style="float:left; padding-right: 50px;" width="420" height="580" >
                        </tr>
                        <br>
                        <tr>
                            <p class="text-dark"><b class="text-dark">Descripcion: </b><%=pelicula.getSinopsis()%></p>
                        </tr>
                        <tr>
                            <p class="text-dark"><b class="text-dark">Genero: </b><%=pelicula.getGenero()%></p>
                        </tr>
                        <tr>
                            <%String[] horario= pelicula.getDuracion().split(":");%>
                            <%String hora= horario[0], minuto=horario[1];%>
                            <h6 class="text-dark"><b class="text-dark">Duracion: </b><%=hora%> h<%=" "+minuto%> m</h6>
                        </tr>
                        <tr>
                            <h6 class="text-dark">
                                <b class="text-dark">Directores: </b>
                                <%int i=1;%>
                                <% for(BCelebridad bCelebridad: pelicula.getDirectores()){%>
                                    <%if(i<=3){%>
                                    <%if(i<pelicula.getDirectores().size()){%>
                                        <%=bCelebridad.getNombre()+" "+bCelebridad.getApellido()+", "%>
                                    <%}else{%>
                                        <%=bCelebridad.getNombre()+" "+bCelebridad.getApellido()%>
                                    <%}%>
                                    <%}%>
                                <% i++;}%>
                            </h6>
                        </tr>
                        <tr>
                            <ul>
                                <h6 class="text-dark">
                                    <b class="text-dark">Actores:</b>
                                    <%i=1;%>
                                    <%for(BCelebridad bCelebridad: pelicula.getActores()){%>
                                        <%if(i<=3){%>
                                        <%if(i<pelicula.getDirectores().size()){%>
                                            <%=bCelebridad.getNombre()+" "+bCelebridad.getApellido()+", "%>
                                        <%}else{%>
                                            <%=bCelebridad.getNombre()+" "+bCelebridad.getApellido()%>
                                        <%}%>
                                        <%}%>
                                    <%i++;}%>
                                </h6></li>
                            </ul>
                        </tr>
                    </table>
                    <br>
                </div>
                <br><br>
                <br><br><br><br>
                <div class="main-container">
                    <form method="POST" action="<%=request.getContextPath()%>/UsuariodescripcionServlet?action=anadirCarro">
                    <table class="table table-sm table-borderless">
                        <tbody>
                        <!--Label-->
                            <!--Señal de alerta-->
                            <%if(session.getAttribute("msg")!=null){%>
                            <br><br><br><br><br>
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

                            <div class="alert alert-success d-flex align-items-center alert-dismissible fade show" role="alert">
                                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                                <div>
                                    Función añadida al carrito de compras exitosamente!
                                </div>
                                <button type="button" data-bs-dismiss="alert" class="btn-close" aria-label="Close"></button>
                            </div>
                            <%session.removeAttribute("msg");%>
                            <%}%>

                        <%if(funciones.size()==0){%>
                        <%if(pelicula.getSinopsis().length()<250){%>
                            <br><br><br><br>
                        <%}%>
                        <select class="form-select" name="funcionEscogida">
                            <option>< No hay funciones disponibles ></option>
                        </select>
                        <%}else{%>
                            <%if(clienteLog.getIdPer()==0 || clienteLog==null){%>
                            <select class="form-select" name="funcionEscogida">
                                <option value="Funciones" selected disabled>Funciones</option>
                                <%for(BFuncion bFuncion: funciones){%>
                                <option <%=bFuncion.getStock()==0 ? "disabled" : ""%> value="<%=bFuncion.getIdFuncion()%>"><%="Sede: "+bFuncion.getbSala().getbSede().getNombre()+ " | Sala: "+bFuncion.getbSala().getNumero()+" | Fecha:"+bFuncion.getFecha()+" | Hora: "+bFuncion.getHoraInicio()+(bFuncion.getStock()==0 ? "      ----Sin Cupos Disponibles----" : " | Precio c/u: S/"+bFuncion.getPrecio())%></option>
                                <%}%>
                            </select>
                            <%}else{%>
                            <select class="form-select" name="funcionEscogida">
                                <option value="Funciones" selected disabled>Funciones</option>
                                <%for(BFuncion bFuncion: funciones){%>
                                    <%if(funcionesCliente.size()!=0){%>
                                        <%boolean existeLista= false,mismaFechaSede=false;Bticket ticketEncontrado=new Bticket();
                                        for(Bticket ticket: funcionesCliente){
                                            if(ticket.getbFuncion().getIdFuncion()==bFuncion.getIdFuncion() ){
                                                ticketEncontrado= ticket;
                                                existeLista=true;
                                                break;
                                            }else{
                                                //Si no es la función de esta película a analizar...buscamos si coincide con alguna otra función en hora, fecha y sede
                                                if(bFuncion.getFecha().equals(ticket.getbFuncion().getFecha())&&bFuncion.getHoraInicio().equals(ticket.getbFuncion().getHoraInicio())&&bFuncion.getbSala().getbSede().getNombre().equals(ticket.getbFuncion().getbSala().getbSede().getNombre())){
                                                    //Coincide la fecha, hora y sede
                                                    mismaFechaSede=true;
                                                }
                                            }
                                        }%>
                                        <%if(existeLista){%>
                                            <%if(ticketEncontrado.getbCompra().getCancelado()==0){%>
                                            <option value="<%=bFuncion.getIdFuncion()%>" <%=ticketEncontrado.getCarrito() || bFuncion.getStock()==0 ? "disabled" : ""%>><%="Sede: "+bFuncion.getbSala().getbSede().getNombre()+ " | Sala: "+bFuncion.getbSala().getNumero()+" | Fecha:"+bFuncion.getFecha()+" | Hora: "+bFuncion.getHoraInicio()%>
                                                <%if(ticketEncontrado.getCarrito()){%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                Añadido al carrito!<%}else{%>
                                                <%=(bFuncion.getStock()==0 ? "      ----Sin Cupos Disponibles----" : " | Precio c/u: S/"+bFuncion.getPrecio())%>
                                                <%}%>
                                                </option>
                                            <%}else{%>
                                                <option value="<%=bFuncion.getIdFuncion()%>" disabled><%="Sede: "+bFuncion.getbSala().getbSede().getNombre()+ " | Sala: "+bFuncion.getbSala().getNumero()+" | Fecha:"+bFuncion.getFecha()+" | Hora: "+bFuncion.getHoraInicio()%>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    Ticket comprado!</option>
                                            <%}%>
                                        <%}else{%>
                                            <%if(mismaFechaSede){%>
                                                <option disabled value="<%=bFuncion.getIdFuncion()%>"><%="Sede: "+bFuncion.getbSala().getbSede().getNombre()+ " | Sala: "+bFuncion.getbSala().getNumero()+" | Fecha:"+bFuncion.getFecha()+" | Hora: "+bFuncion.getHoraInicio()%>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;Horario incompatible!</option>
                                            <%}else{%>
                                               <option <%=bFuncion.getStock()==0 ? "disabled" : ""%> value="<%=bFuncion.getIdFuncion()%>"><%="Sede: "+bFuncion.getbSala().getbSede().getNombre()+ " | Sala: "+bFuncion.getbSala().getNumero()+" | Fecha:"+bFuncion.getFecha()+" | Hora: "+bFuncion.getHoraInicio() +(bFuncion.getStock()==0 ? "      ----Sin Cupos Disponibles----" : " | Precio c/u: S/"+bFuncion.getPrecio())%></option>
                                            <%}%>
                                        <%}%>
                                    <%}else{%>
                                        <option <%=bFuncion.getStock()==0 ? "disabled" : ""%> value="<%=bFuncion.getIdFuncion()%>"><%="Sede: "+bFuncion.getbSala().getbSede().getNombre()+ " | Sala: "+bFuncion.getbSala().getNumero()+" | Fecha:"+bFuncion.getFecha()+" | Hora: "+bFuncion.getHoraInicio()+ (bFuncion.getStock()==0 ? "      ----Sin Cupos Disponibles----" : " | Precio c/u: S/"+bFuncion.getPrecio())%></option>
                                    <%}%>
                                <%}%>
                            </select>
                            <%}%>
                        <%}%>
                        <br>
                                <%if(clienteLog.getIdPer()==0 || clienteLog==null){%>
                            <div class="alert alert-secondary" role="alert">
                                <h4 class="alert-heading"><svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Info:"><use xlink:href="#info-fill"/></svg>¿Te interesa comprar un ticket?</h4>
                                <hr>
                                <p class="mb-0">Para comprar, debes ingresar con tu cuenta. Si no tienes, puedes registrarte.<a href="<%=request.getContextPath()%>/UsuariologinclientServlet" class="alert-link">Ir al login</a>.</p>
                            </div>
                                <%}%>
                        <table ALIGN="right">
                            <tr>
                                <td class="text-end">
                                    <button id="btncarrito" type="<%=(funciones.size()==0) ? "button" : "submit"%>" class="btn btn-tele btn-md mr-1 mb-2">
                                        <i class="fas fa-shopping-cart"></i> Añadir al carrito
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </table>
                </form>
                </div>
            <h2 class="text-dark"> </h2>
        </div>
    </div>
    </div>
</main>







<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
