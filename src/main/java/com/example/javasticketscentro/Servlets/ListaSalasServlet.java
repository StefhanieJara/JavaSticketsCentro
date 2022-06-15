package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Beans.BSala;
import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.CarritoDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ListaSalasServlet", value = "/ListaSalasServlet")
public class ListaSalasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        AdminDao adminDao = new AdminDao();
        switch (action){
            case "listar"->{
                ArrayList<BSala> listaSala = adminDao.listarSala();

                request.setAttribute("listaSala",listaSala);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaSalas.jsp");
                requestDispatcher.forward(request,response);
            }
            case "crear"->{
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorAñadirSala.jsp");
                requestDispatcher.forward(request,response);

            }
            case "eliminar"->{
                String idSalaStr = request.getParameter("id");
                int idSala = Integer.parseInt(idSalaStr);
                adminDao.eliminarSala(idSala);

                response.sendRedirect(request.getContextPath() + "/ListaSalasServlet");
            }
            case "editar"->{
                String idStr = request.getParameter("id");
                int id = Integer.parseInt(idStr);
                BSala bSala = adminDao.buscarSala(id);
                if(bSala != null){
                    request.setAttribute("bSala", bSala);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorEditarSala.jsp");
                    requestDispatcher.forward(request,response);

                }else {
                    response.sendRedirect(request.getContextPath() + "/ListaSalasServlet");
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
        switch (action){
            case "guardar"->{
                try{
                    int numeroSala = Integer.parseInt(numeroSalaStr);
                    int aforo = Integer.parseInt(aforoStr);
                    int elegirSede = adminDao.encontrarIDSede(elegirSedeStr);
                    if(elegirSede!=0){
                        adminDao.anadirSala(elegirSede,aforo,numeroSala);
                    }
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir tipo de dato");
                }
                response.sendRedirect(request.getContextPath()+"/ListaSalasServlet");
            }
            case "editar2"->{
                try{
                    int numeroSala = Integer.parseInt(numeroSalaStr);
                    int aforo = Integer.parseInt(aforoStr);
                    int elegirSede = adminDao.encontrarIDSede(elegirSedeStr);
                    int idSala= Integer.parseInt(request.getParameter("idSala"));
                    if(elegirSede!=0){
                        adminDao.editarSala(elegirSede,aforo,numeroSala, idSala);
                    }
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir tipo de dato");
                }
                response.sendRedirect(request.getContextPath()+"/ListaSalasServlet");
            }
            case "filtrar"->{
                String filtro= request.getParameter("filtro");
                if(!filtro.equals("Selecciona la sede")){
                    request.setAttribute("listaSala",adminDao.filtrarSala(filtro));
                }else{
                    request.setAttribute("listaSala", adminDao.listarSala());
                }
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaSalas.jsp");
                requestDispatcher.forward(request,response);
            }
        }

    }
}