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
                request.setAttribute("listaOperadores",AdminDao.listarOperador());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaOp.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "agregar":
                RequestDispatcher agregarOperadores = request.getRequestDispatcher("/Admin/registrarOperador.jsp");
                agregarOperadores.forward(request, response);
                break;
            case "eliminar":
                idOperador = Integer.parseInt(request.getParameter("id"));
                adminDao.eliminarOperador(idOperador);
                response.sendRedirect(request.getContextPath() + "/ListaOperadorServlet");
                break;
            case "editar":
                idOperador = Integer.parseInt(request.getParameter("id"));
                BPersona operador = adminDao.buscarOperadorPorId(idOperador);
                if (operador != null){
                    request.setAttribute("operador", operador);
                    RequestDispatcher editarOperador = request.getRequestDispatcher("/Admin/editarOperador.jsp");
                    editarOperador.forward(request, response);
                }else{
                    response.sendRedirect(request.getContextPath()+"/ListaOperadorServlet");
                }
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
                String foto = request.getParameter("foto");
                int dni = Integer.parseInt(request.getParameter("dni"));
                int numCel = Integer.parseInt(request.getParameter("numCel"));
                String usuario = request.getParameter("usuario");
                String contrasenia = request.getParameter("contrasenia");
                String email = request.getParameter("email");
                String direccion = request.getParameter("direccion");
                String fecha_Nc = request.getParameter("fechaNac");
                adminDao.anadirOperadores(nombre, dni,apellido, numCel, foto, fecha_Nc, email, usuario, contrasenia, direccion, rol);
                response.sendRedirect(request.getContextPath()+"/ListaOperadorServlet");
                break;
            case "actualizar":
                BPersona operador = leerParametros(request);
                adminDao.editarOperadores(operador);
                response.sendRedirect(request.getContextPath()+"/ListaOperadorServlet");
                break;
            case "buscar":
                break;
        }
    }
    public BPersona leerParametros(HttpServletRequest request){
        BPersona operador = new BPersona();
        operador.setNombre(request.getParameter("nombreOperador"));
        operador.setApellido(request.getParameter("apellidoOperador"));
        operador.setRol("Operador");
        String foto = request.getParameter("foto");
        if (foto == null){
            foto = "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg";
        }
        operador.setFoto(foto);
        operador.setDni(Integer.parseInt(request.getParameter("dni")));
        operador.setNumCel(Integer.parseInt(request.getParameter("numCel")));
        operador.setUsuario(request.getParameter("usuario"));
        operador.setContrasenia(request.getParameter("contrasenia"));
        operador.setEmail(request.getParameter("email"));
        operador.setDireccion(request.getParameter("direccion"));
        operador.setFecha_Nc(request.getParameter("fechaNac"));
        operador.setIdPer(Integer.parseInt(request.getParameter("id")));
        return operador;
    }
}
