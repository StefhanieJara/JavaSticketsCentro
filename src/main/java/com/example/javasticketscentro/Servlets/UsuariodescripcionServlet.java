package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Daos.PeliculaDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UsuariodescripcionServlet", value = "/UsuariodescripcionServlet")
public class UsuariodescripcionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id") == null ? "determinado" : request.getParameter("id");
        RequestDispatcher requestDispatcher;
        switch (id){
            case "determinado":
                requestDispatcher = request.getRequestDispatcher("Cliente/UsuariodescripcionPeli.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "8":
                PeliculaDao peliculaDao= new PeliculaDao();
                request.setAttribute("pelicula", peliculaDao.devolverPelicula(id));
                request.setAttribute("funciones", peliculaDao.detectarFunciones(id));
                requestDispatcher = request.getRequestDispatcher("Cliente/UsuariodescripcionPeli.jsp");
                requestDispatcher.forward(request,response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}