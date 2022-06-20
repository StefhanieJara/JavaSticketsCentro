package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPelicula;
import com.example.javasticketscentro.Daos.IndexDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "indexServlet", value = "")
public class indexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IndexDao indexDao = new IndexDao();
        ArrayList<BPelicula> listapeliculas = indexDao.listaPeliculas();
        request.setAttribute("Listapeliculas", listapeliculas);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
