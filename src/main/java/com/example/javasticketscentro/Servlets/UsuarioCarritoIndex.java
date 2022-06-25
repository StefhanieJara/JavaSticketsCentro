package com.example.javasticketscentro.Servlets;
import com.example.javasticketscentro.Daos.CarritoDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UsuarioCarritoIndex", value = "/UsuarioCarritoIndex")
public class UsuarioCarritoIndex extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        int idClient = Integer.parseInt(request.getParameter("id"));
        CarritoDao carritoDao= new CarritoDao();
        switch (action){
            case "listar"->{
                try{
                    int idPeli= Integer.parseInt(request.getParameter("idPeli"));
                    request.setAttribute("idPeli", idPeli);
                    request.setAttribute("vieneDePeli", true);
                }catch (NumberFormatException e){
                    request.setAttribute("idPeli", 0);
                    request.setAttribute("vieneDePeli", false);
                }
                request.setAttribute("idClient", idClient);
                request.setAttribute("carrito", carritoDao.listarCarrito(idClient));
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
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        String idClient = request.getParameter("idClient");
        CarritoDao carritoDao= new CarritoDao();
        String idCompraStr= request.getParameter("idCompra");
        String idFuncionStr= request.getParameter("idFuncion");
        switch (action){
            case "guardar":
                String numeroTarjetaStr = request.getParameter("numeroTarjeta");
                String cvvStr = request.getParameter("cvv");
                String fechaVencimientoStr = request.getParameter("fechaVencimiento");
                String bancoNombre = request.getParameter("bancoNombre");
                String tipoTarjeta = request.getParameter("tipoTarjeta");
                String id_cliente = request.getParameter("id_cliente");

                int numeroTarjeta = Integer.parseInt(numeroTarjetaStr);
                int cvv = Integer.parseInt(cvvStr);


                carritoDao = new CarritoDao();
                carritoDao.ingresarTarjeta(numeroTarjeta,cvv,fechaVencimientoStr,bancoNombre,tipoTarjeta,id_cliente);

                response.sendRedirect(request.getContextPath()+"/UsuarioCarritoIndex");
                break;
            case "listar":
                try{
                    int butacas=Integer.parseInt(request.getParameter("butacas"));
                    int idFuncion= Integer.parseInt(idFuncionStr);
                    carritoDao.cambiarButacasTicket(butacas, idFuncion, idCompraStr);
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir id | doPost UsuarioCarrotpIndex");
                }
                response.sendRedirect(request.getContextPath()+"/UsuarioCarritoIndex?id="+idClient+"&action=listar");
                break;
            case "borrar":
                try{
                    int idFuncion= Integer.parseInt(idFuncionStr);
                    carritoDao.borrarTicket(idFuncion, idCompraStr);
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir id | doPost UsuarioCarrotpIndex");
                }
                response.sendRedirect(request.getContextPath()+"/UsuarioCarritoIndex?id="+idClient+"&action=listar");
                break;
        }
    }
}
