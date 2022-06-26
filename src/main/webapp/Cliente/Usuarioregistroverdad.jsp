<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: stefh
  Date: 6/06/2022
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Telefarma - Inicio sesión</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css"
            rel="stylesheet"
    />
    <link
            href="https://fonts.googleapis.com/css?family=Roboto&display=swap"
            rel="stylesheet"
    />
</head>
<body background="img/banner3.jpg">
<section
        class="d-flex flex-grow-1 flex-shrink-1 p-4 justify-content-md-center align-items-md-center justify-content-lg-center align-items-lg-center justify-content-xl-center align-items-xl-center vh-100"
        style="min-height: 700px;">
    <div class="container d-flex justify-content-center my-2">
        <div class="card responsive-login login-color">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6 d-flex flex-column justify-content-center align-content-center align-middle">
                        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="img/s1.jpg" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="img/s2.jpg" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="img/s8.jpg" class="d-block w-100" alt="...">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                    <div class=" col-md-6 d-flex flex-column justify-content-center align-content-center">
                        <div class="card-body">
                            <div class="container w-75" style="color: white">
                                <div class="row my-4" >
                                    <form  method="post" action="<%=request.getContextPath()%>/UsuarioregistrorealServlet?action=registrar">
                                        <%if(request.getParameter("error")!=null && request.getParameter("error").equals("errorSQL")){%>
                                        <div class="text-danger mb-2">Ups! Hubo un error en su registro, vuelva a intentar.</div>
                                        <%}%>
                                        <div class="row">
                                            <div class="col-md-6" >
                                                <input class="form-control mb-3" type="text"  name="nombre" placeholder="Nombre" required="required">
                                            </div>
                                            <div class="col-md-6">
                                                <input class="form-control mb-3" type="text" name="apellido" placeholder="Apellido" required="required">
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <div class="input-group has-validation">
                                                <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                <input type="email" name="email" placeholder="Correo" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required="required">
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <input class="form-control" type="password" name="pass0" placeholder="Contraseña" required="required">
                                        </div>
                                        <div class="mb-3">
                                            <input class="form-control" type="password" name="pass" placeholder="Confirmar contraseña" required="required">
                                        </div>
                                        <%if(request.getParameter("error")!=null && request.getParameter("error").equals("passNoCoinciden")){%>
                                        <div class="text-danger mb-2">Las contraseñas no coinciden!</div>
                                        <%}%>
                                        <div class="row">
                                            <div class="col-md-6" >
                                                <input class="form-control" type="number" name="dni" placeholder="DNI" required="required">
                                            </div>
                                            <div class="col-md-6">
                                                <input class="form-control" type="number" name="numeroTelefono" required="required" placeholder="Teléfono">
                                            </div>
                                        </div>
                                        <%if(request.getParameter("error")!=null && request.getParameter("error").equals("dniIncorrecto")){%>
                                        <div class="text-danger mb-2">Dni debe tener 8 dígitos!</div>
                                        <%}%>
                                        <%if(request.getParameter("error")!=null && request.getParameter("error").equals("telefoIncorrecto")){%>
                                        <div class="text-danger mb-2">Teléfono debe tener 9 dígitos!</div>
                                        <%}%>
                                        <br>
                                        <label class="mb-2">Fecha de Nacimiento:</label>
                                        <%//OBTENEMOS FECHA
                                            int dia= Calendar.getInstance().get(Calendar.DATE);
                                        int mes= Calendar.getInstance().get(Calendar.MONTH)+1;
                                        int year= Calendar.getInstance().get(Calendar.YEAR);
                                        String mes1,dia1;
                                        if(((int)Math.log10(mes)+1)!=2){
                                            mes1= "0"+mes;
                                        }else{
                                            mes1= ""+mes;
                                        }
                                        if(((int)Math.log10(dia)+1)!=2){
                                            dia1= "0"+dia;
                                        }else{
                                            dia1= ""+dia;
                                        }%>
                                        <div class="mb-3" >
                                            <input class="form-control" type="date" min="<%=(year-100)+"-"+mes1+"-"+dia1%>" max="<%=(year-18)+"-"+mes1+"-"+dia1%>" name="fechaNacimiento" required="required">
                                        </div>
                                        <label> ¿Es alumno? (opcional):</label>
                                        <div class="mb-3">
                                            <input class="form-control" type="number" name="codigo_PUCP" placeholder="Código PUCP">
                                        </div>
                                        <%if(request.getParameter("error")!=null && request.getParameter("error").equals("codigoIncorrecto")){%>
                                        <div class="text-danger mb-2">El código debe tener 8 dígitos!</div>
                                        <%}%>
                                        <div class="mb-3">
                                            <button class="btn btn-primary d-block w-100" type="submit" style="color: white; background:#E72D4B; border-color:#E72D4B">
                                                <strong>Registrarse</strong>
                                            </button>
                                        </div>
                                    </form>
                                    <%if(request.getParameter("error")!=null && request.getParameter("error").equals("emailExiste")){%>
                                    <div class="text-danger mb-2">Ya existe una cuenta con este correo!</div>
                                    <%}%>
                                    <a class="text-center" href="<%=request.getContextPath()%>/UsuariologinclientServlet?action=olvidoContra">Recuperar Contraseña</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>