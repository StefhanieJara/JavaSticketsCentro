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
        String action= request.getParameter("action");

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
                        //Buscamos una funcion que se halla comprado anteriormente o este en el carrito (pagado==1 or carrito==1)
                        BFuncion funcionElegida = peliculaDao.detectarFuncionEscogida(idPeli,usuario.getIdPer(), 1, 1);
                        if(funcionElegida==null){
                            funcionElegida= new BFuncion();
                            funcionElegida.setId(0);
                        }
                        BPelicula pelicula = peliculaDao.devolverPelicula(idPeli);
                        request.setAttribute("pelicula", pelicula);
                        request.setAttribute("funciones", peliculaDao.detectarFunciones(idPeli));
                        request.setAttribute("idClient", usuario.getIdPer());
                        request.setAttribute("funcionElegida", funcionElegida);
                        requestDispatcher = request.getRequestDispatcher("Cliente/UsuariodescripcionPeli.jsp");
                        requestDispatcher.forward(request,response);
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
        String idPelistr= request.getParameter("idPeli");
        String idStrFuncionEscogida= request.getParameter("funcionEscogida");
        CarritoDao carritoDao= new CarritoDao();
        PeliculaDao peliculaDao= new PeliculaDao();
        RequestDispatcher requestDispatcher;
        BFuncion funcionElegida;

        HttpSession session= request.getSession();
        BPersona usuario=(BPersona)session.getAttribute("clienteLog");
        switch (action){
            case "anadirCarro":
                if(usuario==null || usuario.getIdPer()==0){
                    response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet");
                }else{
                    try{
                        int idFuncionesco= Integer.parseInt(idStrFuncionEscogida);
                        int idPeli= Integer.parseInt(idPelistr);
                        carritoDao.anadirTicket(idFuncionesco, usuario.getIdPer());
                        request.setAttribute("idClient", usuario.getIdPer());
                        funcionElegida = peliculaDao.detectarFuncionEscogida(idPeli,usuario.getIdPer(), 1, 1);
                        if(funcionElegida==null){
                            funcionElegida= new BFuncion();
                            funcionElegida.setId(0);
                        }
                        request.setAttribute("pelicula", peliculaDao.devolverPelicula(idPeli));
                        request.setAttribute("funciones", peliculaDao.detectarFunciones(idPeli));
                        request.setAttribute("funcionElegida", funcionElegida);
                        requestDispatcher = request.getRequestDispatcher("Cliente/UsuariodescripcionPeli.jsp");
                        requestDispatcher.forward(request,response);
                    }catch (NumberFormatException e){
                        response.sendRedirect(request.getContextPath());
                    }
                }
                break;
        }
    }
}