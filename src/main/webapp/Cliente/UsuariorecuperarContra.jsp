<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 05/06/2022
  Time: 09:10 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="conf" scope="session" type="java.lang.String" class="java.lang.String"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Centro Cultural PUCP - Inicio sesión</title>
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
        <style>
            video{
                position: fixed;
                min-width: 100%;
                min-height: 100%;
                top: 50%;
                left: 50%;
                transform: translateX(-50%) translateY(-50%);
                z-index: -1;
            }
        </style>
    </head>
    <body>
        <video src="https://rr5---sn-uqx2-aphd.googlevideo.com/videoplayback?expire=1657406360&ei=OK_JYuDNDZeSobIP0r6a4AY&ip=181.66.151.11&id=o-AMOahIvhwqF1OEMcZ3Fy6kZiRDDbWBil5DF_WbjQ_u7O&itag=22&source=youtube&requiressl=yes&mh=_l&mm=31%2C29&mn=sn-uqx2-aphd%2Csn-nja7sner&ms=au%2Crdu&mv=m&mvi=5&pl=24&initcwndbps=606250&spc=lT-KhipPzgyE6ZsvLoeRGOeXB1KmWr0&vprv=1&mime=video%2Fmp4&ns=8gokDm6h1rwpQmLxJFvq_iAH&cnr=14&ratebypass=yes&dur=5.061&lmt=1657384701257272&mt=1657384398&fvip=2&fexp=24001373%2C24007246&c=WEB&txp=6211224&n=j74DMs-PEVyatg&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Cmime%2Cns%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIhANJVOeEBNMrTgNZqAgd5obFZC49nwigxhHRg1Fq-5QbKAiA-ogWFQKfzVO65HmXa_ie1rcAuHnvBvRUDFc4S22qDtg%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRgIhAOgs1unkog4ZInY3L1eM0mjeSC9eBp-3Bowsbo-4C2p-AiEAwJ554TcSwIz5B4AKgJGi88BYI5FXWxAfbSaGoZH_NVI%3D" autoplay="true" muted="true" loop="true" poster="img/banner3.jpg"></video>
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
                        <div class="col-md-6 d-flex flex-column justify-content-center align-content-center">
                            <div class="card-body">
                                <div class="container w-75">
                                    <div class="row my-4">
                                        <div class="form-group" style="color:white">
                                            <form class="form-signin" method="post" action="<%=request.getContextPath()%>/UsuariologinclientServlet?action=validarEmail" >
                                            <div class="titles text-center">
                                                <h5>Recuperar Contraseña</h5>
                                            </div>
                                            <br>
                                            <label class="mb-2">Ingresa tu correo:</label>

                                            <input type="email" name="email" class="form-control" value="<%=session.getAttribute("email")==null ? "" : session.getAttribute("email")%>"
                                                   id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese Email"
                                                   required="required">
                                            <%if(conf.equals("no") || conf.equals("antiVirusError")){ session.removeAttribute("email"); session.removeAttribute("conf");}%>
                                            <br>
                                            <div class="text-center"><button type="submit" class="btn mb-4 botones"
                                                 style="color: white; background:#E72D4B; border-color:#E72D4B">
                                                Enviar clave al correo
                                            </button></div>

                                            </form>
                                            <%if(conf.equals("no")){%>
                                            <div class="text-danger mb-2">No existe una cuenta con este correo</div>
                                            <%}%>
                                            <%if(conf.equals("antiVirusError")){%>
                                                <div class="text-warning mb-2">Porfavor, desactive su antivirus para enviar el código
                                                    a su correo.</div>
                                            <%}%>
                                            <%if(conf.equals("yes")){%>
                                            <div style="color: limegreen" class="mb-2">La clave de recuperación se envió exitosamente!</div>
                                            <%}%>

                                            <br><br><br>
                                            <form class="form-signin" method="post" action="<%=request.getContextPath()%>/UsuariologinclientServlet?action=cambiarContra0" >
                                            <label class="mb-2">Ingrese su clave de recuperacion:</label>

                                                <input name="codigo" <%=conf.equals("yes") ? "" : "disabled"%> type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese Clave" required="required">
                                                <%if(session.getAttribute("msg")!=null){%>
                                                <div class="text-danger mb-2"><%=session.getAttribute("msg")%></div>
                                                <%session.removeAttribute("msg");%>
                                                <%}%>
                                            <br>
                                            <div class="text-center">
                                                <button type="submit" class="btn mb-4 botones" <%=(conf.equals("no") || conf.equals("")) ? "disabled" : ""%>  style="color: white; background:#E72D4B; border-color:#E72D4B" >
                                                Cambiar contraseña
                                                </button>
                                            </div>
                                            </form>
                                            <p style="text-align: center"><a href="<%=request.getContextPath()%>/UsuariologinclientServlet">Ir al Login</a></p>
                                        </div>
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