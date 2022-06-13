package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminClienteServlet", value = "/AdminClienteServlet")
public class AdminClienteServlet extends HttpServlet {
    private static int cant_resultClientes=5;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        AdminDao adminDao=new AdminDao();
        switch (action){
            case "listar" -> {
                String nombreBuscar = request.getParameter("nombreBuscar");
                String apellidoBuscar = request.getParameter("apellidoBuscar");

                String dniBuscar = request.getParameter("dniBuscar");
                String codigoBuscar =request.getParameter("codigoBuscar");
                request.setAttribute("listaClientes", adminDao.listaCliente(nombreBuscar, apellidoBuscar, dniBuscar, codigoBuscar, 1, cant_resultClientes));
                request.setAttribute("cant_muestras", cant_resultClientes);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaCl.jsp");
                requestDispatcher.forward(request,response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        AdminDao adminDao= new AdminDao();
        switch (action){
            case "buscar" -> {
                String nombreBuscar = request.getParameter("nombreBuscar");
                String apellidoBuscar = request.getParameter("apellidoBuscar");

                String dniBuscar = request.getParameter("dniBuscar");
                String codigoBuscar =request.getParameter("codigoBuscar");

                request.setAttribute("listaClientes", adminDao.listaCliente(nombreBuscar, apellidoBuscar, dniBuscar, codigoBuscar, 1, cant_resultClientes));
                request.setAttribute("cant_muestras", cant_resultClientes);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaCl.jsp");
                requestDispatcher.forward(request, response);
            }
        }
    }
}
