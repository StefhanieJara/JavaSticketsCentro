package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "UsuarioEditaPerfilServlet", value = "/UsuarioEditaPerfilServlet")@MultipartConfig
public class UsuarioEditaPerfilServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDao adminDao= new AdminDao();
        String action= request.getParameter("action")==null? "editarPerfil" : request.getParameter("action");
        switch (action){
            case "editarPerfil":
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Cliente/UsuarioEditaPerfil_Usuario.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "entregarImagen":
                HttpSession session= request.getSession();
                BPersona usuario=(BPersona) session.getAttribute("clienteLog");
                adminDao.mostrarImagen(usuario.getIdPer(), response);
                break;
        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session= request.getSession();
        BPersona persona = (BPersona) session.getAttribute("clienteLog");
        String action = request.getParameter("action") == null ? "actualizar" : request.getParameter("action");
        AdminDao adminDao = new AdminDao();
        switch (action) {
            case "actualizar":
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String direccion = request.getParameter("direccion");
                String numero = request.getParameter("numCel");
                String usuario= request.getParameter("usuario");

                try{
                    int numero1= Integer.parseInt(numero);
                    if((numero1/100000000) ==9){
                        persona.setNombre(nombre);
                        persona.setApellido(apellido);
                        persona.setDireccion(direccion);
                        persona.setNumCel(Integer.parseInt(numero));
                        persona.setUsuario(usuario);
                        adminDao.editarUsuario(persona);
                    }else{
                        session.setAttribute("msg", "errorNum9");
                    }
                }catch (NumberFormatException e){
                    session.setAttribute("msg", "errortexto");
                }
                response.sendRedirect(request.getContextPath()+"/UsuarioEditaPerfilServlet");
                break;
            case "actualizarFoto":
                Part part= request.getPart("photoUrl");
                InputStream foto= part.getInputStream();
                adminDao.editarFoto(persona.getIdPer(), foto);
                response.sendRedirect(request.getContextPath()+"/UsuarioEditaPerfilServlet");
                break;
        }

    }
}
