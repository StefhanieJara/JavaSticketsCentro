package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditarOperadorServlet", value = "/EditarOperadorServlet")
public class EditarOperadorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("a") == null ? "editar" : request.getParameter("a");
        AdminDao adminDao = new AdminDao();
        switch (action) {
            case "editar" -> {
                int id = Integer.parseInt(request.getParameter("id"));
                BPersona operador = adminDao.buscarOperadorPorId_editar(id);
                request.setAttribute("Operador", operador);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/editarOperador.jsp");
                requestDispatcher.forward(request, response);
            }
            case "borrar" -> {
                int id = Integer.parseInt(request.getParameter("id"));
                adminDao.eliminarOperador(id);
                System.out.println(id);
                response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action") == null ? "actualizar" : request.getParameter("a");
        AdminDao adminDao = new AdminDao();
        switch (action) {
            case "actualizar" -> {
                BPersona operador = leerParametrosRequest(request);
                adminDao.editarOperadores(operador);
                response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet");
            }

        }

    }
    public BPersona leerParametrosRequest(HttpServletRequest request) {
        String ID = request.getParameter("idPer");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String direccion = request.getParameter("direccion");
        String numero = request.getParameter("numCel");

        BPersona operador = new BPersona();
        operador.setIdPer(Integer.parseInt(ID));
        operador.setNombre(nombre);
        operador.setApellido(apellido);
        operador.setEmail(email);
        operador.setDireccion(direccion);
        operador.setNumCel(Integer.parseInt(numero));

        return operador;
    }
}
