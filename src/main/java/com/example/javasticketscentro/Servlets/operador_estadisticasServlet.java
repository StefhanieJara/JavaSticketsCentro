package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BFuncion;
import com.example.javasticketscentro.Beans.BPelicula;
import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.EstadisticasDaos;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "operador_estadisticasServlet", value = "/operador_estadisticasServlet")
public class operador_estadisticasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        EstadisticasDaos estadisticasDaos = new EstadisticasDaos();

        switch (action) {
            case "listar":
                try {
                    BPelicula pelicula = estadisticasDaos.peliculaMejorCalificada1();
                    BCelebridad actor = estadisticasDaos.actorMejorCalificado1();
                    BCelebridad director = estadisticasDaos.directorMejorCalificado1();
                    ArrayList<BFuncion> menosVista = estadisticasDaos.listarMenosVista1();
                    ArrayList<BFuncion> masVista = estadisticasDaos.listarMasVista1();
                    ArrayList<BFuncion> generos = estadisticasDaos.listarGenero();
                    ArrayList<BFuncion> asistencia = estadisticasDaos.listarAsistencia1();
                    if (pelicula != null) {
                        request.setAttribute("listaAsistencia", asistencia);
                        request.setAttribute("listaGenero", generos);
                        request.setAttribute("masVista", masVista);
                        request.setAttribute("menosVista", menosVista);
                        request.setAttribute("peliculaMejorCalificada", pelicula);
                        request.setAttribute("actorMejorCalificado", actor);
                        request.setAttribute("directorMejorCalificado", director);
                        RequestDispatcher listar = request.getRequestDispatcher("Operador/operador_estadisticas.jsp");
                        listar.forward(request, response);
                    }else{
                        response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                }
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        EstadisticasDaos estadisticasDaos = new EstadisticasDaos();
        String fecha1 = request.getParameter("date1")== null ? "2022-06-07" : request.getParameter("date1");
        String fecha2 = request.getParameter("date2")== null ? "2022-08-07" : request.getParameter("date2");
        String fecha3 = request.getParameter("date3")== null ? "2022-06-07" : request.getParameter("date3");
        String fecha4 = request.getParameter("date4")== null ? "2022-08-07" : request.getParameter("date4");
        String fecha5 = request.getParameter("date5")== null ? "2022-06-07" : request.getParameter("date5");
        String fecha6 = request.getParameter("date6")== null ? "2022-08-07" : request.getParameter("date6");
        String fecha7 = request.getParameter("date7")== null ? "2022-06-07" : request.getParameter("date7");
        String fecha8 = request.getParameter("date8")== null ? "2022-08-07" : request.getParameter("date8");
        String fecha9 = request.getParameter("date9")== null ? "2022-06-07" : request.getParameter("date9");
        String fecha10 = request.getParameter("date10")== null ? "2022-08-07" : request.getParameter("date10");
        String fecha11 = request.getParameter("date11")== null ? "2022-06-07" : request.getParameter("date11");
        String fecha12 = request.getParameter("date12")== null ? "2022-08-07" : request.getParameter("date12");

        switch (action){
            case "filtrar":
                try {
                    BCelebridad actor = estadisticasDaos.actorMejorCalificado(fecha9,fecha10);
                    BCelebridad director = estadisticasDaos.directorMejorCalificado(fecha11,fecha12);
                    BPelicula pelicula = estadisticasDaos.peliculaMejorCalificada(fecha7,fecha8);
                    ArrayList<BFuncion> menosVista = estadisticasDaos.listarMenosVista(fecha5,fecha6);
                    ArrayList<BFuncion> masVista = estadisticasDaos.listarMasVista(fecha3,fecha4);
                    ArrayList<BFuncion> asistencia = estadisticasDaos.listarAsistencia(fecha1,fecha2);
                    ArrayList<BFuncion> generos = estadisticasDaos.listarGenero();
                    if (asistencia.get(0) != null) {
                        request.setAttribute("masVista", masVista);
                        request.setAttribute("menosVista", menosVista);
                        request.setAttribute("listaAsistencia", asistencia);
                        request.setAttribute("peliculaMejorCalificada", pelicula);
                        request.setAttribute("actorMejorCalificado", actor);
                        request.setAttribute("actorMejorCalificado", actor);
                        request.setAttribute("directorMejorCalificado", director);
                        request.setAttribute("listaGenero",generos);
                        RequestDispatcher listar = request.getRequestDispatcher("Operador/operador_estadisticas.jsp");
                        listar.forward(request, response);
                    }else{
                        response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                }
                break;
        }
    }
}