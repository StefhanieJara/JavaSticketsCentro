package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.CarritoDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Month;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@WebServlet(name = "UsuarioCarritoIndex", value = "/UsuarioCarritoIndex")
public class UsuarioCarritoIndex extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        switch (action){
            case "listar"->{
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Cliente/UsuarioCarrito.jsp");
                requestDispatcher.forward(request,response);
            }
            case "pagar"->{
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Cliente/Usuariopayment.jsp");
                requestDispatcher.forward(request,response);

            }

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        switch (action){
            case "guardar"->{

                String numeroTarjetaStr = request.getParameter("numeroTarjeta");
                String cvvStr = request.getParameter("cvv");
                String fechaVencimientoStr = request.getParameter("fechaVencimiento");
                String bancoNombre = request.getParameter("bancoNombre");
                String tipoTarjeta = request.getParameter("tipoTarjeta");
                String id_cliente = request.getParameter("id_cliente");

                int numeroTarjeta = Integer.parseInt(numeroTarjetaStr);
                int cvv = Integer.parseInt(cvvStr);


                CarritoDao carritoDao = new CarritoDao();
                carritoDao.ingresarTarjeta(numeroTarjeta,cvv,fechaVencimientoStr,bancoNombre,tipoTarjeta,id_cliente);

                response.sendRedirect(request.getContextPath()+"/UsuarioCarritoIndex");




            }
        }
    }
}
