package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.AdminDao;

import javax.crypto.spec.PSource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLConnection;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ADServlet", urlPatterns ={"/ADServlet"} )
public class ADServlet extends HttpServlet {
    private int cant_resultClientes=12;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        AdminDao adminDao = new AdminDao();
        int pagina= request.getParameter("pagina") == null ? 1 :Integer.parseInt(request.getParameter("pagina"));
        String filtro = "";
        int idCelebridad = 0;
        switch (action){
            case "listar":
                int cant_paginas=(int)Math.ceil((double)adminDao.listarCelebridad(filtro, false, cant_resultClientes, pagina).size()/cant_resultClientes);
                request.setAttribute("cant_paginas", cant_paginas);
                request.setAttribute("pagina", pagina);
                request.setAttribute("filtro", filtro);
                ArrayList<BCelebridad> listaCelebridades=  adminDao.listarCelebridad(filtro, true, cant_resultClientes, pagina);
                request.setAttribute("listaCelebridades",listaCelebridades);
                ArrayList<Boolean> puedeElimimar= new ArrayList<>();
                try {
                for(BCelebridad c:listaCelebridades){
                    if(adminDao.perteneceAPelicula(c.getIdCelebridad())){
                        puedeElimimar.add(false);
                    }else{
                        puedeElimimar.add(true);
                    }
                }
                    request.setAttribute("puedeElimimar", puedeElimimar);
                    RequestDispatcher listarActDir = request.getRequestDispatcher("/Admin/administradorListaAD.jsp");
                    listarActDir.forward(request, response);

                } catch (SQLException e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath());
                }
                break;
            case "agregar":
                RequestDispatcher agregarActDir = request.getRequestDispatcher("/Admin/registrarCelebridad.jsp");
                agregarActDir.forward(request, response);
                break;
            case "eliminar":
                idCelebridad = Integer.parseInt(request.getParameter("id"));
                adminDao.eliminarCelebridad(idCelebridad);
                response.sendRedirect(request.getContextPath() + "/ADServlet");
                break;
            case "editar":
                if(request.getSession().getAttribute("idCelebridad")!=null){
                    idCelebridad=(Integer)request.getSession().getAttribute("idCelebridad");
                    BCelebridad c=adminDao.buscarPorId(idCelebridad);
                    request.setAttribute("celebridad", c);
                    RequestDispatcher editarCelebridad = request.getRequestDispatcher("/Admin/editarCelebridad.jsp");
                    editarCelebridad.forward(request, response);
                }else{
                    response.sendRedirect(request.getContextPath());
                }
                break;
            default:
                response.sendRedirect(request.getContextPath());
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        String nombre = request.getParameter("nombresCeleb");
        String apellido = request.getParameter("apellidosCeleb");
        String rol = request.getParameter("rol");
        String URLFoto = request.getParameter("photoUrl");
        AdminDao adminDao = new AdminDao();
        switch (action){
            case "crear":
                if  (URLFoto == null){
                    URLFoto="https://p16-va-default.akamaized.net/img/musically-maliva-obj/1665282759496710~c5_720x720.jpeg";
                }else if (URLFoto.equals("")){
                    URLFoto="https://p16-va-default.akamaized.net/img/musically-maliva-obj/1665282759496710~c5_720x720.jpeg";
                }
                if(nombre.equals("") || apellido.equals("") || rol==null){
                    response.sendRedirect(request.getContextPath()+"/ADServlet?action=agregar");
                }else{
                    adminDao.crearCelebridad(nombre, apellido, rol, URLFoto);
                    response.sendRedirect(request.getContextPath()+"/ADServlet?action=listar");
                }
                break;
            case "actualizar":
                personalServlet soloLetras = new personalServlet();
                int id = Integer.parseInt(request.getParameter("id"));
                BCelebridad celebr = new BCelebridad();
                celebr.setIdCelebridad(id);
                celebr.setNombre(nombre);
                celebr.setApellido(apellido);
                if(soloLetras.esSoloLetras(nombre)&&soloLetras.esSoloLetras(apellido)){
                    if  (URLFoto == null){
                        URLFoto="mantener";
                    }else if (URLFoto.equals("")){
                        URLFoto="mantener";
                    }
                    celebr.setFoto(URLFoto);
                    if(celebr.getApellido().equals("") || celebr.getNombre().equals("")){
                        request.setAttribute("celebridad", adminDao.buscarPorId(celebr.getIdCelebridad()));
                        RequestDispatcher editarCelebridad = request.getRequestDispatcher("/Admin/editarCelebridad.jsp");
                        editarCelebridad.forward(request, response);
                    }else{
                        adminDao.editarCelebridad(celebr);
                        response.sendRedirect(request.getContextPath()+"/ADServlet");
                    }
                }else{
                    request.getSession().setAttribute("msg","");
                    request.getSession().setAttribute("idCelebridad",id);
                    response.sendRedirect(request.getContextPath()+"/ADServlet?action=editar");
                }

                break;
            case "buscar":
                int pagina= Integer.parseInt(request.getParameter("pagina"));
                String filtro= request.getParameter("filtro");
                int cant_paginas=(int)Math.ceil((double)adminDao.listarCelebridad(filtro, false, cant_resultClientes, pagina).size()/cant_resultClientes);
                ArrayList<BCelebridad> celebridads= adminDao.listarCelebridad(filtro, true, cant_resultClientes, pagina);
                request.setAttribute("listaCelebridades", celebridads);
                request.setAttribute("pagina", pagina);
                request.setAttribute("cant_paginas", cant_paginas);
                request.setAttribute("filtro", filtro);

                ArrayList<Boolean> puedeElimimar= new ArrayList<>();
                try {
                    for(BCelebridad c:celebridads){
                        if(adminDao.perteneceAPelicula(c.getIdCelebridad())){
                            puedeElimimar.add(false);
                        }else{
                            puedeElimimar.add(true);
                        }
                    }
                    request.setAttribute("puedeElimimar", puedeElimimar);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaAD.jsp");
                    requestDispatcher.forward(request, response);

                } catch (SQLException e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath());
                }
                break;
            case "editar":
                int idCelebridad = Integer.parseInt(request.getParameter("idCelebridad"));
                BCelebridad celebridad = adminDao.buscarPorId(idCelebridad);
                if (celebridad != null){
                    request.setAttribute("celebridad", celebridad);
                    RequestDispatcher editarCelebridad = request.getRequestDispatcher("/Admin/editarCelebridad.jsp");
                    editarCelebridad.forward(request, response);
                }else{
                    response.sendRedirect(request.getContextPath()+"/ADServlet");
                }
                break;
        }
    }

}
