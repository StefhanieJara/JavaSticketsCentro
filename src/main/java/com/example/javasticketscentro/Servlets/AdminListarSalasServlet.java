package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BSala;
import com.example.javasticketscentro.Daos.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminListarSalasServlet", value = "/AdminListarSalasServlet")
public class AdminListarSalasServlet extends HttpServlet {
    private static int cant_resultClientes=5;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        int pagina= request.getParameter("pagina") == null ? 1 :Integer.parseInt(request.getParameter("pagina"));

        AdminDao adminDao = new AdminDao();
        switch (action){
            case "listar"->{
                request.setAttribute("listaSala",adminDao.filtrarSala("", true, cant_resultClientes, pagina));
                request.setAttribute("listaSedes", adminDao.listarSedes());
                request.setAttribute("filtro", "Selecciona la sede");
                int cant_paginas=(int)Math.ceil((double)adminDao.filtrarSala("", false, cant_resultClientes, pagina).size()/cant_resultClientes);
                request.setAttribute("cant_paginas", cant_paginas);
                request.setAttribute("pagina", pagina);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaSalas.jsp");
                requestDispatcher.forward(request,response);
            }
            case "crear"->{
                request.setAttribute("sedes", adminDao.listarSedes());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorAñadirSala.jsp");
                requestDispatcher.forward(request,response);

            }
            case "eliminar"->{
                String idSalaStr = request.getParameter("id");
                int idSala = Integer.parseInt(idSalaStr);
                adminDao.eliminarSala(idSala);
                response.sendRedirect(request.getContextPath() + "/AdminListarSalasServlet");
            }
            case "editar"->{
                String idStr = request.getParameter("id");
                try{
                    int id = Integer.parseInt(idStr);
                    BSala bSala = adminDao.buscarSala(id);
                    if(bSala != null){
                        request.setAttribute("bSala", bSala);
                        request.setAttribute("sedes", adminDao.listarSedes());
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorEditarSala.jsp");
                        requestDispatcher.forward(request,response);
                    }else {
                        response.sendRedirect(request.getContextPath() + "/AdminListarSalasServlet");
                    }
                }catch (NumberFormatException e){
                    System.out.println("ID debe ser entero");
                    response.sendRedirect(request.getContextPath() + "/AdminListarSalasServlet");
                }
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        AdminDao adminDao = new AdminDao();
        String numeroSalaStr;
        String aforoStr;
        String elegirSedeStr;
        numeroSalaStr = request.getParameter("numeroSala");
        aforoStr = request.getParameter("aforo");
        elegirSedeStr = request.getParameter("elegirSede");
        int pagina= Integer.parseInt(request.getParameter("pagina"));
        switch (action){
            case "guardar"->{
                try{
                    int numeroSala = Integer.parseInt(numeroSalaStr);
                    int aforo = Integer.parseInt(aforoStr);
                    int elegirSede = adminDao.encontrarIDSede(elegirSedeStr);
                    if(elegirSede!=0){
                        adminDao.anadirSala(elegirSede,aforo,numeroSala);
                        response.sendRedirect(request.getContextPath()+"/AdminListarSalasServlet");
                    }else{
                        response.sendRedirect(request.getContextPath()+"/AdminListarSalasServlet?action=crear");
                    }
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir tipo de dato");
                }

            }
            case "editar2"->{
                int idSala= Integer.parseInt(request.getParameter("idSala"));
                try{
                    int numeroSala = Integer.parseInt(numeroSalaStr);
                    int aforo = Integer.parseInt(aforoStr);
                    int elegirSede = adminDao.encontrarIDSede(elegirSedeStr);
                    if(elegirSede!=0){
                        adminDao.editarSala(elegirSede,aforo,numeroSala, idSala);
                        response.sendRedirect(request.getContextPath()+"/AdminListarSalasServlet");
                    }
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir tipo de dato");
                    request.setAttribute("bSala", adminDao.buscarSala(idSala));
                    request.setAttribute("sedes", adminDao.listarSedes());
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorEditarSala.jsp");
                    requestDispatcher.forward(request,response);
                }
            }
            case "filtrar"->{
                String filtro= request.getParameter("filtro");
                if(!filtro.equals("Selecciona la sede")){
                    int cant_paginas=(int)Math.ceil((double)adminDao.filtrarSala(filtro, false, cant_resultClientes, pagina).size()/cant_resultClientes);
                    request.setAttribute("listaSala",adminDao.filtrarSala(filtro, true, cant_resultClientes, pagina));
                    request.setAttribute("cant_paginas", cant_paginas);
                }else{
                    int cant_paginas=(int)Math.ceil((double)adminDao.filtrarSala("", false, cant_resultClientes, pagina).size()/cant_resultClientes);
                    request.setAttribute("listaSala", adminDao.filtrarSala("", true, cant_resultClientes, pagina));
                    request.setAttribute("cant_paginas", cant_paginas);
                }
                request.setAttribute("pagina", pagina);
                request.setAttribute("listaSedes", adminDao.listarSedes());
                request.setAttribute("filtro", filtro);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaSalas.jsp");
                requestDispatcher.forward(request,response);
            }
        }
    }
}
