package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPersona;
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
        String idPeliculaStr =  request.getParameter("idPelicula");
        HttpSession session;
        BPersona usuario;
        int idPelicula;
        switch (action) {
            case "listarD":
                try {
                    session=request.getSession();
                    usuario=(BPersona) session.getAttribute("clienteLog");
                    idPelicula = Integer.parseInt(idPeliculaStr);
                    ArrayList<BCelebridad> listaDirector = calificacionDao.listarDirectorPorID(usuario.getIdPer(), idPelicula);
                    if (listaDirector.get(0) != null) {
                        request.setAttribute("idPelicula",idPelicula);
                        request.setAttribute("director", listaDirector.get(0));
                        RequestDispatcher listarD = request.getRequestDispatcher("Cliente/CalificarDirector.jsp");
                        listarD.forward(request, response);
                    }else{
                        response.sendRedirect(request.getContextPath());
                    }
                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath());
                }
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listarD" : request.getParameter("action");
        CalificacionDao calificacionDao = new CalificacionDao();

        String idCelebridadS = request.getParameter("idCelebridad");
        String idPeliculaS = request.getParameter("idPelicula");
        String puntajePelicula = request.getParameter("puntaje");
        HttpSession session;
        BPersona usuario;
        switch (action){
            case "calificarD" -> {
                try{
                    session=request.getSession();
                    usuario= (BPersona)session.getAttribute("clienteLog");
                    int puntaje = Integer.parseInt(puntajePelicula);
                    int idCelebridad = Integer.parseInt(idCelebridadS);
                    calificacionDao.anadirPuntajePorCelebridad(usuario.getIdPer(), idCelebridad, puntaje);
                    response.sendRedirect(request.getContextPath()+"/calificarDirector?action=listarD&idPelicula="+idPeliculaS);
                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath());
                }
            }
        }
    }
}
