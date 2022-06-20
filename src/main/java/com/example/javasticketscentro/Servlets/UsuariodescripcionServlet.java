package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BFuncion;
import com.example.javasticketscentro.Beans.BPelicula;
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
        String idPeli = request.getParameter("id") == null ? "determinado" : request.getParameter("id");
        String idCliente = request.getParameter("idCliente") == null ? "12" : request.getParameter("idCliente");
        //Buscamos una funcion que se halla comprado anteriormente o este en el carrito (pagado==1 or carrito==1)
        BFuncion funcionElegida = peliculaDao.detectarFuncionEscogida(idPeli,idCliente, 1, 1);
        if(funcionElegida==null){
            funcionElegida= new BFuncion();
            funcionElegida.setId(0);
        }
        RequestDispatcher requestDispatcher;
        switch (idPeli){
            case "determinado":
                requestDispatcher = request.getRequestDispatcher("Cliente/UsuariodescripcionPeli.jsp");
                requestDispatcher.forward(request,response);
                break;
            default:
                try{
                    int idClient= Integer.parseInt(idCliente);
                    request.setAttribute("pelicula", peliculaDao.devolverPelicula(idPeli));
                    request.setAttribute("funciones", peliculaDao.detectarFunciones(idPeli));
                    request.setAttribute("idClient", idClient);
                    request.setAttribute("funcionElegida", funcionElegida);
                    requestDispatcher = request.getRequestDispatcher("Cliente/UsuariodescripcionPeli.jsp");
                    requestDispatcher.forward(request,response);
                }catch (NumberFormatException e){
                    System.out.println("ID de cliente erróneo");
                }
                //Debe redireccionar al login (ingreso)
                //response.sendRedirect(request.getContextPath()+"/");
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action");
        String idStrFuncionEscogida= request.getParameter("funcionEscogida");
        String idClientStr= request.getParameter("idClient");
        CarritoDao carritoDao= new CarritoDao();
        PeliculaDao peliculaDao= new PeliculaDao();
        int idClient;
        RequestDispatcher requestDispatcher;
        BFuncion funcionElegida= new BFuncion();
        switch (action){
            case "anadirCarro":
                try{
                    int idFuncionesco= Integer.parseInt(idStrFuncionEscogida);
                    idClient= Integer.parseInt(idClientStr);
                    carritoDao.anadirTicket(idFuncionesco, idClient);
                    request.setAttribute("idClient", idClient);
                    funcionElegida = peliculaDao.detectarFuncionEscogida(request.getParameter("idPeli"),idClientStr, 1, 1);
                    if(funcionElegida==null){
                        funcionElegida= new BFuncion();
                        funcionElegida.setId(0);
                    }
                }catch (NumberFormatException e){
                    System.out.println("Error de parseo!");
                }
                request.setAttribute("pelicula", peliculaDao.devolverPelicula(request.getParameter("idPeli")));
                request.setAttribute("funciones", peliculaDao.detectarFunciones(request.getParameter("idPeli")));
                request.setAttribute("funcionElegida", funcionElegida);
                requestDispatcher = request.getRequestDispatcher("Cliente/UsuariodescripcionPeli.jsp");
                requestDispatcher.forward(request,response);
                break;
        }
    }
}