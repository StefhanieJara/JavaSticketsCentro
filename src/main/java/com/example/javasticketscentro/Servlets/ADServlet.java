package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.AdminDao;

import javax.crypto.spec.PSource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ADServlet", urlPatterns ={"/ADServlet"} )
public class ADServlet extends HttpServlet {
    private int cant_resultClientes=5;
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
                request.setAttribute("listaCelebridades", adminDao.listarCelebridad(filtro, true, cant_resultClientes, pagina));
                RequestDispatcher listarActDir = request.getRequestDispatcher("/Admin/administradorListaAD.jsp");
                listarActDir.forward(request, response);
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
                idCelebridad = Integer.parseInt(request.getParameter("id"));
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        AdminDao adminDao = new AdminDao();
        switch (action){
            case "crear":
                String nombre = request.getParameter("nombresCeleb");
                String apellido = request.getParameter("apellidosCeleb");
                String rol = request.getParameter("rol");
                String foto = request.getParameter("foto");
                if(nombre=="" || apellido=="" || rol==null){
                    response.sendRedirect(request.getContextPath()+"/ADServlet?action=agregar");
                }else{
                    if (foto == null){
                        foto = "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg";
                    }
                    adminDao.crearCelebridad(nombre, apellido, rol, foto);
                    response.sendRedirect(request.getContextPath()+"/ADServlet");
                }
                break;
            case "actualizar":
                BCelebridad bCelebridad = leerParametros(request);
                if(bCelebridad.getApellido().equals("") || bCelebridad.getNombre().equals("")){
                    request.setAttribute("celebridad", adminDao.buscarPorId(bCelebridad.getIdCelebridad()));
                    RequestDispatcher editarCelebridad = request.getRequestDispatcher("/Admin/editarCelebridad.jsp");
                    editarCelebridad.forward(request, response);
                }else{
                    adminDao.editarCelebridad(bCelebridad);
                    response.sendRedirect(request.getContextPath()+"/ADServlet");
                }
                break;
            case "buscar":
                int pagina= Integer.parseInt(request.getParameter("pagina"));
                String filtro= request.getParameter("filtro");
                int cant_paginas=(int)Math.ceil((double)adminDao.listarCelebridad(filtro, false, cant_resultClientes, pagina).size()/cant_resultClientes);
                request.setAttribute("listaCelebridades", adminDao.listarCelebridad(filtro, true, cant_resultClientes, pagina));
                request.setAttribute("pagina", pagina);
                request.setAttribute("cant_paginas", cant_paginas);
                request.setAttribute("filtro", filtro);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaAD.jsp");
                requestDispatcher.forward(request, response);
                break;
        }
    }

    public BCelebridad leerParametros(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombresCeleb");
        String apellido = request.getParameter("apellidosCeleb");
        String rol = request.getParameter("rol");
        String foto = request.getParameter("foto");
        if (foto == null){
            foto = "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg";
        }
        BCelebridad celebr = new BCelebridad();
        celebr.setIdCelebridad(id);
        celebr.setNombre(nombre);
        celebr.setApellido(apellido);
        celebr.setRol(rol);
        celebr.setFoto(foto);
        return celebr;
    }
}