package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ListarOperadorServlet", value = "/ListarOperadorServlet")
public class ListarOperadorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<BPersona> listaOperadores = AdminDao.listarOperador();

        request.setAttribute("listaOperadores",listaOperadores);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaOp.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
