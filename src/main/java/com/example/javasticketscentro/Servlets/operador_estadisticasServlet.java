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

    }
}