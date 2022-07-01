package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Daos.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminIndexServlet", value = "/AdminIndexServlet")
public class AdminIndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "index" : request.getParameter("action");
        switch (action) {
            case "index":
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/adminIndex.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "gestionSalas":
                response.sendRedirect(request.getContextPath() + "/AdminListarSalasServlet");
                break;
            case "gestionCelebridad":
                response.sendRedirect(request.getContextPath() + "/ADServlet");
                break;
            case "gestionOperadores":
                response.sendRedirect(request.getContextPath()+ "/ListarOperadorServlet");
                break;
            case "gestionClientes":
                response.sendRedirect(request.getContextPath()+ "/AdminClienteServlet");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

