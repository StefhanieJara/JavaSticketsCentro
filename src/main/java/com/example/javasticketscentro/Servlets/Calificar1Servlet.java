package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPersona;
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

        HttpSession session=request.getSession();;

        int pagina= session.getAttribute("pagina")==null? 1 :(Integer) session.getAttribute("pagina");

        BPersona usuario;

        int idPelicula;
        switch (action) {
            case "listarA":
                usuario=(BPersona) session.getAttribute("clienteLog");
                idPelicula = (Integer) session.getAttribute("idPeli");
                ArrayList<BCelebridad> listaActor = calificacionDao.listarCelebridadPorID(usuario.getIdPer(), idPelicula, "actor");
                if (listaActor == null) {
                    listaActor= new ArrayList<>();
                }
                request.setAttribute("idPelicula",idPelicula);
                request.setAttribute("pagina", pagina);
                request.setAttribute("listaActor", listaActor);
                ArrayList<Integer> listaPuntajes = new ArrayList<>();
                for(BCelebridad celebridad : listaActor){
                    listaPuntajes.add(calificacionDao.puntajeCelebridadPorId(usuario.getIdPer(),celebridad.getIdCelebridad()));
                }
                request.setAttribute("puntaje", listaPuntajes.get(pagina-1));
                RequestDispatcher view = request.getRequestDispatcher("Cliente/CalificarActor.jsp");
                view.forward(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath());
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        CalificacionDao calificacionDao = new CalificacionDao();
        String idCelebridadS = request.getParameter("idCelebridad");
        String puntajeActor = request.getParameter("puntaje");
        HttpSession session= request.getSession();;
        BPersona usuario;
        int pagina;
        switch (action){
            case "calificarA" -> {
                try{
                    int puntaje = Integer.parseInt(puntajeActor);
                    int idCelebridad = Integer.parseInt(idCelebridadS);
                    usuario=(BPersona)session.getAttribute("clienteLog");
                    pagina= Integer.parseInt(request.getParameter("pagina"));
                    calificacionDao.anadirPuntajePorCelebridad(usuario.getIdPer(), idCelebridad, puntaje, false);
                    session.setAttribute("pagina", pagina);
                    response.sendRedirect(request.getContextPath()+"/calificarActor");
                }catch (NumberFormatException e){
                    System.out.println("Error");
                    response.sendRedirect(request.getContextPath());
                }
            }
            case "paginacion" ->{
                try{
                    pagina= Integer.parseInt(request.getParameter("pagina"));
                    session.setAttribute("pagina", pagina);
                    response.sendRedirect(request.getContextPath()+"/calificarActor");
                } catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath());
                }

            }

        }

    }
}
