<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 05/06/2022
  Time: 09:12 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/207/207052.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Centro Cultural PUCP - Registro</title>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Andika&amp;display=swap">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>
        <section
                class="d-flex flex-grow-1 flex-shrink-1 p-4 justify-content-md-center align-items-md-center justify-content-lg-center align-items-lg-center justify-content-xl-center align-items-xl-center vh-100"
                style="min-height: 700px;">
            <div class="container d-flex justify-content-center">
                <div class="card border-0 responsive-form">
                    <div class="card-header" style="background-color: white;">
                        <h4 class="my-2" style="color: var(--bs-orange)">Registro</h4>
                    </div>
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
                                        <button class="btn btn-primary d-block w-100" type="submit" style="background: var(--bs-orange); border-color: var(--bs-orange)">
                                            <strong>Registrarse</strong>
                                        </button>
                                    </div>
                                    <div class="alert alert-danger alert-dismissible" role="alert">
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        <span><strong>Todos los campos son obligatorios.</strong></span>
                                    </div>
                                </form>
                                <a class="text-center" href="index.html">¿Ya tiene una cuenta? Ingrese</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </body>

</html>

