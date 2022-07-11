package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Daos.LoginDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UsuarioregistrorealServlet", value = "/UsuarioregistrorealServlet")
public class UsuarioregistrorealServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "registro" : request.getParameter("action");
        RequestDispatcher view;
        switch (action) {
            case "registro":
                view= request.getRequestDispatcher("Cliente/Usuarioregistroverdad.jsp");
                view.forward(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath());
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "registrar" : request.getParameter("action");
        RequestDispatcher view;
        LoginDao loginDao= new LoginDao();
        String nombre=request.getParameter("nombre");
        String apellido=request.getParameter("apellido");
        String email= request.getParameter("email");
        String pass0= request.getParameter("pass0");
        String pass= request.getParameter("pass");
        String codigostr=request.getParameter("codigo_PUCP");
        String dnistr= request.getParameter("dni");
        String numeroTelefonostr= request.getParameter("numeroTelefono");
        String fechaNacimiento= request.getParameter("fechaNacimiento");
        HttpSession session= request.getSession();
        switch (action){
            case "registrar":
                if(loginDao.existeEmail(email)){
                    session.setAttribute("error","emailExiste");
                    response.sendRedirect(request.getContextPath()+"/UsuarioregistrorealServlet");
                }else{
                    if(loginDao.tiene_numeros(nombre)==0){
                        if(loginDao.tiene_numeros(apellido)==0){
                            if(pass.equals(pass0)){
                                int dni= Integer.parseInt(dnistr);
                                int numTele= Integer.parseInt(numeroTelefonostr);
                                if(((int)Math.log10(dni)+1)==8){
                                    if(((int)Math.log10(numTele)+1)==9){
                                        if(codigostr.equals("")){
                                            int codigo=0;
                                            try {
                                                loginDao.crearCliente(nombre,apellido,email,pass,codigo, dni,numTele,fechaNacimiento);
                                                session.invalidate();
                                                view= request.getRequestDispatcher("Cliente/UsuarioconfirmarRegistro.jsp");
                                                view.forward(request, response);
                                            } catch (SQLException e) {
                                                e.printStackTrace();
                                                session.setAttribute("error","errorSQL");
                                                response.sendRedirect(request.getContextPath()+"/UsuarioregistrorealServlet");
                                            }
                                        }else{
                                            int codigo= Integer.parseInt(codigostr);
                                            if(((int)Math.log10(codigo)+1)==8){
                                                try {
                                                    loginDao.crearCliente(nombre,apellido,email,pass,codigo, dni,numTele,fechaNacimiento);
                                                    session.invalidate();
                                                    view= request.getRequestDispatcher("Cliente/UsuarioconfirmarRegistro.jsp");
                                                    view.forward(request, response);
                                                } catch (SQLException e) {
                                                    e.printStackTrace();
                                                    session.setAttribute("error","errorSQL");
                                                    response.sendRedirect(request.getContextPath()+"/UsuarioregistrorealServlet");
                                                }
                                            }else{
                                                session.setAttribute("error","codigoIncorrecto");
                                                response.sendRedirect(request.getContextPath()+"/UsuarioregistrorealServlet");
                                            }
                                        }
                                    }else{
                                        session.setAttribute("error","telefoIncorrecto");
                                        response.sendRedirect(request.getContextPath()+"/UsuarioregistrorealServlet");
                                    }
                                }else{
                                    session.setAttribute("error","dniIncorrecto");
                                    response.sendRedirect(request.getContextPath()+"/UsuarioregistrorealServlet");
                                }
                            }else{
                                session.setAttribute("error","passNoCoinciden");
                                response.sendRedirect(request.getContextPath()+"/UsuarioregistrorealServlet");
                            }
                        }
                        else {
                            session.setAttribute("error","apellidoIncorrecto");
                            response.sendRedirect(request.getContextPath()+"/UsuarioregistrorealServlet");
                        }
                    }
                    else{
                        session.setAttribute("error","nombreIncorrecto");
                        response.sendRedirect(request.getContextPath()+"/UsuarioregistrorealServlet");

                    }
                }
                break;
        }
    }
}
