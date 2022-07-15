package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPelicula;
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
                request.setAttribute("mensaje", mensaje);
                request.setAttribute("listarDirector",adminDao.listarDirector());
                request.setAttribute("listarActor",adminDao.listarActor());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/registrar_pelicula.jsp");
                requestDispatcher.forward(request,response);
            }
            default -> {response.sendRedirect(request.getContextPath());}
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        OperadorDao operadorDao = new OperadorDao();
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        HttpSession session= request.getSession();
        int idPelicula = 0;
        switch (action){
            case "actualizar":
                try {
                    idPelicula = Integer.parseInt(request.getParameter("idPeli"));
                    BPelicula pelicula = operadorDao.obtenerPelicula(idPelicula);
                    String nombre = request.getParameter("nombrePeli")==null?pelicula.getNombre():request.getParameter("nombrePeli");
                    String genero = request.getParameter("genero")==null?pelicula.getGenero():request.getParameter("genero");
                    String tiempoDuracion = request.getParameter("tiempo")==null?pelicula.getDuracion():request.getParameter("tiempo");
                    String restriccion = request.getParameter("restriccionEdad")==null?pelicula.getRestriccionEdad():request.getParameter("restriccionEdad");
                    String sinopsis = request.getParameter("sinopsis")==null?pelicula.getSinopsis():request.getParameter("sinopsis");
                    String URLFoto = request.getParameter("photoUrl");
                    if  (URLFoto == null){
                        URLFoto = pelicula.getFoto();
                    }else if(URLFoto.equals("")){
                        URLFoto = pelicula.getFoto();
                    }
                    operadorDao.actualizarPelicula(idPelicula, nombre, genero, tiempoDuracion, restriccion, sinopsis, URLFoto);
                    response.sendRedirect(request.getContextPath()+"/peliculaVisualizacionServlet");
                }catch (NumberFormatException e){
                    e.printStackTrace();
                }
                break;
            case "editar":
                idPelicula = Integer.parseInt(request.getParameter("idPeli"));
                BPelicula pelicula = operadorDao.obtenerPelicula(idPelicula);
                request.setAttribute("pelicula", pelicula);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/editarPelicula.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "borrar":
                idPelicula = Integer.parseInt(request.getParameter("idPeli"));
                operadorDao.deshabilitarPelicula(idPelicula);
                response.sendRedirect(request.getContextPath()+"/peliculaVisualizacionServlet");
                break;
            case "guardar":
                try {
                    String nombre = request.getParameter("nombrePeli")==null?"":request.getParameter("nombrePeli");
                    String genero = request.getParameter("genero")==null?"":request.getParameter("genero");
                    String tiempoDuracion = request.getParameter("tiempo")==null?"":request.getParameter("tiempo");
                    String duracionConFormato = tiempoDuracion + ":00";
                    String restriccionEdad = request.getParameter("restriccionEdad")==null?"":request.getParameter("restriccionEdad");
                    String restriccion="";
                    switch (restriccionEdad){
                        case "Para todo publico (AA)":
                            restriccion = "AA";
                            break;
                        case "+12 (B)":
                            restriccion="+12 (B)";
                            break;
                        case "+15 (B15)":
                            restriccion="+15 (B15)";
                            break;
                        case "+18 (C)":
                            restriccion="+18 (C)";
                            break;
                        case "Explicitas o lenguaje violento (D)":
                            restriccion="D";
                            break;
                        default:
                            restriccion="";
                    }
                    String sinopsis = request.getParameter("sinopsis")==null?"":request.getParameter("sinopsis");
                    String URLFoto = request.getParameter("photoUrl") == null?"":request.getParameter("photoUrl");
                    if  (URLFoto == null){
                        URLFoto="";
                    }
                    if(restriccion.equals("")) {
                        response.sendRedirect(request.getContextPath()+"/peliculaVisualizacionServlet?action=crear&mensaje=restriccion");
                    }
                    else if(URLFoto.equals("")){
                        response.sendRedirect(request.getContextPath()+"/peliculaVisualizacionServlet?action=crear&mensaje=url");
                    }else{
                        operadorDao.crearPelicula(nombre, genero, restriccion, sinopsis, URLFoto, duracionConFormato);
                        request.setAttribute("idPeli", operadorDao.obtenerIdPelicula(nombre));
                        AdminDao adminDao = new AdminDao();
                        request.setAttribute("listarDirector", adminDao.listarDirector());
                        request.setAttribute("listarActor", adminDao.listarActor());
                        System.out.println("éxito");
                        RequestDispatcher view = request.getRequestDispatcher("Operador/agregarCelebridadesPelicula.jsp");
                        view.forward(request, response);
                    }
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
            case "agregarCelebridades":
                idPelicula = Integer.parseInt(request.getParameter("idPeli"));
                int idDirector = Integer.parseInt(request.getParameter("director").equals("Seleccionar")?"0":request.getParameter("director"));
                int actor1 = Integer.parseInt(request.getParameter("actor1").equals("Seleccionar")?"0":request.getParameter("actor1"));
                int actor2 = Integer.parseInt(request.getParameter("actor2").equals("Seleccionar")?"0":request.getParameter("actor2"));
                int actor3 = Integer.parseInt(request.getParameter("actor3").equals("Seleccionar")?"0":request.getParameter("actor3"));
                int actor4 = Integer.parseInt(request.getParameter("actor4").equals("Seleccionar")?"0":request.getParameter("actor4"));


                break;
            default:
                response.sendRedirect(request.getContextPath());
        }
    }
}