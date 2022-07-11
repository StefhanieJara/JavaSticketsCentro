package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPelicula;
import com.example.javasticketscentro.Beans.BPersona;
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

        HttpSession session= request.getSession();
        BPersona usuario;
        int idPelicula;
     switch (action) {
         case "listarP":
                 usuario= (BPersona) session.getAttribute("clienteLog");
                 idPelicula=(Integer) session.getAttribute("idPeli");
                 BPelicula pelicula = calificacionDao.listarPelicula(idPelicula);
                 if (pelicula != null) {
                     request.setAttribute("Pelicula", pelicula);
                     request.setAttribute("puntaje", calificacionDao.puntajePeliculaPorId(usuario.getIdPer(), idPelicula));
                     RequestDispatcher listarP = request.getRequestDispatcher("Cliente/CalificarPelicula.jsp");
                     listarP.forward(request, response);
                 }else{
                     response.sendRedirect(request.getContextPath());
                 }
             break;
         case "listarD":
             String idPeliculaStr =  request.getParameter("idPelicula");
             session.setAttribute("idPeli",Integer.parseInt(idPeliculaStr));
             response.sendRedirect(request.getContextPath()+"/calificarDirector");
             break;
         default:
             response.sendRedirect(request.getContextPath());
             break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "calificarP" : request.getParameter("action");
        CalificacionDao calificacionDao = new CalificacionDao();
        HttpSession session;
        BPersona usuario;

        switch (action){
            case "calificarP" -> {
                session=request.getSession();
                usuario=(BPersona) session.getAttribute("clienteLog");
                String idPeliculaS= request.getParameter("idPelicula");
                String puntajePelicula = request.getParameter("puntaje");
                try{
                    int puntaje = Integer.parseInt(puntajePelicula);
                    int idPelicula = Integer.parseInt(idPeliculaS);
                    if(calificacionDao.listarPelicula(idPelicula)!=null){
                        calificacionDao.anadirPuntajePorPelicula(usuario.getIdPer(), idPelicula, puntaje);
                        response.sendRedirect(request.getContextPath()+"/calificarPelicula");
                    }else{
                        System.out.println("ERRORRRRR");
                        response.sendRedirect(request.getContextPath());
                    }
                }catch (NumberFormatException e){
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath());
                }
            }
        }
    }
}
