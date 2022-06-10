<%--
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
<body">
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
                                    <form>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input class="form-control mb-3" type="text" name="nombre" placeholder="Nombre">
                                            </div>
                                            <div class="col-md-6">
                                                <input class="form-control mb-3" type="text" name="apellido" placeholder="Apellido">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5 mb-3">
                                                <input class="form-control" type="text" name="dni" placeholder="DNI">
                                            </div>
                                            <div class="col-md-7 mb-3">
                                                <select class="form-select" name="Distrito">
                                                    <option value="" selected disabled>Distrito</option>
                                                    <option value="Ancon">Ancón</option>
                                                    <option value="AteVitarte">Ate</option>
                                                    <option value="Barranco">Barranco</option>
                                                    <option value="Brena">Breña</option>
                                                    <option value="Carabayllo">Carabayllo</option>
                                                    <option value="Chaclacayo">Chaclacayo</option>
                                                    <option value="Chorrillos">Chorrillos</option>
                                                    <option value="Cieneguilla">Cieneguilla</option>
                                                    <option value="Comas">Comas</option>
                                                    <option value="ElAgustino">El Agustino</option>
                                                    <option value="Independencia">Independencia</option>
                                                    <option value="JesusMaria">Jesús María</option>
                                                    <option value="LaMolina">La Molina</option>
                                                    <option value="LaVictoria">La Victoria</option>
                                                    <option value="CercadoLima">Cercado de Lima</option>
                                                    <option value="Lince">Lince</option>
                                                    <option value="LosOlivos">Los Olivos</option>
                                                    <option value="Chosica">Chosica</option>
                                                    <option value="Lurin">Lurín</option>
                                                    <option value="Magdalena">Magdalena del Mar</option>
                                                    <option value="Miraflores">Miraflores</option>
                                                    <option value="Pachacamac">Pachacamac</option>
                                                    <option value="Pucusana">Pucusana</option>
                                                    <option value="PuebloLibre">Pueblo Libre</option>
                                                    <option value="PuentePiedra">Puente Piedra</option>
                                                    <option value="PuntaHermosa">Punta Hermosa</option>
                                                    <option value="PuntaNegra">Punta Negra</option>
                                                    <option value="Rimac">Rímac</option>
                                                    <option value="SanBartolo">San Bartolo</option>
                                                    <option value="SanBorja">San Borja</option>
                                                    <option value="SanIsidro">San Isidro</option>
                                                    <option value="SanJuanLurigancho">San Juan de Lurigancho</option>
                                                    <option value="SanJuanMiraflores">San Juan de Miraflores</option>
                                                    <option value="SanLuis">San Luis</option>
                                                    <option value="SanMartinPorres">San Martín de Porres</option>
                                                    <option value="SanMiguel">San Miguel</option>
                                                    <option value="SantaAnita">Santa Anita</option>
                                                    <option value="SantaMaria">Santa María del Mar</option>
                                                    <option value="SantaRosa">Santa Rosa</option>
                                                    <option value="SantiagoSurco">Santiago de Surco</option>
                                                    <option value="Surquillo">Surquillo</option>
                                                    <option value="VillaSalvador">Villa el Salvador</option>
                                                    <option value="VillaMariaTriunfo">Villa María del Triunfo</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <input class="form-control" type="email" name="email" placeholder="Correo">
                                        </div>
                                        <div class="mb-3">
                                            <input class="form-control" type="password" name="password" placeholder="Contraseña">
                                        </div>
                                        <div class="mb-3">
                                            <input class="form-control" type="password" name="password" placeholder="Confirmar contraseña">
                                        </div>
                                        <div class="mb-3">
                                            <input class="form-control" type="text" name="codigo_PUCP" placeholder="Ingrese su codigo PUCP">
                                        </div>
                                        <div class="mb-3">
                                            <input class="form-control" type="text" name="numeroTelefono" placeholder="Numero de contacto">
                                        </div>

                                        <label class="mb-2" style="color: white">Fecha de Nacimiento:</label>
                                        <div class="mb-3" style="color:">
                                            <input class="form-control" type="date" name="fechaNacimiento">
                                        </div>
                                        <div class="mb-3">
                                            <a href="confirmarRegistro.html" class="btn btn-primary d-block w-100" type="submit" style="color: white; background:#E72D4B; border-color:#E72D4B">
                                                <strong>Registrarse</strong>
                                            </a>
                                        </div>
                                    </form>
                                    <a class="text-center" href="index.html">¿Ya tiene una cuenta? Ingrese</a>
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