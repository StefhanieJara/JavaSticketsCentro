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
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        AdminDao adminDao = new AdminDao();

        switch (action){
            case "listar":
                request.setAttribute("listaActDir", adminDao.listarCelebridad());
                RequestDispatcher listarActDir = request.getRequestDispatcher("Admin/administradorListaAD.jsp");
                listarActDir.forward(request, response);
                break;
            case "agregar":
                RequestDispatcher agregarActDir = request.getRequestDispatcher("Admin/registrarCelebridad.jsp");
                agregarActDir.forward(request, response);
                break;
            case "eliminar":
                String idCelebridad = request.getParameter("id");
                adminDao.eliminarCelebridad();
                response.sendRedirect(request.getContextPath() + "/ADServlet");
                break;
            case "editar":
                String iCelebridad = request.getParameter("id");
                adminDao.
                break;
        }

        ArrayList<BCelebridad> listaCelebridades = AdminDao.listarCelebridad();

        request.setAttribute("listaCelebridades",listaCelebridades);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaAD.jsp");
        requestDispatcher.forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
