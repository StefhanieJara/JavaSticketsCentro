package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UsuarioEditaPerfilServlet", value = "/UsuarioEditaPerfilServlet")
public class UsuarioEditaPerfilServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        AdminDao adminDao = new AdminDao();
        BPersona usuario = adminDao.buscarUsuarioPorId(id);
        request.setAttribute("Usuario", usuario);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Cliente/UsuarioEditaPerfil_Usuario.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action") == null ? "actualizar" : request.getParameter("a");
        AdminDao adminDao = new AdminDao();
        switch (action) {
            case "actualizar" -> {
                BPersona usuario = leerParametrosRequest(request);
                adminDao.editarUsuario(usuario);
                response.sendRedirect(request.getContextPath()+" ");
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
        String usuario = request.getParameter("usuario");
        String codigo = request.getParameter("codigo");

        BPersona usuarioo = new BPersona();
        usuarioo.setIdPer(Integer.parseInt(ID));
        usuarioo.setNombre(nombre);
        usuarioo.setApellido(apellido);
        usuarioo.setEmail(email);
        usuarioo.setDireccion(direccion);
        usuarioo.setNumCel(Integer.parseInt(numero));
        usuarioo.setUsuario(usuario);
        usuarioo.setCodigoPUCP(Integer.parseInt(codigo));


        return usuarioo;
    }
}
