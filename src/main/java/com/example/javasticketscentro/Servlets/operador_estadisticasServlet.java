package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BFuncion;
import com.example.javasticketscentro.Beans.BPelicula;
import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.EstadisticasDaos;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Enumeration;


@WebServlet(name = "operador_estadisticasServlet", value = "/operador_estadisticasServlet")
public class operador_estadisticasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        EstadisticasDaos estadisticasDaos = new EstadisticasDaos();
        HttpSession session = request.getSession();

        switch (action) {
            case "listar":
                try {
                    ArrayList<BFuncion> generos = estadisticasDaos.listarGenero();
                    ArrayList<BFuncion> seleccionar = estadisticasDaos.listarGenero1();
                    ArrayList<BFuncion> asistencias = estadisticasDaos.listarAsistencia1();
                    ArrayList<BFuncion> masVistas = estadisticasDaos.listarMasVista1();
                    ArrayList<BFuncion> menosVistas = estadisticasDaos.listarMenosVista1();
                    ArrayList<BPelicula> pelicula =estadisticasDaos.peliculaMejorCalificada1();
                    ArrayList<BCelebridad> actor = estadisticasDaos.actorMejorCalificado1();
                    ArrayList<BCelebridad> director = estadisticasDaos.directorMejorCalificado1();
                    String fechaMin = estadisticasDaos.firstFecha();
                    String fechaMax = estadisticasDaos.lastFecha();
                    request.setAttribute("listaGenero", generos);
                    request.setAttribute("generos",seleccionar);
                    request.setAttribute("listaAsistencia", asistencias);
                    request.setAttribute("masVista",masVistas);
                    request.setAttribute("menosVista",menosVistas);
                    request.setAttribute("pelicula",pelicula);
                    request.setAttribute("actor", actor);
                    request.setAttribute("director", director);
                    request.setAttribute("fechaI",fechaMin);
                    request.setAttribute("fechaH",fechaMax);

                    RequestDispatcher listar = request.getRequestDispatcher("Operador/estadisticas.jsp");
                    listar.forward(request, response);
                }
                 catch(IndexOutOfBoundsException e){
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                }
                break;
            case "listar1":
                try{
                    ArrayList<BFuncion> asistencias = estadisticasDaos.listarAsistencia1();
                    String fechaMin = estadisticasDaos.firstFecha();
                    String fechaMax = estadisticasDaos.lastFecha();
                    request.setAttribute("listaAsistencia",asistencias);

                    request.getSession().setAttribute("fechaI",fechaMin);
                    request.getSession().setAttribute("fechaH", fechaMax);
                    RequestDispatcher listar = request.getRequestDispatcher("Operador/funciones_estadisticas.jsp");
                    listar.forward(request, response);
                }catch (IndexOutOfBoundsException e){
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                }
                break;
            case "listar2":
                try {
                    ArrayList<BFuncion> masVistas = estadisticasDaos.listarMasVista1();
                    ArrayList<BFuncion> menosVistas = estadisticasDaos.listarMenosVista1();
                    String fechaMin = estadisticasDaos.firstFecha();
                    String fechaMax = estadisticasDaos.lastFecha();
                    request.setAttribute("masVista",masVistas);
                    request.setAttribute("menosVista",menosVistas);
                    request.getSession().setAttribute("fechaI",fechaMin);
                    request.getSession().setAttribute("fechaH", fechaMax);
                    RequestDispatcher listar = request.getRequestDispatcher("Operador/vistas_estadisticas.jsp");
                    listar.forward(request, response);
                }catch (IndexOutOfBoundsException e){
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                }
                break;
            case "listar3":
                try {
                    ArrayList<BFuncion> generos = estadisticasDaos.listarGenero();
                    ArrayList<BFuncion> seleccionar = estadisticasDaos.listarGenero1();
                    ArrayList<BPelicula> pelicula =estadisticasDaos.peliculaMejorCalificada1();
                    request.setAttribute("listaGenero", generos);
                    request.setAttribute("generos",seleccionar);
                    request.setAttribute("pelicula",pelicula);
                    RequestDispatcher listar = request.getRequestDispatcher("Operador/peliculas_estadisticas.jsp");
                    listar.forward(request, response);
                }catch (IndexOutOfBoundsException e){
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                }
                break;
            case "listar4":

                ArrayList<BCelebridad> actor = estadisticasDaos.actorMejorCalificado1();
                ArrayList<BCelebridad> director = estadisticasDaos.directorMejorCalificado1();
                try{
                    request.setAttribute("actor", actor);
                    request.setAttribute("director", director);
                    RequestDispatcher listar = request.getRequestDispatcher("Operador/celebridades_estadisticas.jsp");
                    listar.forward(request, response);
                }catch (IndexOutOfBoundsException e){
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                }
                break;
    }
}



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        EstadisticasDaos estadisticasDaos = new EstadisticasDaos();
        String fecha1 = request.getParameter("date1")== null ? "2022-06-07" : request.getParameter("date1");
        String fecha2 = request.getParameter("date2")== null ? "2022-08-07" : request.getParameter("date2");
        String fecha3 = request.getParameter("date3")== null ? "2022-06-07" : request.getParameter("date3");
        String fecha4 = request.getParameter("date4")== null ? "2022-08-07" : request.getParameter("date4");
        HttpSession session = request.getSession();

        switch (action){
            case "filtrar1":
                try {
                    ArrayList<BFuncion> asistencia = estadisticasDaos.listarAsistencia(fecha1,fecha2);

                    if (asistencia.get(0)!=null){

                        request.setAttribute("listaAsistencia", asistencia);
                        request.setAttribute("fecha1",fecha1);
                        request.setAttribute("fecha2",fecha2);

                        RequestDispatcher filtrar = request.getRequestDispatcher("Operador/funciones_estadisticas.jsp");
                        filtrar.forward(request, response);
                    }
                }catch (IndexOutOfBoundsException e) {
                    System.out.println("Error al convertir tipo de dato");
                    request.getSession().setAttribute("msg1","No se ha encontrado la función más asistida");
                    request.setAttribute("fecha1",fecha1);
                    request.setAttribute("fecha2",fecha2);

                    RequestDispatcher filtrar = request.getRequestDispatcher("Operador/funciones_estadisticas.jsp");
                    filtrar.forward(request, response);
                }
                break;

            case "filtrar2":
                try {
                    ArrayList<BFuncion> masVista = estadisticasDaos.listarMasVista(fecha3,fecha4);
                    ArrayList<BFuncion> menosVista = estadisticasDaos.listarMenosVista(fecha3,fecha4);
                    if(masVista.get(0)!=null){
                        request.setAttribute("masVista", masVista);
                        request.setAttribute("menosVista",menosVista);
                        request.setAttribute("fecha3",fecha3);
                        request.setAttribute("fecha4",fecha4);
                        RequestDispatcher filtrar = request.getRequestDispatcher("Operador/vistas_estadisticas.jsp");
                        filtrar.forward(request, response);
                    }
                }catch (IndexOutOfBoundsException e){
                    session.setAttribute("msg2","No se ha encontrado la función más vista");
                    session.setAttribute("msg3","No se ha encontrado la función menos vista");
                    System.out.println("Error al convertir tipo de dato");
                    request.setAttribute("fecha3", fecha3);
                    request.setAttribute("fecha4", fecha4);
                    RequestDispatcher filtrar = request.getRequestDispatcher("Operador/vistas_estadisticas.jsp");
                    filtrar.forward(request, response);
                }
                break;

            case "filtrar7":
                String genero = request.getParameter("filtro");
                ArrayList<BFuncion> seleccionar = estadisticasDaos.listarGenero1();
                ArrayList<BFuncion> peliculas = estadisticasDaos.listarPorGenero(genero);
                ArrayList<BPelicula> pelicula =estadisticasDaos.peliculaMejorCalificada1();
                try {
                    if(peliculas.get(0)!=null){
                        request.setAttribute("listaGenero", peliculas);
                        request.setAttribute("filtro", genero);
                        request.setAttribute("generos",seleccionar);
                        request.setAttribute("pelicula", pelicula);
                        RequestDispatcher filtrar = request.getRequestDispatcher("Operador/peliculas_estadisticas.jsp");
                        filtrar.forward(request, response);
                    }
                }catch (IndexOutOfBoundsException e){
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet?action=listar3");
                }
                break;
            case "listar8":
                ArrayList<BPelicula> pelicula1 =estadisticasDaos.peliculaMejorCalificada1();
                ArrayList<BFuncion> seleccionar1 = estadisticasDaos.listarGenero1();
                ArrayList<BFuncion> generos = estadisticasDaos.listarGenero();
                try{
                    request.setAttribute("listaGenero", generos);
                    request.setAttribute("generos",seleccionar1);
                    request.setAttribute("pelicula",pelicula1);
                    RequestDispatcher listar = request.getRequestDispatcher("Operador/peliculas_estadisticas.jsp");
                    listar.forward(request, response);
                }catch (IndexOutOfBoundsException e){
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                 }
                break;
        }
    }
}