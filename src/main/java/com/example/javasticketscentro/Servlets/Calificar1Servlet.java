package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Daos.CalificacionDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "Calificar1Servlet", value = "/calificarActor")
public class Calificar1Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listarA" : request.getParameter("action");

        CalificacionDao calificacionDao = new CalificacionDao();
        String idPeliculaStr =  request.getParameter("idPelicula")==null?"4":request.getParameter("idPelicula");

        String idPersonaStr =  request.getParameter("idPersona")==null?"3":request.getParameter("idPersona");

        int idPelicula, idCelebridad, idPersona;
        switch (action) {

            case "listarA":
                try {
                    idPersona = Integer.parseInt(idPersonaStr);
                    idPelicula = Integer.parseInt(idPeliculaStr);
                    ArrayList<BCelebridad> listaActor = calificacionDao.listarActorPorID(idPersona, idPelicula);
                    if (listaActor.get(0) != null) {
                        request.setAttribute("idPersona",idPersona);
                        request.setAttribute("idPelicula",idPelicula);
                        request.setAttribute("listaActores", listaActor);
                        RequestDispatcher listarA = request.getRequestDispatcher("Cliente/CalificarActor.jsp");
                        listarA.forward(request, response);
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Error al convertir tipo de dato");
                }
                response.sendRedirect(request.getContextPath() + "/calificarActor");
                break;

        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listarA" : request.getParameter("action");
        CalificacionDao calificacionDao = new CalificacionDao();

        switch (action){
            case "calificarA" -> {
                try{
                    String idPersonaS = request.getParameter("idPersona");
                    String idCelebridadS = request.getParameter("idCelebridad");
                    String idPeliculaS = request.getParameter("idPelicula");
                    String puntajePelicula = request.getParameter("puntaje");
                    int puntaje = Integer.parseInt(puntajePelicula);
                    int idCelebridad = Integer.parseInt(idCelebridadS);
                    int idPersona = Integer.parseInt(idPersonaS);
                    calificacionDao.anadirPuntajePorCelebridad(idPersona, idCelebridad, puntaje);
                    response.sendRedirect(request.getContextPath()+"/calificarActor");
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir");
                }

            }
        }

    }
}
