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
        String idPeliculaStr =  request.getParameter("idPelicula");
        String idPersonaStr =  request.getParameter("idPersona");
        String paginastr= request.getParameter("pagina")==null? "1" : request.getParameter("pagina");

        int idPelicula, idCelebridad, idPersona;
        switch (action) {
            case "listarA":
                try {
                    idPersona = Integer.parseInt(idPersonaStr);
                    idPelicula = Integer.parseInt(idPeliculaStr);
                    ArrayList<BCelebridad> listaActor = calificacionDao.listarActorPorID(idPersona, idPelicula);
                    if (listaActor == null) {
                        System.out.println(listaActor.get(1).getNombre());
                        listaActor= new ArrayList<>();
                    }
                    int pagina= Integer.parseInt(paginastr);
                    request.setAttribute("idPersona",idPersona);
                    request.setAttribute("idPelicula",idPelicula);
                    request.setAttribute("pagina", pagina);
                    request.setAttribute("listaActor", listaActor);
                    ArrayList<Integer> listaPuntajes = new ArrayList<>();
                    for(BCelebridad celebridad : listaActor){
                        listaPuntajes.add(calificacionDao.puntajeCelebridadPorId(idPersona,celebridad.getIdCelebridad()));
                    }
                    request.setAttribute("puntaje", listaPuntajes.get(pagina-1));
                    RequestDispatcher view = request.getRequestDispatcher("Cliente/CalificarActor.jsp");
                    view.forward(request, response);
                } catch (NumberFormatException e) {
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/calificarActor?action=listarA&idPersona="+idPersonaStr+"&idPelicula="+idPeliculaStr);
                }
                break;

        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        CalificacionDao calificacionDao = new CalificacionDao();

        String idPersonaS = request.getParameter("idPersona");
        String idCelebridadS = request.getParameter("idCelebridad");
        String idPeliculaS = request.getParameter("idPelicula");
        String puntajePelicula = request.getParameter("puntaje");
        int pagina= 1;
        switch (action){
            case "calificarA" -> {
                try{
                    int puntaje = Integer.parseInt(puntajePelicula);
                    int idCelebridad = Integer.parseInt(idCelebridadS);
                    int idPersona = Integer.parseInt(idPersonaS);
                    pagina= Integer.parseInt(request.getParameter("pagina"));
                    calificacionDao.anadirPuntajePorCelebridad(idPersona, idCelebridad, puntaje);
                }catch (NumberFormatException e){
                    System.out.println("Puntaje: "+puntajePelicula+" CelebridadID: "+idCelebridadS+" IDPERSONA: "+idPersonaS);
                    System.out.println("Error al convertir");
                }
                response.sendRedirect(request.getContextPath()+"/calificarActor?action=listarA&idPersona="+idPersonaS+"&idPelicula="+idPeliculaS+"&pagina="+pagina);
            }
            case "paginacion" ->{
                try{
                    int idPersona = Integer.parseInt(idPersonaS);
                    int idPelicula= Integer.parseInt(idPeliculaS);
                    pagina= Integer.parseInt(request.getParameter("pagina"));
                    response.sendRedirect(request.getContextPath()+"/calificarActor?action=listarA&idPersona="+idPersona+"&idPelicula="+idPelicula+"&pagina="+pagina);
                } catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet");
                }

            }

        }

    }
}
