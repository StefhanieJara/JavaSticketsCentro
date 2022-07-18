package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPelicula;
import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.OperadorDao;
import com.example.javasticketscentro.Daos.PeliculaDao;
import com.sun.jdi.IntegerType;
import com.sun.security.jgss.GSSUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Array;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
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
                ArrayList<BPelicula> peliculas=operadorDao.listapeliculas(filtrnombre, pagina, cant_resultFunciones, true);
                request.setAttribute("listapeliculas",peliculas);
                ArrayList<Boolean> sePuedeEditar= new ArrayList<>();
                for(BPelicula pelicula: peliculas){
                    try {
                        sePuedeEditar.add(operadorDao.esPosibleEditarPelicula(pelicula.getIdPelicula()));
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                request.setAttribute("sePuedeEditar",sePuedeEditar);
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
            case "editarCelebridades"->{
                BPelicula pelicula=(BPelicula)session.getAttribute("peliEditar");

                request.setAttribute("pelicula", pelicula);
                request.setAttribute("listarActor",adminDao.listarActor());
                request.setAttribute("listarDirector", adminDao.listarDirector());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/editarCelebridadesPelicula.jsp");
                requestDispatcher.forward(request, response);
            }
            case "borrarPermanente"->{
                session.removeAttribute("pagina");
                try {
                    operadorDao.eliminarPelicula(Integer.parseInt(request.getParameter("idPeli")));
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                response.sendRedirect(request.getContextPath()+"/peliculaVisualizacionServlet");
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
        int idPelicula;
        switch (action) {
            case "actualizar":
                String editar = request.getParameter("editarCelebridad");
                if (editar == null) {
                    try {
                        idPelicula = Integer.parseInt(request.getParameter("idPeli"));
                        BPelicula pelicula = operadorDao.obtenerPelicula(idPelicula);
                        String nombre = request.getParameter("nombrePeli") == null ? pelicula.getNombre() : request.getParameter("nombrePeli");
                        String genero = request.getParameter("genero") == null ? pelicula.getGenero() : request.getParameter("genero");
                        String tiempoDuracion = request.getParameter("tiempo") == null ? pelicula.getDuracion() : request.getParameter("tiempo");
                        String restriccion = request.getParameter("restriccionEdad") == null ? pelicula.getRestriccionEdad() : request.getParameter("restriccionEdad");
                        String sinopsis = request.getParameter("sinopsis") == null ? pelicula.getSinopsis() : request.getParameter("sinopsis");
                        String URLFoto = request.getParameter("photoUrl");

                        switch (restriccion) {
                            case "Para todo publico (AA)":
                                restriccion = "AA";
                                break;
                            case "+12 (B)":
                                restriccion = "+12 (B)";
                                break;
                            case "+15 (B15)":
                                restriccion = "+15 (B15)";
                                break;
                            case "+18 (C)":
                                restriccion = "+18 (C)";
                                break;
                            case "Explicitas o lenguaje violento (D)":
                                restriccion = "D";
                                break;
                            default:
                                restriccion = "";
                        }

                        if (URLFoto == null) {
                            URLFoto = pelicula.getFoto();
                        } else if (URLFoto.equals("")) {
                            URLFoto = pelicula.getFoto();
                        }
                        operadorDao.actualizarPelicula(idPelicula, nombre, genero, tiempoDuracion, restriccion, sinopsis, URLFoto);
                        response.sendRedirect(request.getContextPath() + "/peliculaVisualizacionServlet");
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                } else {
                    int idPeli= Integer.parseInt(request.getParameter("idPeli"));
                    int actor;
                    ArrayList<Integer> actores= new ArrayList<>();
                    boolean noseRepiten=true;
                    int director= Integer.parseInt(request.getParameter("director"));
                    try {
                        forActores:
                        for(int i=1;i<=4;i++){
                            actor= Integer.parseInt(request.getParameter("actor"+i));
                            if(i!=1){
                                for(int act : actores){
                                    if(actor==act && act!=0){
                                        noseRepiten=false;
                                        break forActores;
                                    }
                                }
                            }
                            actores.add(actor);
                        }
                        if(noseRepiten){
                            if(operadorDao.limpiarCelebridadesPeli(idPeli)){
                                BPelicula pelicula=(BPelicula)session.getAttribute("peliEditar");
                                pelicula.getDirectores().clear();
                                pelicula.getActores().clear();

                                operadorDao.actualizarCelebridades(idPeli,director);
                                BCelebridad direc= new BCelebridad();
                                direc.setIdCelebridad(director);
                                pelicula.getDirectores().add(direc);

                                for(int i : actores){
                                    if(i!=0){
                                        BCelebridad act= new BCelebridad();
                                        act.setIdCelebridad(i);
                                        pelicula.getActores().add(act);
                                        operadorDao.actualizarCelebridades(idPeli,i);
                                    }
                                }
                                response.sendRedirect(request.getContextPath() + "/peliculaVisualizacionServlet?action=editarCelebridades");
                            }else{
                                response.sendRedirect(request.getContextPath() + "/peliculaVisualizacionServlet?action=editarCelebridades");
                            }
                        }else {
                            session.setAttribute("msg", "");
                            response.sendRedirect(request.getContextPath() + "/peliculaVisualizacionServlet?action=editarCelebridades");
                        }
                    }catch(SQLException e){
                        e.printStackTrace();
                        response.sendRedirect(request.getContextPath() + "/peliculaVisualizacionServlet");
                    }
                }
                break;
            case "editar":
                idPelicula = Integer.parseInt(request.getParameter("idPeli"));
                PeliculaDao peli= new PeliculaDao();
                BPelicula pelicula = peli.devolverPelicula(idPelicula);
                request.setAttribute("pelicula", pelicula);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/editarPelicula.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "deshabilitar":
                idPelicula = Integer.parseInt(request.getParameter("idPeli"));
                operadorDao.deshabilitarHabilitarPelicula(idPelicula,0);
                response.sendRedirect(request.getContextPath()+"/peliculaVisualizacionServlet");
                break;
            case "habilitar":
                idPelicula = Integer.parseInt(request.getParameter("idPeli"));
                operadorDao.deshabilitarHabilitarPelicula(idPelicula,1);
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
                        BPelicula pelicula1= new BPelicula();
                        pelicula1.setNombre(nombre);
                        pelicula1.setGenero(genero);
                        pelicula1.setRestriccionEdad(restriccionEdad);
                        pelicula1.setSinopsis(sinopsis);
                        pelicula1.setFoto(URLFoto);
                        pelicula1.setDuracion(duracionConFormato);
                        session.setAttribute("PeliculaNueva", pelicula1);

                        request.setAttribute("idPeli", operadorDao.obtenerIdPelicula(nombre));
                        AdminDao adminDao = new AdminDao();
                        request.setAttribute("listarDirector", adminDao.listarDirector());
                        request.setAttribute("listarActor", adminDao.listarActor());
                        RequestDispatcher view = request.getRequestDispatcher("Operador/agregarCelebridadesPelicula.jsp");
                        view.forward(request, response);
                    }
                }catch (NumberFormatException e){
                    e.printStackTrace();
                }
                break;
            case "buscar":
                session.removeAttribute("pagina");
                session.setAttribute("filtrnombre", request.getParameter("filtrnombre"));
                response.sendRedirect(request.getContextPath() + "/peliculaVisualizacionServlet");
                break;
            case "paginar":
                int pagina= Integer.parseInt(request.getParameter("pagina"));
                session.setAttribute("pagina", pagina);
                response.sendRedirect(request.getContextPath() + "/peliculaVisualizacionServlet");
                break;
            case "agregarCelebridades":
                HashSet<Integer> listaActores = new HashSet<>();
                RequestDispatcher view;
                AdminDao adminDao = new AdminDao();
                BPelicula pelicula1 = (BPelicula) session.getAttribute("PeliculaNueva");
                request.setAttribute("idPeli", pelicula1.getIdPelicula());
                request.setAttribute("listarDirector", adminDao.listarDirector());
                request.setAttribute("listarActor", adminDao.listarActor());
                try {
                    boolean sinProblema= true;
                    int idDirector = Integer.parseInt(request.getParameter("director").equals("Seleccionar") ? "0" : request.getParameter("director"));
                    if (idDirector==0){
                        request.setAttribute("mensaje", "directorCero");
                        sinProblema=false;
                        view = request.getRequestDispatcher("Operador/agregarCelebridadesPelicula.jsp");
                        view.forward(request, response);
                    }
                    int actor1 = Integer.parseInt(request.getParameter("actor1").equals("Seleccionar") ? "0" : request.getParameter("actor1"));
                    if(actor1!=0){
                        listaActores.add(actor1);
                    }
                    int actor2 = Integer.parseInt(request.getParameter("actor2").equals("Seleccionar") ? "0" : request.getParameter("actor2"));
                    if(listaActores.contains(actor2)){
                        sinProblema=false;
                        request.setAttribute("mensaje", "actorRepetido");
                        view = request.getRequestDispatcher("Operador/agregarCelebridadesPelicula.jsp");
                        view.forward(request, response);
                    }else{
                        if(actor2!=0) {
                            listaActores.add(actor2);
                        }
                    }
                    int actor3 = Integer.parseInt(request.getParameter("actor3").equals("Seleccionar") ? "0" : request.getParameter("actor3"));
                    if(listaActores.contains(actor3)){
                        sinProblema=false;
                        request.setAttribute("mensaje", "actorRepetido");
                        view = request.getRequestDispatcher("Operador/agregarCelebridadesPelicula.jsp");
                        view.forward(request, response);
                    }else{
                        if(actor3!=0) {
                            listaActores.add(actor3);
                        }
                    }
                    int actor4 = Integer.parseInt(request.getParameter("actor4").equals("Seleccionar") ? "0" : request.getParameter("actor4"));
                    if(listaActores.contains(actor4)){
                        sinProblema=false;
                        request.setAttribute("mensaje", "actorRepetido");
                        view = request.getRequestDispatcher("Operador/agregarCelebridadesPelicula.jsp");
                        view.forward(request, response);
                    }else{
                        if(actor4!=0) {
                            listaActores.add(actor4);
                        }
                    }
                    if(sinProblema){
                        if(listaActores.size()==0){
                            request.setAttribute("mensaje", "actoresCero");
                            view = request.getRequestDispatcher("Operador/agregarCelebridadesPelicula.jsp");
                            view.forward(request, response);
                        }else{
                            session.removeAttribute("PeliculaNueva");
                            pelicula1.setIdPelicula(operadorDao.crearPelicula(pelicula1));
                            operadorDao.asignarCelebridad(pelicula1.getIdPelicula(), idDirector);
                            for(int idActor : listaActores){
                                operadorDao.asignarCelebridad(pelicula1.getIdPelicula(), idActor);
                            }
                            response.sendRedirect("peliculaVisualizacionServlet");
                        }
                    }
                }catch (NumberFormatException e){
                    e.printStackTrace();
                }
                break;
            default:
                response.sendRedirect(request.getContextPath());
        }
    }
}