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
        ArrayList<String> filtros= new ArrayList<>();
        filtros.add("");
        filtros.add("");
        filtros.add("");
        filtros.add("");
        int pagina= request.getParameter("pagina") == null ? 1 :Integer.parseInt(request.getParameter("pagina"));

        switch (action){
            case "listar" -> {
                String nombreBuscar = request.getParameter("nombreBuscar");
                String apellidoBuscar = request.getParameter("apellidoBuscar");
                String dniBuscar = request.getParameter("dniBuscar");
                String codigoBuscar =request.getParameter("codigoBuscar");
                request.setAttribute("listaClientes", adminDao.listaCliente(nombreBuscar, apellidoBuscar, dniBuscar, codigoBuscar, pagina, cant_resultClientes, true));
                int cant_paginas=(int)Math.ceil((double)adminDao.listaCliente(nombreBuscar, apellidoBuscar, dniBuscar, codigoBuscar, pagina, cant_resultClientes, false).size()/cant_resultClientes);
                request.setAttribute("cant_paginas", cant_paginas);
                request.setAttribute("pagina", pagina);
                request.setAttribute("filtros", filtros);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaCl.jsp");
                requestDispatcher.forward(request,response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        AdminDao adminDao= new AdminDao();
        ArrayList<String> filtros= new ArrayList<>();
        switch (action){
            case "buscar" -> {
                String nombreBuscar = request.getParameter("nombreBuscar");
                filtros.add(nombreBuscar);
                String apellidoBuscar = request.getParameter("apellidoBuscar");
                filtros.add(apellidoBuscar);
                String dniBuscar = request.getParameter("dniBuscar");
                filtros.add(dniBuscar);
                String codigoBuscar =request.getParameter("codigoBuscar");
                filtros.add(codigoBuscar);
                int pagina= Integer.parseInt(request.getParameter("pagina"));
                int cant_paginas=(int)Math.ceil((double)adminDao.listaCliente(nombreBuscar, apellidoBuscar, dniBuscar, codigoBuscar, pagina, cant_resultClientes, false).size()/cant_resultClientes);
                request.setAttribute("listaClientes", adminDao.listaCliente(nombreBuscar, apellidoBuscar, dniBuscar, codigoBuscar, pagina, cant_resultClientes, true));
                request.setAttribute("pagina", pagina);
                request.setAttribute("cant_paginas", cant_paginas);
                request.setAttribute("filtros", filtros);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaCl.jsp");
                requestDispatcher.forward(request, response);
            }
        }
    }
}
