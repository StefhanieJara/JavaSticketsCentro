package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BFuncion;
import com.example.javasticketscentro.Beans.BPelicula;
import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Beans.Bticket;
import com.example.javasticketscentro.Daos.CarritoDao;
import com.example.javasticketscentro.Daos.PeliculaDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UsuariodescripcionServlet", value = "/UsuariodescripcionServlet")
public class UsuariodescripcionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PeliculaDao peliculaDao= new PeliculaDao();
        String idPelistr = request.getParameter("id");
        String action= request.getParameter("action")==null? "describir" : request.getParameter("action");

        HttpSession session= request.getSession();
        BPersona usuario=(BPersona)session.getAttribute("clienteLog");
    
        RequestDispatcher requestDispatcher;
        if(usuario==null){
            response.sendRedirect(request.getContextPath());
        }else{
            switch (action){
                case "describir":
                    try{
                        int idPeli= Integer.parseInt(idPelistr);
                        BPelicula pelicula= peliculaDao.devolverPelicula(idPeli);
                        if(pelicula.getIdPelicula()!=0){

                            request.setAttribute("pelicula", pelicula);
                            request.setAttribute("funciones", peliculaDao.detectarFunciones(idPeli));
                            request.setAttribute("funcionesCliente", peliculaDao.funcionesDelCliente(usuario.getIdPer()));
                            requestDispatcher = request.getRequestDispatcher("Cliente/UsuariodescripcionPeli.jsp");
                            requestDispatcher.forward(request,response);
                        }else{
                            response.sendRedirect(request.getContextPath());
                        }
                    }catch (NumberFormatException e){
                        response.sendRedirect(request.getContextPath());
                    }
                    break;
                default:
                    response.sendRedirect(request.getContextPath());
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action");
        String idStrFuncionEscogida= request.getParameter("funcionEscogida");
        CarritoDao carritoDao= new CarritoDao();

        HttpSession session= request.getSession();
        BPersona usuario=(BPersona)session.getAttribute("clienteLog");
        switch (action){
            case "anadirCarro":
                if(usuario==null || usuario.getIdPer()==0){
                    response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet");
                }else{
                    try{
                        int idFuncionesco= Integer.parseInt(idStrFuncionEscogida);
                        carritoDao.anadirTicket(idFuncionesco, usuario.getIdPer());
                        session.setAttribute("msg", "anadirTicket");
                        response.sendRedirect(request.getContextPath()+"/UsuariodescripcionServlet?&id="+session.getAttribute("idPeli"));
                    }catch (NumberFormatException e){
                        response.sendRedirect(request.getContextPath());
                    }
                }
                break;
        }
    }
}