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
            default -> {response.sendRedirect(request.getContextPath());}
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "actualizar" : request.getParameter("a");
        AdminDao adminDao = new AdminDao();
        HttpSession session= request.getSession();
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
                if(numero.charAt(0) == '-'){
                    session.setAttribute("error","negativo");
                    response.sendRedirect(request.getContextPath()+"/EditarOperadorServlet?id="+operador.getIdPer());
                }else{
                    if(numero.charAt(0) == '9'){
                    try{operador.setNumCel(Integer.parseInt(numero));
                    } catch (NumberFormatException e) {
                        session.setAttribute("error","digito");
                    }
                        if(((int)Math.log10(operador.getNumCel())+1)==9){
                        adminDao.editarOperadores(operador);
                        response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet");
                    }else{
                        session.setAttribute("error","digito");
                        response.sendRedirect(request.getContextPath()+"/EditarOperadorServlet?id="+operador.getIdPer());
                    }
                }else{
                        session.setAttribute("error","comienzo");
                        response.sendRedirect(request.getContextPath()+"/EditarOperadorServlet?id="+operador.getIdPer());
                    }

                }
            }

        }

    }
}
