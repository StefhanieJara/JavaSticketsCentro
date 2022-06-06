<%--
  Created by IntelliJ IDEA.
  User: CARLOS
  Date: 5/06/2022
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="Cine, Películas, Centro Cultural PUCP" />
    <title>Inicio</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- CSS Personales-->
    <link rel="stylesheet" href="../assets/css/estilosindex.css">

</head>
<body>
<header>
    <div class="contenedor-header">
        <div class="logo">
            <a href="index.html"><img src="../img/logo.png"></a>
        </div>
        <div class="menu">
            <a class="reserva" href="checkout.html">RESERVA DE TICKETS</a>
            <a class="carrito" href="payment.html">CARRITO DE COMPRAS</a>
            <a class="perfil" href="EditorPerfil.html">EDITOR DE PERFIL</a>
            <a class="contacto" href="contact.html">CONTACTO</a>
            <a class="tickets" href="etikets.html">MIS TICKETS</a>
        </div>
        <div class="search">

        </div>
        <div class="login">

        </div>
    </div>
</header>
<main>
    <!-- Banner presentación -->
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" role="listbox">
            <div class="carousel-caption text-center">
                <h1 style="margin-bottom: 20px"><mark><b>BIENVENIDOS AL</b></mark></h1>
                <h2 style="margin-bottom: 30px"><b>CENTRO CULTURAL PUCP</b></h2>
                <span>¡Disfruta de nuestra amplia cartelera de cine!</span>
            </div>
            <div class="carousel-item active">
                <img class="d-block w-100" src="img/banner1.jpg" alt="Escenario">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="img/banner2.jpg" alt="Principal">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Anterior</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Siguiente</span>
        </a>
    </div>
    <!-- Peliculas mostradas -->
    <div class="contenedor-peliculas">
        <table>
            <tr>
                <td>Pelicula 1</td>
                <td>Pelicula 2</td>
                <td>Pelicula 3</td>
                <td>Pelicula 4</td>
            </tr>
            <tr>
                <td>Pelicula 5</td>
                <td>Pelicula 6</td>
                <td>Pelicula 7</td>
                <td>Pelicula 8</td>
            </tr>
        </table>
    </div>
    <!-- Sedes -->
    <div class="contenedor-sedes">
        <table>
            <tr>
                <td> Sede 1 </td>
                <td> Sede 2 </td>
                <td> Sede 3 </td>
            </tr>
        </table>
    </div>


</main>

<footer class="py-lg-5 py-3">
    <p class="copy-right text-center ">&copy; 2022 JavaSticket. All Rights Reserved</p>
</footer>

<!-- JavaScript Bootstrap -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
