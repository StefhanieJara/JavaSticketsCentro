package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Daos.CalificacionDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "Calificar2Servlet", value = "/calificarDirector")
public class Calificar2Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listarD" : request.getParameter("action");

        CalificacionDao calificacionDao = new CalificacionDao();
        String idPeliculaStr =  request.getParameter("idPelicula")==null?"6":request.getParameter("idPelicula");

        String idPersonaStr =  request.getParameter("idPersona")==null?"12":request.getParameter("idPersona");

        int idPelicula, idCelebridad, idPersona;
        switch (action) {
            case "listarD":
                try {
                    idPersona = Integer.parseInt(idPersonaStr);
                    idPelicula = Integer.parseInt(idPeliculaStr);
                    ArrayList<BCelebridad> listaDirector = calificacionDao.listarDirectorPorID(idPersona, idPelicula);
                    if (listaDirector.get(0) != null) {
                        request.setAttribute("idPersona",idPersona);
                        request.setAttribute("idPelicula",idPelicula);
                        request.setAttribute("listaDirectores", listaDirector);
                        RequestDispatcher listarD = request.getRequestDispatcher("Cliente/CalificarDirector.jsp");
                        listarD.forward(request, response);
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Error al convertir tipo de dato");
                }
                response.sendRedirect(request.getContextPath() + "/calificarDirector");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listarD" : request.getParameter("action");
        CalificacionDao calificacionDao = new CalificacionDao();
        String idPersonaS = request.getParameter("idPersona");
        String idCelebridadS = request.getParameter("idCelebridad");
        String idPeliculaS = request.getParameter("idPelicula");
        String puntajePelicula = request.getParameter("puntaje");
        switch (action){
            case "calificarD" -> {
                try{
                    int puntaje = Integer.parseInt(puntajePelicula);
                    int idCelebridad = Integer.parseInt(idCelebridadS);
                    int idPersona = Integer.parseInt(idPersonaS);
                    calificacionDao.anadirPuntajePorCelebridad(idPersona, idCelebridad, puntaje);
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir");
                }
                response.sendRedirect(request.getContextPath()+"/calificarDirector?action=listarD&idPersona="+idPersonaS+"&idPelicula="+idPeliculaS);
            }
        }
    }
}
