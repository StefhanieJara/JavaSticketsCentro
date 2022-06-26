package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.LoginDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

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
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user= request.getParameter("user");
        String password= request.getParameter("password");

        LoginDao loginDao= new LoginDao();
        BPersona usuario= loginDao.validarUsuario(user,password);
        if(usuario.getIdPer()!=0){
            HttpSession session= request.getSession();
            session.setAttribute("clienteLog", usuario);
            response.sendRedirect(request.getContextPath());
        }else{
            response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet?error");
        }
    }
}
