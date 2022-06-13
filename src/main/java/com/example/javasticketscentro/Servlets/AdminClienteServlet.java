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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");

        switch (action){
            case "listar" -> {
                ArrayList<BPersona> listaClientes = AdminDao.listarCliente();
                request.setAttribute("listaClientes", listaClientes);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaCl.jsp");
                requestDispatcher.forward(request,response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");

        switch (action){
            case "buscar" -> {
                String nombreBuscar = request.getParameter("nombreBuscar");
                String apellidoBuscar = request.getParameter("apellidoBuscar");
                String dniBuscar = request.getParameter("dniBuscar");
                String codigoBuscar = request.getParameter("codigoBuscar");
                request.setAttribute("listaClientes", AdminDao.buscarPorNombreCl(nombreBuscar));


                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaCl");
                requestDispatcher.forward(request, response);
            }
        }
    }
}
