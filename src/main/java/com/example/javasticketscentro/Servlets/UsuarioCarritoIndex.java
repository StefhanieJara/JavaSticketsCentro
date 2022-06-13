package com.example.javasticketscentro.Servlets;


import com.example.javasticketscentro.Beans.Bcarrito;

import com.example.javasticketscentro.Daos.CarritoDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UsuarioCarritoIndex", value = "/UsuarioCarritoIndex")
public class UsuarioCarritoIndex extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "listar":request.getParameter("a");

        switch (action){
            case "listar" -> {
                ArrayList<Bcarrito> listaFunciones = CarritoDao.listarFuncion();
                request.setAttribute("listaFunciones", listaFunciones);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Cliente/UsuarioCarrito.jsp");
                requestDispatcher.forward(request,response);
            }
            case "listar1" -> {

            }
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar":request.getParameter("a");

        switch (action){
            case "guardar" -> {
                String JobId =request.getParameter("JobId");
            }
            case "actualizar" ->{

            }
        }
    }
}
