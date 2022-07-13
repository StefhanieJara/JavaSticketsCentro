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
            case "editar1" -> {
                int id = Integer.parseInt(request.getParameter("id"));
                BPersona admin = adminDao.buscarOperadorPorId_editar(id);
                request.setAttribute("Admin", admin);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/editarAdmin.jsp");
                requestDispatcher.forward(request, response);
            }
            case "borrar" -> {
                int id = Integer.parseInt(request.getParameter("id"));
                adminDao.eliminarOperador(id);
                System.out.println(id);
                response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet");
            }
            default -> {response.sendRedirect(request.getContextPath());}
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "actualizar" : request.getParameter("action");
        AdminDao adminDao = new AdminDao();
        switch (action) {
            case "actualizar" -> {
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
                adminDao.editarOperadores(operador);
                response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet");


            }
            case "actualizar1" -> {
                String ID = request.getParameter("idPer");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String email = request.getParameter("email");
                String direccion = request.getParameter("direccion");
                String numero = request.getParameter("numCel");
                BPersona admin = new BPersona();
                admin.setIdPer(Integer.parseInt(ID));
                admin.setNombre(nombre);
                admin.setApellido(apellido);
                admin.setEmail(email);
                admin.setDireccion(direccion);
                admin.setNumCel(Integer.parseInt(numero));
                adminDao.editarOperadores(admin);
                response.sendRedirect(request.getContextPath() + "/AdminIndexServlet");




            }

        }

    }
}
