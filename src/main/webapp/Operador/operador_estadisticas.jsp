<%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 05/06/2022
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="asistencia" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="busqueda" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="genero" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="vista1" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="vista2" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="calificada" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="busqueda" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="actor" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>
<jsp:useBean id="director" scope="request" type="java.util.ArrayList<com.example.javasticketscentro.Beans.BFuncion>"/>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PUCP - Estadisticas</title>
    <meta charset="utf-8">
    <link href="assets/css_2/easy-responsive-tabs.css" rel='stylesheet' type='text/css' />
    <link href="assets/css_2/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="assets/css_2/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="assets/css_2/grafico_style.css">
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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .checked {
            color: orange;
        }


        #main-container{
            margin: 150px auto;
            width: 600px;
        }


        th, td{
            padding: 20px;
        }


        tr:nth-child(even){
            background-color: #ddd;
        }

        tr:hover td{
            background-color: #369681;
            color: white;
        }
    </style>

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
                <a href="indexOperador.html"><img src="assets/img/logo.png" /></a>
            </a>
        </div>

        <!--<div class="col-xl-7 col-lg-7 col-md-7 d-none d-md-block ps-0">
            <div class="input-group">
                <div class="form-outline" style="width: 50%">
                    <input
                            type="search"
                            id="form1"
                            class="form-control"
                            placeholder="Buscar película"
                    />
                </div>
                <button type="button" class="btn btn-tele border-start-1">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>-->
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
                                src="assets/img/images.png"
                                class="rounded-circle mx-auto d-block mb-3 h-25 w-50"
                                alt="profile image"
                        />
                    </div>
                    <div class="mb-3">
                        <div class="p-2">
                            <a
                                    href="personal.html"
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
<section class="banner-bottom-wthreelayouts py-lg-5 py-3">
    <div class="container">
        <div class="inner-sec-shop px-lg-4 px-3">
            <h3 class="tittle-w3layouts my-lg-4 mt-3"> Resumen de Estadísticas</h3>
            <!--/tabs-->
            <div class="responsive_tabs">
                <div id="horizontalTab">
                    <ul class="resp-tabs-list">
                        <li>Pelicula </li>
                        <li>Vistas</li>
                        <li>Calificaciones</li>
                        <li>Actores y Directores</li>
                    </ul>
                    <div class="resp-tabs-container">
                        <!--/tab_one-->
                        <div class="tab1">
                            <div class="pay_info">
                                <div class="vertical_post check_box_agile">
                                    <div class="container-fluid" >

                                        <FONT FACE="impact" SIZE=6 COLOR="red">
                                            Porcentaje de pelicula más asistida
                                        </FONT></br>

                                        <div class="row justify-content-start">
                                            <div class="col-2">
                                                <br>
                                                <form >
                                                    <label> Fecha de inicio </label>
                                                    <input type="date">
                                                </form><br>
                                                <form>
                                                    <label> Fecha de fin </label>
                                                    <input type="date">
                                                </form><br>
                                                <button type="button" class="btn btn-danger">Inspeccionar</button>

                                            </div>
                                            <div class="col-5">
                                                <section class="container_grafico">
                                                    <div class= "grafico"></div>
                                                    <div class= "container_leyenda">
                                                      <span class = "leyenda_all">
                                                        <span class="color_facebook"></span>
                                                        <p class = "social">40% Lina de Lima</p>
                                                      </span>
                                                        <span class="leyenda_all">
                                                        <span class="color_twitter"></span>
                                                        <p class = "social"> 30% Benedetta </p>
                                                      </span>
                                                        <span class="leyenda_all">
                                                        <span class="color_instagram"></span>
                                                        <p class = "social"> 18% Largas distancias </p>
                                                      </span>
                                                        <span class="leyenda_all">
                                                        <span class="color_pinterest"></span>
                                                        <p class = "social"> 12% Matrix 4</p>
                                                      </span>


                                                    </div>
                                                </section>
                                            </div>
                                        </div><br>
                                        <FONT FACE="impact" SIZE=6 COLOR="red">
                                            Películas más buscadas
                                        </FONT></br>
                                        <div class="row justify-content-start">
                                            <div class="col-2">
                                                <br>
                                                <form >
                                                    <label> Fecha de inicio </label>
                                                    <input type="date">
                                                </form><br>
                                                <form>
                                                    <label> Fecha de fin </label>
                                                    <input type="date">
                                                </form><br>
                                                <button type="button" class="btn btn-danger">Inspeccionar</button>

                                            </div>
                                            <div class="col-5">
                                                <section class="container_grafico">
                                                    <div class= "grafico" style="background-image: conic-gradient(var(--color_twitter) 30%,
									var(--color_facebook) 30% 40%,
									var(--color_pinterest) 40% 68%,
									var(--color_instagram) 68%);"></div>
                                                    <div class= "container_leyenda">
															<span class="leyenda_all">
																<span class="color_instagram"></span>
																<p class = "social"> 32% Matrix 4</p>
															</span>
                                                        <span class = "leyenda_all">
																<span class="color_twitter"></span>
																<p class = "social">30% Lina de Lima</p>
															</span>

                                                        <span class="leyenda_all">
																<span class="color_pinterest"></span>
																<p class = "social"> 28% Largas distancias </p>
															</span>

                                                        <span class="leyenda_all">
																<span class="color_facebook"></span>
																<p class = "social"> 10% Benedetta </p>
															</span>



                                                    </div>
                                                </section>
                                            </div>
                                        </div><br>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <!--//tab_one-->
                        <div class="tab2">
                            <div class="pay_info">
                                <FONT FACE="impact" SIZE=6 COLOR="red">
                                    Función más vista
                                </FONT></br>
                                <div class="row justify-content-start">
                                    <div class="col-3">
                                        <br>
                                        <form >
                                            <label> Fecha de inicio </label>
                                            <input type="date">
                                        </form><br>
                                        <form>
                                            <label> Fecha de fin </label>
                                            <input type="date">
                                        </form><br>
                                        <form >
                                            <label> Sede</label>
                                            <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                                <option selected>Seleccione la sede</option>
                                                <option value="1">Lima</option>
                                                <option value="2">Comas</option>
                                                <option value="3">San Juan de Lurigancho</option>
                                            </select>
                                        </form><br>
                                        <form>
                                            <label> Sala </label>
                                            <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                                <option selected>Seleccione la sala</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                            </select>
                                        </form><br>


                                        <button type="button" class="btn btn-danger">Inspeccionar</button>

                                    </div>
                                    <div class="col-3">
                                        <table >

                                            <tr>
                                                <td><h2>Cannes</h2></td><td><h2>2</h2></td>
                                            </tr>

                                        </table>
                                    </div>
                                </div>

                                <FONT FACE="impact" SIZE=6 COLOR="red">
                                    Función menos vista
                                </FONT></br>
                                <div class="row justify-content-start">
                                    <div class="col-3">
                                        <br>
                                        <form >
                                            <label> Fecha de inicio </label>
                                            <input type="date">
                                        </form><br>
                                        <form>
                                            <label> Fecha de fin </label>
                                            <input type="date">
                                        </form><br>
                                        <form >
                                            <label> Sede</label>
                                            <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                                <option selected>Seleccione la sede</option>
                                                <option value="1">Lima</option>
                                                <option value="2">Comas</option>
                                                <option value="3">San Juan de Lurigancho</option>
                                            </select>
                                        </form><br>
                                        <form>
                                            <label> Sala </label>
                                            <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                                <option selected>Seleccione la sala</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                            </select>
                                        </form><br>


                                        <button type="button" class="btn btn-danger">Inspeccionar</button>

                                    </div>
                                    <div class="col-5">
                                        <table >

                                            <tr>
                                                <td><h2>Cannes</h2></td><td><h2>2</h2></td>
                                            </tr>

                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="tab3">

                            <div class="pay_info">
                                <div class="row justify-content-around">
                                    <div class="col-sm-5">
                                        <FONT FACE="impact" SIZE=6 COLOR="red">
                                            Pelicula mejor calificada
                                        </FONT></br>

                                        <div class="row justify-content-start">
                                            <div class="col-4">
                                                <form >
                                                    <label> Fecha de inicio </label>
                                                    <input type="date">
                                                </form>
                                            </div>
                                            <div class="col-3">
                                                <form>
                                                    <label> Fecha de fin </label>
                                                    <input type="date">
                                                </form>

                                            </div>
                                        </div><br><br>
                                        <table >

                                            <tr>
                                                <td><h2>Lina de Lima</h2></td><td>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                            </td>
                                            </tr>

                                        </table>

                                    </div>
                                    <div class ="col-4">
                                        <img src="img/s1.jpg" style="height: 400px; width: 250px">
                                    </div>
                                    <div class="col-2">
                                        <FONT FACE="impact" SIZE=6 COLOR="red">
                                            Premiaciones
                                        </FONT><br>


                                        <table >

                                            <tr>
                                                <td>Cannes</td><td>2</td>
                                            </tr>
                                            <tr>
                                                <td>Oscar</td><td>3</td>
                                            </tr>
                                            <tr>
                                                <td>Malaga</td><td>1</td>
                                            </tr>
                                            <tr>
                                                <td>Annie</td><td>2</td>
                                            </tr>

                                        </table>
                                    </div>
                                </div>


                            </div>


                        </div>






                        <div class="tab4">
                            <div class="pay_info">
                                <FONT FACE="impact" SIZE=6 COLOR="red">
                                    Actor/Actriz mejor calificado
                                </FONT><br> <br>

                                <label>Película</label>
                                <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                    <option selected>Selecciona la pelicula</option>
                                    <option value="1">Doctor Strange</option>
                                    <option value="2">Larga distancia</option>
                                    <option value="3">Lina de Lima</option>
                                </select>



                                <br> <br>
                                <table >

                                    <tr>
                                        <td><h4>Benedict Cumberbatch</h4></td>
                                        <td>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star "></span>
                                            <span class="fa fa-star "></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><h4>Patrick Stewart</h4></td>
                                        <td>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star "></span>
                                            <span class="fa fa-star "></span>
                                            <span class="fa fa-star"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><h4>Tobey Maguire</h4></td>
                                        <td>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star "></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><h4>Elizabeth Olsen</h4></td>
                                        <td>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                        </td>
                                    </tr>

                                </table>


                                <br><br>

                                <FONT FACE="impact" SIZE=6 COLOR="red">
                                    Director(a) mejor calificado
                                </FONT><br><br>

                                <div class="row align-items-start">
                                    <div class="col-2">
                                        <form >
                                            <label> Fecha de inicio </label>
                                            <input type="date">
                                        </form><br>

                                    </div>
                                    <div class="col-2">
                                        <form>
                                            <label> Fecha de fin </label>
                                            <input type="date">
                                        </form><br>

                                    </div>
                                    <div class="col-3">
                                        <label>Película</label>
                                        <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                            <option selected>Selecciona la pelicula</option>
                                            <option value="1">Doctor Strange</option>
                                            <option value="2">Larga distancia</option>
                                            <option value="3">Lina de Lima</option>
                                        </select>
                                    </div>
                                    <br>
                                </div>

                                <div class="row justify-content-start">
                                    <div class="col-6">
                                        <table >

                                            <tr>
                                                <td><h2>Lina de Lima</h2></td><td>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                            </td>
                                            </tr>

                                        </table>
                                    </div>
                                </div>
                                <br><br>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--//tabs-->
    </div>

    </div>

</section>
<!-- easy-responsive-tabs -->
<script src="assets/jquery-2.2.3.min.js"></script>
<script src="assets/easy-responsive-tabs.js"></script>
<script>
    $(document).ready(function () {
        $('#horizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
        $('#verticalTab').easyResponsiveTabs({
            type: 'vertical',
            width: 'auto',
            fit: true
        });
    });
</script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>