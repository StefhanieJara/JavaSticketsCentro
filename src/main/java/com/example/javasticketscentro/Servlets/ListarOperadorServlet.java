package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

@WebServlet(name = "ListarOperadorServlet", value = "/ListarOperadorServlet")
public class ListarOperadorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        AdminDao adminDao = new AdminDao();
        int idOperador = 0;
        switch (action){
            case "listar":
                request.setAttribute("listaOperadores",adminDao.listarOperador());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaOp.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "agregar":
                RequestDispatcher agregarOperadores = request.getRequestDispatcher("/Admin/registrarOperador.jsp");
                agregarOperadores.forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");

        AdminDao adminDao = new AdminDao();

        switch (action){
            case "crear":
                String nombre = request.getParameter("nombreOperador");
                String apellido = request.getParameter("apellidoOperador");
                String rol = "Operador";
                //String foto = request.getParameter("foto");
                String foto = "xd";
                int dni = Integer.parseInt(request.getParameter("dni"));
                int numCel = Integer.parseInt(request.getParameter("numCel"));
                String usuario = request.getParameter("usuario");
                String contrasenia = request.getParameter("contrasenia");
                String email = request.getParameter("email");
                String direccion = request.getParameter("direccion");
                String fecha_Nc = request.getParameter("fechaNac");
                adminDao.anadirOperadores(nombre, dni,apellido, numCel, foto, fecha_Nc, email, usuario, contrasenia, direccion, rol);
                response.sendRedirect(request.getContextPath()+"/ListarOperadorServlet");
                break;
            case "buscar":
                break;
        }
    }

}
