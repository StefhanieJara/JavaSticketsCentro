package com.example.javasticketscentro.Servlets;

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
        String idCLientSr= request.getParameter("idCliente");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        HistorialDao historialDao = new HistorialDao();
        switch (action){
            case "listar" -> {
                try{
                    //int idClient = Integer.parseInt(idCLientSr);
                    int idClient = Integer.parseInt(idCLientSr);
                    ArrayList<Bhistorial> listadetickets = historialDao.listaTickets(idClient);
                    request.setAttribute("lista", listadetickets);
                    ArrayList<ArrayList<Bhistorial_detalle>> listaHistoriales = new ArrayList<>();
                    for(Bhistorial ticket : listadetickets){
                        ArrayList<Bhistorial_detalle> historial = historialDao.buscarFuncionesDeTicket(ticket.getCodigo());
                        listaHistoriales.add(historial);
                    }
                    request.setAttribute("listaHistoriales", listaHistoriales);
                    request.setAttribute("idClient", idClient);
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
                historialDao.borrar(idTicket,Integer.parseInt(idFuncion));
                response.sendRedirect(request.getContextPath() + "/UsuarioHistorial_2Servlet");
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        HistorialDao historialDao = new HistorialDao();

    }
}
