package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPelicula;
import com.example.javasticketscentro.Daos.CalificacionDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CalificarServlet", value = "/calificarPelicula")
public class CalificarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listarP" : request.getParameter("action");

        CalificacionDao calificacionDao = new CalificacionDao();
        String idPeliculaStr =  request.getParameter("idPelicula")==null?"6":request.getParameter("idPelicula");

        String idPersonaStr =  request.getParameter("idPersona")==null?"12":request.getParameter("idPersona");

        int idPelicula, idCelebridad, idPersona;
     switch (action) {
         case "listarP":
             try {
                 idPersona = Integer.parseInt(idPersonaStr);
                 idPelicula = Integer.parseInt(idPeliculaStr);
                 BPelicula pelicula = calificacionDao.listarPelicula(idPelicula);
                 if (pelicula != null) {
                     request.setAttribute("Persona", idPersona);
                     request.setAttribute("Pelicula", pelicula);
                     request.setAttribute("puntaje", calificacionDao.puntajePeliculaPorId(idPersona, idPelicula));
                     RequestDispatcher listarP = request.getRequestDispatcher("Cliente/CalificarPelicula.jsp");
                     listarP.forward(request, response);
                 }
             } catch (NumberFormatException e) {
                 System.out.println("Error al convertir tipo de dato");
             }
             response.sendRedirect(request.getContextPath() + "/calificarPelicula");
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
                try{
                    int puntaje = Integer.parseInt(puntajePelicula);
                    System.out.println(puntaje);
                    int idPelicula = Integer.parseInt(idPeliculaS);
                    int idPersona = Integer.parseInt(idPersonaS);
                    calificacionDao.anadirPuntajePorPelicula(idPersona, idPelicula, puntaje);
                    response.sendRedirect(request.getContextPath()+"/calificarPelicula");
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir");
                }

            }


        }
    }
}
