package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Beans.Bhistorial;
import com.example.javasticketscentro.Beans.Bhistorial_detalle;
import com.example.javasticketscentro.Daos.HistorialDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UsuarioHistorial_2Servlet", value = "/UsuarioHistorial_2Servlet")
public class UsuarioHistorial_2Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        HttpSession session= request.getSession();;
        BPersona usuario;
        HistorialDao historialDao = new HistorialDao();
        switch (action){
            case "listar" -> {
                try{
                    usuario= (BPersona) session.getAttribute("clienteLog");
                    ArrayList<Bhistorial> listadetickets = historialDao.listaTickets(usuario.getIdPer());
                    request.setAttribute("lista", listadetickets);
                    ArrayList<ArrayList<Bhistorial_detalle>> listaHistoriales = new ArrayList<>();
                    for(Bhistorial ticket : listadetickets){
                        ArrayList<Bhistorial_detalle> historial = historialDao.buscarFuncionesDeTicket(ticket.getCodigo());
                        listaHistoriales.add(historial);
                    }
                    request.setAttribute("listaHistoriales", listaHistoriales);
                    RequestDispatcher view = request.getRequestDispatcher("/Cliente/UsuarioHistorial_2.jsp");
                    view.forward(request, response);
                }catch (NumberFormatException e){
                    System.out.println("Error en el id del Cliente");
                    response.sendRedirect(request.getContextPath()+"/");
                }
            }
            case "borrar" -> {
                String idTicket = request.getParameter("idTicket");
                String idFuncion = request.getParameter("idFuncion");
                try{
                    historialDao.borrar(idTicket,Integer.parseInt(idFuncion));
                    response.sendRedirect(request.getContextPath() + "/UsuarioHistorial_2Servlet");
                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath());
                }
            }
            case "listarP"->{
                String idPeliculaStr =  request.getParameter("id");
                session.setAttribute("idPeli", Integer.parseInt(idPeliculaStr));
                response.sendRedirect(request.getContextPath()+"/calificarPelicula");
            }
            default -> {
                response.sendRedirect(request.getContextPath());
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        HistorialDao historialDao = new HistorialDao();

    }
}
