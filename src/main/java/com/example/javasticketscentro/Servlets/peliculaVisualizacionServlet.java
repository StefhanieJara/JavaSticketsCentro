package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.OperadorDao;
import com.example.javasticketscentro.Daos.PeliculaDao;
import com.sun.security.jgss.GSSUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Locale;


@WebServlet(name = "peliculaVisualizacionServlet", urlPatterns = {"/peliculaVisualizacionServlet"})
public class peliculaVisualizacionServlet extends HttpServlet {
    private static int cant_resultFunciones=10;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        HttpSession session= request.getSession();
        OperadorDao operadorDao = new OperadorDao();
        AdminDao adminDao = new AdminDao();
        String mensaje = request.getParameter("mensaje")==null?"":request.getParameter("mensaje");
        int pagina= session.getAttribute("pagina")==null?1:(int)session.getAttribute("pagina");
        String filtrnombre=session.getAttribute("filtrnombre")==null?"":(String)session.getAttribute("filtrnombre");
        switch (action){
            case "listar" ->{
                request.setAttribute("listapeliculas",operadorDao.listapeliculas(filtrnombre, pagina, cant_resultFunciones, true));
                int cant_paginas=(int)Math.ceil((double)operadorDao.listapeliculas(filtrnombre, pagina, cant_resultFunciones, false).size()/cant_resultFunciones);
                request.setAttribute("cant_paginas", cant_paginas);
                request.setAttribute("pagina", pagina);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/peliculaVisualizacion.jsp");
                requestDispatcher.forward(request,response);
            }
            case "crear"->{
                if(mensaje.equals("incompletos")){
                    request.setAttribute("mensaje", mensaje);
                }
                request.setAttribute("listarsala",adminDao.listasala());
                request.setAttribute("listarsede",adminDao.listarSedes());
                request.setAttribute("listarDirector",adminDao.listarDirector());
                request.setAttribute("listarActor",adminDao.listarActor());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/registrar_pelicula.jsp");
                requestDispatcher.forward(request,response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        OperadorDao operadorDao = new OperadorDao();
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        HttpSession session= request.getSession();
        switch (action){
            case "borrar":
                int idPelicula = Integer.parseInt(request.getParameter("idPeli"));
                operadorDao.deshabilitarPelicula(idPelicula);
                response.sendRedirect(request.getContextPath()+"/peliculaVisualizacionServlet");
                break;
            case "guardar":
                try {
                    String nombre = request.getParameter("nombrePeli")==null?"":request.getParameter("nombrePeli");
                    String genero = request.getParameter("genero")==null?"":request.getParameter("genero");
                    String tiempoDuracion = request.getParameter("tiempo")==null?"":request.getParameter("tiempo");
                    String duracionConFormato = tiempoDuracion + ":00";
                    String restriccion = request.getParameter("restriccionEdad")==null?"":request.getParameter("restriccionEdad");
                    String sinopsis = request.getParameter("sinopsis")==null?"":request.getParameter("sinopsis");
                    String URLFoto = request.getParameter("photoUrl");
                    if  (URLFoto == null){
                        URLFoto=" https://e7.pngegg.com/pngimages/386/168/png-clipart-white-frame-photo-gallery-frame.png";
                    }else if (URLFoto.equals("")){
                        URLFoto="https://e7.pngegg.com/pngimages/386/168/png-clipart-white-frame-photo-gallery-frame.png";
                    }
                    operadorDao.crearPelicula(nombre, genero, duracionConFormato, restriccion, sinopsis, URLFoto);
                    response.sendRedirect(request.getContextPath()+"/peliculaVisualizacionServlet");
                }catch (NumberFormatException e){
                    e.printStackTrace();
                }
                break;
            case "buscar":
                session.setAttribute("filtrnombre", request.getParameter("filtrnombre"));
                response.sendRedirect(request.getContextPath() + "/peliculaVisualizacionServlet");
                break;
            case "paginar":
                int pagina= Integer.parseInt(request.getParameter("pagina"));
                session.setAttribute("pagina", pagina);
                response.sendRedirect(request.getContextPath() + "/peliculaVisualizacionServlet");
                break;
        }
    }
}