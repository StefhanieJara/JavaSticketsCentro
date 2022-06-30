package com.example.javasticketscentro.Servlets;
import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Beans.BTarjeta;
import com.example.javasticketscentro.Daos.CarritoDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "UsuarioCarritoIndex", value = "/UsuarioCarritoIndex")
public class UsuarioCarritoIndex extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        HttpSession session;
        BPersona usuario;
        CarritoDao carritoDao= new CarritoDao();
        switch (action){
            case "listar"->{
                session=request.getSession();
                usuario= (BPersona) session.getAttribute("clienteLog");
                request.setAttribute("carrito", carritoDao.listarCarrito(usuario.getIdPer()));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Cliente/UsuarioCarrito.jsp");
                requestDispatcher.forward(request,response);
            }
            case "pagar"->{
                session=request.getSession();
                usuario= (BPersona) session.getAttribute("clienteLog");
                ArrayList<BTarjeta> tarjetas= carritoDao.listarTarjetas(usuario.getIdPer());
                request.setAttribute("tarjetas", tarjetas);
                if(tarjetas.size()>0){
                    request.setAttribute("tarjetaSelect",tarjetas.get(0));
                }
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Cliente/Usuariopayment.jsp");
                requestDispatcher.forward(request,response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        CarritoDao carritoDao= new CarritoDao();
        String idCompraStr= request.getParameter("idCompra");
        String idFuncionStr= request.getParameter("idFuncion");
        HttpSession session;
        BPersona usuario;

        switch (action){
            case "guardar":
                session=request.getSession();
                String numeroTarjetaStr = request.getParameter("numeroTarjeta");
                String cvvStr = request.getParameter("cvv");

                String fechaVencimientoStr = request.getParameter("fechaVencimiento");//validar numeros
                String bancoNombre = request.getParameter("bancoNombre");
                String tipoTarjeta = request.getParameter("tipoTarjeta");
                String idTarjetasr= request.getParameter("idTarjeta");
                try{
                    int cvv = Integer.parseInt(cvvStr);
                    long numeroTarjeta= Long.parseLong(numeroTarjetaStr); //Solo para captar que sean números
                    int idTarjeta= Integer.parseInt(idTarjetasr);
                    if(carritoDao.fVen_valido(fechaVencimientoStr)){
                        carritoDao = new CarritoDao();
                        session=request.getSession();
                        usuario= (BPersona) session.getAttribute("clienteLog");
                        if(idTarjeta==-1){
                            carritoDao.ingresarTarjeta(numeroTarjetaStr,cvv,fechaVencimientoStr,bancoNombre,tipoTarjeta,usuario.getIdPer());
                        }
                        carritoDao.cancelarCompra(usuario.getIdPer());
                        response.sendRedirect(request.getContextPath()+"/UsuarioCarritoIndex");
                    }else{
                        session.setAttribute("msg", "errorFV");
                        response.sendRedirect(request.getContextPath()+"/UsuarioCarritoIndex?action=pagar");
                    }
                }catch (NumberFormatException e){
                    session.setAttribute("msg", "numTaroCVV");
                    response.sendRedirect(request.getContextPath()+"/UsuarioCarritoIndex?action=pagar");
                }

                break;
            case "listar":
                try{
                    int butacas=Integer.parseInt(request.getParameter("butacas"));
                    int idFuncion= Integer.parseInt(idFuncionStr);
                    carritoDao.cambiarButacasTicket(butacas, idFuncion, idCompraStr);
                    response.sendRedirect(request.getContextPath()+"/UsuarioCarritoIndex?action=listar");
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir id | doPost UsuarioCarrotpIndex");
                    response.sendRedirect(request.getContextPath());
                }
                break;
            case "borrar":
                try{
                    int idFuncion= Integer.parseInt(idFuncionStr);
                    carritoDao.borrarTicket(idFuncion, idCompraStr);
                    response.sendRedirect(request.getContextPath()+"/UsuarioCarritoIndex?action=listar");
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir id | doPost UsuarioCarrotpIndex");
                    response.sendRedirect(request.getContextPath());
                }
                break;
            case "cambiarTarjeta":
                String idTarjeta= request.getParameter("tarjeta");
                int idT= Integer.parseInt(idTarjeta);
                request.setAttribute("tarjetaSelect",carritoDao.buscarTarjeta(idT));
                session=request.getSession();
                usuario= (BPersona) session.getAttribute("clienteLog");
                request.setAttribute("tarjetas", carritoDao.listarTarjetas(usuario.getIdPer()));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Cliente/Usuariopayment.jsp");
                requestDispatcher.forward(request,response);
                break;
        }
    }
}
