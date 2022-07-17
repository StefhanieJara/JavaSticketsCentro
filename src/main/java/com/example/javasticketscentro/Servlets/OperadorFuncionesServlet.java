package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BFuncion;
import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Beans.BSala;
import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.OperadorDao;
import com.example.javasticketscentro.JavaPDF;
import com.sun.mail.imap.protocol.ID;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "OperadorFuncionesServlet", value = "/OperadorFuncionesServlet")
public class OperadorFuncionesServlet extends HttpServlet {
    private static int cant_resultFunciones=10;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session= request.getSession();
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        String date= session.getAttribute("fechaFiltro")==null?"":(String)session.getAttribute("fechaFiltro");
        String idSala= session.getAttribute("idSala")==null?"":(String)session.getAttribute("idSala");
        int pagina= session.getAttribute("pagina")==null?1:(int)session.getAttribute("pagina");
        session.removeAttribute("idSala");session.removeAttribute("fechaFiltro");
        OperadorDao operadorDao = new OperadorDao();
        AdminDao adminDao = new AdminDao();
        switch (action){
            case "listar" -> {
                request.setAttribute("listaFunciones",operadorDao.listarFunciones(date, idSala, pagina,cant_resultFunciones, true));
                request.setAttribute("pagina", pagina);
                request.setAttribute("fechaFiltro", date);
                request.setAttribute("idSala",idSala);
                int cant_paginas=(int)Math.ceil((double)operadorDao.listarFunciones(date, idSala, pagina,cant_resultFunciones, false).size()/cant_resultFunciones);
                request.setAttribute("cant_paginas", cant_paginas);
                request.setAttribute("salas", operadorDao.listarSalas());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/funcionesVisualizacion.jsp");
                requestDispatcher.forward(request,response);
            }
            case "crear"-> {
                request.setAttribute("listaPeliculas",operadorDao.listapeliculas());
                request.setAttribute("listaSedes",adminDao.listarSedes());
                request.setAttribute("idPelicula", 0);
                request.setAttribute("Precio", 0.0);
                request.setAttribute("idSede", 0);
                request.setAttribute("fecha", "");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/registrar_funcion.jsp");
                requestDispatcher.forward(request,response);
            }
            default -> {response.sendRedirect(request.getContextPath());}
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        OperadorDao operadorDao = new OperadorDao();
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        AdminDao adminDao = new AdminDao();
        int idFuncion, idSala;
        HttpSession session= request.getSession();
        String fechaStr = request.getParameter("fechaHora")==null?"":request.getParameter("fechaHora");
        switch (action) {
            case "registrar":
                try {
                    String[] fechaHora = fechaStr.split("T");
                    String fechaInicio = fechaHora[0];
                    String horaInicio = fechaHora[1] + ":00";
                    int idPelicula = Integer.parseInt(request.getParameter("idPeli"));
                    double precio = Double.parseDouble(request.getParameter("precio"));
                    int idsede = Integer.parseInt(request.getParameter("idsede"));
                    request.setAttribute("idPelicula", idPelicula);
                    request.setAttribute("Precio", precio);
                    request.setAttribute("idSede", idsede);
                    request.setAttribute("fecha", fechaStr);
                    request.setAttribute("listaPeliculas",operadorDao.listapeliculas());
                    request.setAttribute("listaSedes",adminDao.listarSedes());
                    request.setAttribute("ListaSalas", operadorDao.obtenerSalasDisponibles(fechaInicio, horaInicio, idsede, idPelicula));
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/registrar_funcion.jsp");
                    requestDispatcher.forward(request,response);
                }catch (NumberFormatException e){
                    e.printStackTrace();
                }
                break;
            case "guardar":
                try{
                    String[] fechaHora = fechaStr.split("T");
                    String fechaInicio = fechaHora[0];
                    String horaInicio = fechaHora[1] + ":00";
                    int idPelicula = Integer.parseInt(request.getParameter("idPeli"));
                    double precio = Double.parseDouble(request.getParameter("precio"));
                    int stock = Integer.parseInt(request.getParameter("stock"));
                    idSala = Integer.parseInt(request.getParameter("idSala"));
                    operadorDao.crearFuncion(precio, stock, idPelicula, fechaInicio, horaInicio, idSala);
                    response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                }catch (NumberFormatException e){
                    e.printStackTrace();
                }
                break;
            case "editar":
                int IDFuncion = Integer.parseInt(request.getParameter("idFuncion"));
                BFuncion funcionSel = operadorDao.obtenerFuncion(IDFuncion);

                String fecha = funcionSel.getFecha();
                String hora = funcionSel.getHoraInicio();
                String[] horaMin = hora.split(":");
                String fechaHoraFormato = fecha + "T"+horaMin[0]+":"+horaMin[1];

                request.setAttribute("funcion", funcionSel);
                request.setAttribute("fecha", fechaHoraFormato);
                request.setAttribute("listaPeliculas",operadorDao.listapeliculas());
                request.setAttribute("listaSalas", adminDao.listasala());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/editarFuncion.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "actualizar":
                idFuncion=Integer.parseInt(request.getParameter("idFuncion"));
                int idPeli= Integer.parseInt(request.getParameter("idPeli"));
                double precio= Double.parseDouble(request.getParameter("precio"));
                String fechaHora= request.getParameter("fechaHora");
                idSala= Integer.parseInt(request.getParameter("idSala"));
                int stock= Integer.parseInt(request.getParameter("stock"));

                fecha= fechaHora.split("T")[0];
                hora= fechaHora.split("T")[1]+":00";
                try {
                    operadorDao.actualizarFuncion(idFuncion, idPeli, precio, fecha,hora,idSala,stock);
                    response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "borrar":
                idFuncion = Integer.parseInt(request.getParameter("idFuncion"));
                operadorDao.deshabilitarFuncion(idFuncion);
                response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                break;
            case "filtrar":
                String date= request.getParameter("fechaFiltro");
                String idSalaStr= request.getParameter("idSala");
                try{
                    idSala= Integer.parseInt(idSalaStr);
                    if(idSala==-1){
                        session.setAttribute("idSala", "");
                    }else{
                        session.setAttribute("idSala", idSalaStr);
                    }
                    session.setAttribute("fechaFiltro", date);
                    response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                }
                break;
            case "paginar":
                int pagina= Integer.parseInt(request.getParameter("pagina"));
                session.setAttribute("pagina", pagina);
                response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                break;
            case "descargar":
                AdminDao admin= new AdminDao();
                String fechaFiltro=request.getParameter("fechaFiltro");
                String idsala= request.getParameter("idSala");
                try(PrintWriter salir =  response.getWriter()) {
                    BSala sala= admin.buscarSala(Integer.parseInt(idsala));
                    BFuncion funcionFecha= new BFuncion();
                    funcionFecha.setbSala(sala);
                    funcionFecha.setFecha(fechaFiltro);
                    int i = 1;
                    String text = "#%Película%Precio por Ticket%Stock%Hora de Inicio\n";
                    for(BFuncion funcion : operadorDao.listarFunciones(fechaFiltro, idsala, 1,cant_resultFunciones, false)){
                        text += i+".%"+funcion.getbPelicula().getNombre()+"%"+funcion.getPrecio()+
                                "%"+funcion.getStock()+"%"+funcion.getHoraInicio()+"\n";
                        i ++;
                    }
                    response.setContentType("application/pdf");
                    response.setHeader("Content-Disposition", "attachment; filename=funciones.pdf");
                    JavaPDF javaPDF= new JavaPDF();
                    byte[] pdf= javaPDF.pdfFuncionTable(text, funcionFecha);
                    InputStream in =new ByteArrayInputStream(pdf);
                    int f;
                    while((f=in.read())!=-1){
                        salir.write(f);
                    }
                    in.close();
                }
                break;
        }
    }
}
