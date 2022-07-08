package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.OperadorDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "OperadorFuncionesServlet", value = "/OperadorFuncionesServlet")
public class OperadorFuncionesServlet extends HttpServlet {
    private static int cant_resultFunciones=10;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session= request.getSession();
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        String date= session.getAttribute("fechaFiltro")==null?"":(String)session.getAttribute("fechaFiltro");
        String idSala= session.getAttribute("idSala")==null?"":(String)session.getAttribute("idSala");
        int pagina= session.getAttribute("pagina")==null?1:(int)session.getAttribute("pagina");
        session.removeAttribute("idSala");session.removeAttribute("fechaFiltro");
        OperadorDao operadorDao = new OperadorDao();
        switch (action){
            case "listar" -> {
                request.setAttribute("listaFunciones",operadorDao.listarFunciones(date, idSala, pagina,cant_resultFunciones, true));
                request.setAttribute("pagina", pagina);
                request.setAttribute("fechaFiltro", date);
                request.setAttribute("idSala",idSala);
                int cant_paginas=(int)Math.ceil((double)operadorDao.listarFunciones(date, idSala, pagina,cant_resultFunciones, false).size()/cant_resultFunciones);
                request.setAttribute("cant_paginas", cant_paginas);
                request.setAttribute("salas", operadorDao.listarSalas());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/funcionesVisualizacion.jsp");
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
        switch (action) {
            case "borrar":
                int idFuncion = Integer.parseInt(request.getParameter("idFuncion"));
                operadorDao.deshabilitarFuncion(idFuncion);
                response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                break;
            case "filtrar":
                String date= request.getParameter("fechaFiltro");
                String idSalaStr= request.getParameter("idSala");
                try{
                    int idSala= Integer.parseInt(idSalaStr);
                    if(idSala==-1){
                        session.setAttribute("idSala", "");
                    }else{
                        session.setAttribute("idSala", idSalaStr);
                    }
                    session.setAttribute("fechaFiltro", date);
                    response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                }
                break;
            case "paginar":
                int pagina= Integer.parseInt(request.getParameter("pagina"));
                session.setAttribute("pagina", pagina);
                response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                break;
        }
    }
}
