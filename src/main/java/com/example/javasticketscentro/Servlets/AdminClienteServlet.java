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
                int pagina=1;
                String dniBuscar = request.getParameter("dniBuscar");
                String codigoBuscar =request.getParameter("codigoBuscar");
                request.setAttribute("total", adminDao.obtenerTotalResultados(nombreBuscar, apellidoBuscar, dniBuscar, codigoBuscar));
                request.setAttribute("listaClientes", adminDao.listaCliente(nombreBuscar, apellidoBuscar, dniBuscar, codigoBuscar, pagina, cant_resultClientes));
                request.setAttribute("cant_muestras", cant_resultClientes);
                request.setAttribute("pagina", pagina);
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
                int pagina=1;
                request.setAttribute("listaClientes", adminDao.listaCliente(nombreBuscar, apellidoBuscar, dniBuscar, codigoBuscar, pagina, cant_resultClientes));
                request.setAttribute("cant_muestras", cant_resultClientes);
                request.setAttribute("pagina", pagina);
                request.setAttribute("total", adminDao.obtenerTotalResultados(nombreBuscar, apellidoBuscar, dniBuscar, codigoBuscar));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaCl.jsp");
                requestDispatcher.forward(request, response);
            }
        }
    }
}
