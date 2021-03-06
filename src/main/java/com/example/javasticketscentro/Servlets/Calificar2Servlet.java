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
        HttpSession session=request.getSession();;
        BPersona usuario;
        switch (action) {
            case "listarD":
                usuario=(BPersona) session.getAttribute("clienteLog");
                int idPelicula = (Integer)session.getAttribute("idPeli");
                ArrayList<BCelebridad> listaDirector = calificacionDao.listarCelebridadPorID(usuario.getIdPer(), idPelicula, "director");
                if (listaDirector.get(0) != null) {
                    request.setAttribute("idPelicula",idPelicula);
                    request.setAttribute("director", listaDirector.get(0));
                    int puntaje=calificacionDao.puntajeCelebridadPorId(usuario.getIdPer(),listaDirector.get(0).getIdCelebridad());
                    request.setAttribute("puntaje", puntaje);
                    RequestDispatcher listarD = request.getRequestDispatcher("Cliente/CalificarDirector.jsp");
                    listarD.forward(request, response);
                }else{
                    response.sendRedirect(request.getContextPath());
                }
                break;
            case "listarA":
                String idPeli=request.getParameter("idPelicula");
                session.setAttribute("idPeli", Integer.parseInt(idPeli));
                response.sendRedirect(request.getContextPath()+"/calificarActor");
                break;
            default:
                response.sendRedirect(request.getContextPath());
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listarD" : request.getParameter("action");
        CalificacionDao calificacionDao = new CalificacionDao();

        String idCelebridadS = request.getParameter("idCelebridad");
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
                    calificacionDao.anadirPuntajePorCelebridad(usuario.getIdPer(), idCelebridad, puntaje, false);
                    response.sendRedirect(request.getContextPath()+"/calificarDirector");
                }catch (NumberFormatException e){
                    System.out.println("Error Calificar Director");
                    response.sendRedirect(request.getContextPath());
                }
            }
        }
    }
}
