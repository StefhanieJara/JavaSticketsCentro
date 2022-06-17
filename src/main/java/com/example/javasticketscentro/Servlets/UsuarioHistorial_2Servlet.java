package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.Bhistorial;
import com.example.javasticketscentro.Daos.HistorialDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UsuarioHistorial_2Servlet", value = "/UsuarioHistorial_2Servlet")
public class UsuarioHistorial_2Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        HistorialDao historialDao = new HistorialDao();
        switch (action){
            case "listar" -> {
                ArrayList<Bhistorial> listadetickets = HistorialDao.listaTickets();

                request.setAttribute("lista", listadetickets);

                RequestDispatcher view = request.getRequestDispatcher("/Cliente/UsuarioHistorial_2.jsp");
                view.forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
