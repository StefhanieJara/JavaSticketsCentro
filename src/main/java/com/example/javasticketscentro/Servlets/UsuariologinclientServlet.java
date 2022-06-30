package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.LoginDao;
import com.mysql.cj.Session;

import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UsuariologinclientServlet", value = "/UsuariologinclientServlet")
public class UsuariologinclientServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Borramos caché
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        //Borramos caché

        String action= request.getParameter("action")==null? "loginform" : request.getParameter("action");
        RequestDispatcher view;
        HttpSession session= request.getSession();

        BPersona usuario= (BPersona) session.getAttribute("clienteLog");

        //Filtro distinto
        if(usuario==null || usuario.getIdPer()==0){
            switch (action){
                case "loginform":
                    view= request.getRequestDispatcher("Cliente/Usuariologin_client.jsp");
                    view.forward(request,response);
                    break;
                case "olvidoContra":
                    view= request.getRequestDispatcher("Cliente/UsuariorecuperarContra.jsp");
                    view.forward(request,response);
                    break;
                case "cambioContraexitoso":
                    //Eliminamos la session temporal
                    session.invalidate();
                    view= request.getRequestDispatcher("Cliente/UsuarioconfirmarContra.jsp");
                    view.forward(request,response);
                    break;
                case "cambiarContra0":
                    view= request.getRequestDispatcher("Cliente/UsuariorecuperarContra2.jsp");
                    view.forward(request,response);
                    break;
            }
        }else{
            switch (action){
                case "logout":
                    session.invalidate();
                    response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet");
                    break;
                case "loginform":
                    response.sendRedirect(request.getContextPath());
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user= request.getParameter("user");
        String password= request.getParameter("password");
        String action= request.getParameter("action")==null? "login" : request.getParameter("action");
        String email;
        HttpSession session;
        LoginDao loginDao= new LoginDao();
        RequestDispatcher view;
        switch (action){
            case "login":
                //Borramos caché
                response.setHeader("Pragma", "No-cache");
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setDateHeader("Expires", 0);
                //Borramos caché

                BPersona usuario= loginDao.validarUsuario(user,password);
                if(usuario.getIdPer()!=0){
                    //Encontramos si había una sesión
                    session= request.getSession();
                    session.invalidate();//La borramos

                    session= request.getSession();//Creamos uno nuevo
                    session.setAttribute("clienteLog", usuario);
                    response.sendRedirect(request.getContextPath());
                }else{
                    session=request.getSession();
                    session.setAttribute("error", "");
                    response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet");
                }
                break;
            case "cambiarContra":
                session=request.getSession();
                String pass= request.getParameter("pass");
                String pass2= request.getParameter("pass2");
                if(pass.equals(pass2)){
                    try {
                        loginDao.cambiarContra((String)session.getAttribute("email"), pass);
                        response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet?action=cambioContraexitoso");
                    } catch (SQLException e) {
                        e.printStackTrace();
                        session.setAttribute("error", "errorSQL");
                        response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet?action=cambiarContra0");
                    }
                }else{
                    session.setAttribute("error", "noIgual");
                    response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet?action=cambiarContra0");
                }
                break;

            case "validarEmail":
                email= request.getParameter("email");
                session= request.getSession();
                if(loginDao.existeEmail(email)){
                    try {
                        String codigo=loginDao.enviarCodRecupe(email);
                        session.setAttribute("codigoConfirmacion", codigo);
                        session.setAttribute("conf", "yes");
                    } catch (MessagingException e) {
                        session.setAttribute("conf", "antiVirusError");
                    }
                }else{
                    session.setAttribute("conf", "no");
                }
                session.setAttribute("email", email);
                response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet?action=olvidoContra");
                break;
            case "cambiarContra0":
                session= request.getSession();
                if(request.getParameter("codigo").equals(session.getAttribute("codigoConfirmacion"))){
                    session.removeAttribute("codigoConfirmacion");
                    response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet?action=cambiarContra0");
                }else{
                    session.setAttribute("msg", "Código inválido");
                    response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet?action=olvidoContra");
                }
                break;
        }

    }
}
