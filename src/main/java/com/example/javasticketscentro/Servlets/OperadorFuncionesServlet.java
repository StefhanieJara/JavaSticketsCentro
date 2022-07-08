package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.OperadorDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "OperadorFuncionesServlet", value = "/OperadorFuncionesServlet")
public class OperadorFuncionesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        OperadorDao operadorDao = new OperadorDao();
        switch (action){
            case "listar" -> {
                request.setAttribute("listaFunciones",operadorDao.listarFunciones());
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
        RequestDispatcher requestDispatcher;
        switch (action) {
            case "borrar":
                int idFuncion = Integer.parseInt(request.getParameter("idFuncion"));
                operadorDao.deshabilitarFuncion(idFuncion);
                response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                break;
        }
    }
}
