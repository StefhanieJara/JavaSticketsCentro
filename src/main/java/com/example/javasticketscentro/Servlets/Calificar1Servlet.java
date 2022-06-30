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

        String idPeliculaStr =  request.getParameter("idPelicula");
        String paginastr= request.getParameter("pagina")==null? "1" : request.getParameter("pagina");
        HttpSession session;
        BPersona usuario;

        int idPelicula;
        switch (action) {
            case "listarA":
                try {
                    session= request.getSession();
                    usuario=(BPersona) session.getAttribute("clienteLog");
                    idPelicula = Integer.parseInt(idPeliculaStr);
                    ArrayList<BCelebridad> listaActor = calificacionDao.listarActorPorID(usuario.getIdPer(), idPelicula);
                    if (listaActor == null) {
                        listaActor= new ArrayList<>();
                    }
                    int pagina= Integer.parseInt(paginastr);
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
                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath());
                }
                break;

        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        CalificacionDao calificacionDao = new CalificacionDao();
        String idCelebridadS = request.getParameter("idCelebridad");
        String idPeliculaS = request.getParameter("idPelicula");
        String puntajePelicula = request.getParameter("puntaje");
        HttpSession session;
        BPersona usuario;
        int pagina= 1;
        switch (action){
            case "calificarA" -> {
                try{
                    int puntaje = Integer.parseInt(puntajePelicula);
                    int idCelebridad = Integer.parseInt(idCelebridadS);
                    session= request.getSession();
                    usuario=(BPersona)session.getAttribute("clienteLog");
                    pagina= Integer.parseInt(request.getParameter("pagina"));
                    calificacionDao.anadirPuntajePorCelebridad(usuario.getIdPer(), idCelebridad, puntaje);
                    response.sendRedirect(request.getContextPath()+"/calificarActor?action=listarA&idPelicula="+idPeliculaS+"&pagina="+pagina);
                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath());
                }
            }
            case "paginacion" ->{
                try{
                    int idPelicula= Integer.parseInt(idPeliculaS);
                    pagina= Integer.parseInt(request.getParameter("pagina"));
                    response.sendRedirect(request.getContextPath()+"/calificarActor?action=listarA&idPelicula="+idPelicula+"&pagina="+pagina);
                } catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath());
                }

            }

        }

    }
}
