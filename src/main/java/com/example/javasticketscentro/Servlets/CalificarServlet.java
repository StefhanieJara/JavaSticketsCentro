package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPelicula;
import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.CalificacionDao;
import com.example.javasticketscentro.Daos.HistorialDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CalificarServlet", value = "/calificar")
public class CalificarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listarP" : request.getParameter("action");
        System.out.println(action);
        CalificacionDao calificacionDao = new CalificacionDao();
        String idPeliculaStr =  request.getParameter("idPelicula")==null?"2":request.getParameter("idPelicula");
        int idPelicula;
     switch (action){
            case "listarP":
                try{
                    idPelicula = Integer.parseInt(idPeliculaStr);
                    BPelicula pelicula = calificacionDao.listarPelicula(idPelicula);
                    if(pelicula != null){
                        request.setAttribute("Pelicula", pelicula);
                        RequestDispatcher listarP = request.getRequestDispatcher("Cliente/CalificarPelicula.jsp");
                        listarP.forward(request, response);
                    }
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir tipo de dato");
                }
                response.sendRedirect(request.getContextPath()+"/calificar");
                break;
            case "listarD":
                idPelicula = Integer.parseInt(idPeliculaStr);
                ArrayList<BCelebridad> listaDirector = calificacionDao.listarDirectorPorID(idPelicula);
                if(listaDirector.get(0) != null){
                    request.setAttribute("listaDirectores", listaDirector);
                    RequestDispatcher listarD = request.getRequestDispatcher("Cliente/CalificarDirector.jsp");
                    listarD.forward(request, response);
                }else{
                    response.sendRedirect(request.getContextPath()+"/calificar");
                }
            case "listarA":
                idPelicula = Integer.parseInt(idPeliculaStr);
                ArrayList<BCelebridad> listaActor = calificacionDao.listarActorPorID(idPelicula);
                if(listaActor.get(0) != null){
                    request.setAttribute("listaActores", listaActor);
                    RequestDispatcher listarA = request.getRequestDispatcher("Cliente/CalificarDirector.jsp");
                    listarA.forward(request, response);
                }else{
                    response.sendRedirect(request.getContextPath()+"/calificar");
                }

                break;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listarP" : request.getParameter("action");
        CalificacionDao calificacionDao = new CalificacionDao();

        switch (action){
            case "calificarP" -> {
                String idPersonaS = request.getParameter("idPersona");
                String idPeliculaS= request.getParameter("idPelicula");
                String puntajePelicula = request.getParameter("puntaje");
                int puntaje = Integer.parseInt(puntajePelicula);
                System.out.println(puntaje);
                int idPelicula = Integer.parseInt(idPeliculaS);
                int idPersona = Integer.parseInt(idPersonaS);

                calificacionDao.anadirPuntajePorPelicula(idPersona, idPelicula, puntaje);
                response.sendRedirect(request.getContextPath()+"/calificar");
            }
            case "calificarC" -> {
                String idPersonaS = request.getParameter("idPersona");
                String idCelebridadS = request.getParameter("idCelebridad");
                String puntajePelicula = request.getParameter("puntaje");
                int puntaje = Integer.parseInt(puntajePelicula);
                int idCelebridad = Integer.parseInt(idCelebridadS);
                int idPersona = Integer.parseInt(idPersonaS);

                calificacionDao.anadirPuntajePorCelebridad(idPersona, idCelebridad, puntaje);
                response.sendRedirect(request.getContextPath()+"/calificar");
            }

        }
    }
}
