package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ADServlet", urlPatterns ={"/ADServlet"} )
public class ADServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<BCelebridad> listaCelebridades = AdminDao.listarCelebridad();

        request.setAttribute("listaCelebridades",listaCelebridades);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaAD.jsp");
        requestDispatcher.forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
