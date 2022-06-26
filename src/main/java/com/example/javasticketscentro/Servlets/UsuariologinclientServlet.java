package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.LoginDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UsuariologinclientServlet", value = "/UsuariologinclientServlet")
public class UsuariologinclientServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action")==null? "loginform" : request.getParameter("action");
        RequestDispatcher view;
        switch (action){
            case "loginform":
                view= request.getRequestDispatcher("Cliente/Usuariologin_client.jsp");
                view.forward(request,response);
                break;
            case "logout":
                HttpSession session=request.getSession();
                session.invalidate();
                response.sendRedirect(request.getContextPath());
                break;
            case "olvidoContra":
                request.setAttribute("conf", "");
                request.setAttribute("email", "");
                view= request.getRequestDispatcher("Cliente/UsuariorecuperarContra.jsp");
                view.forward(request,response);
                break;
            case "cambioContraexitoso":
                view= request.getRequestDispatcher("Cliente/UsuarioconfirmarContra.jsp");
                view.forward(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user= request.getParameter("user");
        String password= request.getParameter("password");
        String action= request.getParameter("action")==null? "login" : request.getParameter("action");
        String email;

        LoginDao loginDao= new LoginDao();
        RequestDispatcher view;
        switch (action){
            case "login":
                BPersona usuario= loginDao.validarUsuario(user,password);
                if(usuario.getIdPer()!=0){
                    HttpSession session= request.getSession();
                    session.setAttribute("clienteLog", usuario);
                    response.sendRedirect(request.getContextPath());
                }else{
                    response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet?error");
                }
                break;
            case "cambiarContra":
                String pass= request.getParameter("pass");
                String pass2= request.getParameter("pass2");
                email= request.getParameter("email");
                if(pass.equals(pass2)){
                    try {
                        loginDao.cambiarContra(email, pass);
                        response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet?action=cambioContraexitoso");
                    } catch (SQLException e) {
                        e.printStackTrace();
                        request.setAttribute("email", email);
                        request.setAttribute("error", "errorSQL");
                        view= request.getRequestDispatcher("Cliente/UsuariorecuperarContra2.jsp");
                        view.forward(request,response);
                    }
                }else{
                    request.setAttribute("email", email);
                    request.setAttribute("error", "noIgual");
                    view= request.getRequestDispatcher("Cliente/UsuariorecuperarContra2.jsp");
                    view.forward(request,response);
                }
                break;
            case "cambiarContra0":
                email = request.getParameter("email");
                if(email!=null){
                    request.setAttribute("email", email);
                    request.setAttribute("error", "");
                    view= request.getRequestDispatcher("Cliente/UsuariorecuperarContra2.jsp");
                    view.forward(request,response);
                }else{
                    response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet?action=olvidoContra");
                }
                break;
            case "validarEmail":
                email= request.getParameter("email");
                if(loginDao.existeEmail(email)){
                    request.setAttribute("conf", "yes");
                }else{
                    request.setAttribute("conf", "no");
                }
                request.setAttribute("email", email);
                view= request.getRequestDispatcher("Cliente/UsuariorecuperarContra.jsp");
                view.forward(request,response);
                break;
        }


    }
}
