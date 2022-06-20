package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPelicula;
import com.example.javasticketscentro.Beans.BSede;
import com.example.javasticketscentro.Daos.AdminDao;
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
        AdminDao adminDao = new AdminDao();
        ArrayList<BPelicula> listapeliculas = indexDao.listaPeliculas();
        ArrayList<BSede> listaSedes = adminDao.listarSedes();
        request.setAttribute("Listapeliculas", listapeliculas);
        request.setAttribute("ListaSedes", listaSedes);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
