package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.*;
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
import java.util.ArrayList;

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
        String mensaje = request.getParameter("mensaje")==null?"":request.getParameter("mensaje");
        OperadorDao operadorDao = new OperadorDao();
        AdminDao adminDao = new AdminDao();
        switch (action){
            case "editar"->{
                int IDFuncion = Integer.parseInt(request.getParameter("idFuncion")==null?(String)session.getAttribute("idFuncion"):request.getParameter("idFuncion"));

                BFuncion funcionSel = operadorDao.obtenerFuncion(IDFuncion);
                String fecha = funcionSel.getFecha();
                String hora = funcionSel.getHoraInicio();
                String[] horaMin = hora.split(":");
                String fechaHoraFormato = fecha + "T"+horaMin[0]+":"+horaMin[1];

                request.setAttribute("funcion", funcionSel);
                request.setAttribute("fecha", fechaHoraFormato);
                request.setAttribute("listaPeliculas",operadorDao.listapeliculas());
                request.setAttribute("listaSalas", adminDao.listasala());
                request.setAttribute("aforo", operadorDao.obtenerAforoPorFuncion(IDFuncion));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/editarFuncion.jsp");
                requestDispatcher.forward(request,response);}
            case "listar" -> {
                ArrayList<BFuncion> funciones= operadorDao.listarFunciones(date, idSala, pagina,cant_resultFunciones, true);
                request.setAttribute("listaFunciones",funciones);
                ArrayList<Boolean> sePuedeEditar= new ArrayList<>();
                for(BFuncion funcion: funciones){
                    try {
                        sePuedeEditar.add(operadorDao.esPosibleEditarFuncion(funcion.getIdFuncion()));
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                request.setAttribute("sePuedeEditar",sePuedeEditar);
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
                request.setAttribute("Precio", 1.0);
                request.setAttribute("idSede", 0);
                request.setAttribute("fecha", "");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/registrar_funcion.jsp");
                requestDispatcher.forward(request,response);
            }
            case "registrar"->{
                BFuncion funcion=(BFuncion) session.getAttribute("funcionNUEVA");
                request.setAttribute("idPelicula", funcion.getbPelicula().getIdPelicula());
                request.setAttribute("Precio", funcion.getPrecio());
                request.setAttribute("idSede", funcion.getbSala().getbSede().getIdSede());
                request.setAttribute("fecha", funcion.getFecha());
                request.setAttribute("listaPeliculas", operadorDao.listapeliculas());
                request.setAttribute("listaSedes", adminDao.listarSedes());
                request.setAttribute("ListaSalas", session.getAttribute("ListaSalas"));

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/registrar_funcion.jsp");
                requestDispatcher.forward(request, response);
            }
            default -> {response.sendRedirect(request.getContextPath());}
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
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
                    String idPeli = request.getParameter("idPeli").equals("Seleccionar") ? "0" : request.getParameter("idPeli");
                    String precioFuncion = request.getParameter("precio") == null ? "0.0" : request.getParameter("precio");
                    String sedeEleg = request.getParameter("idsede").equals("Seleccionar") ? "0" : request.getParameter("idsede");

                    if(fechaStr.equals("") || idPeli.equals("0") || precioFuncion.equals("0.0")  || sedeEleg.equals("0")){
                        session.setAttribute("msg", "errorIncompleto");
                        response.sendRedirect(request.getContextPath()+"/OperadorFuncionesServlet?action=crear");
                    }else {
                        String[] fechaHora = fechaStr.split("T");
                        String fecha = fechaHora[0];
                        String horaInicio = fechaHora[1] + ":00";
                        int idPelicula = Integer.parseInt(idPeli);
                        double precio = Double.parseDouble(precioFuncion);
                        int idsede = Integer.parseInt(sedeEleg);

                        request.setAttribute("idPelicula", idPelicula);
                        request.setAttribute("Precio", precio);
                        request.setAttribute("idSede", idsede);
                        request.setAttribute("fecha", fechaStr);
                        request.setAttribute("listaPeliculas", operadorDao.listapeliculas());
                        request.setAttribute("listaSedes", adminDao.listarSedes());

                        BFuncion funcion= new BFuncion();
                        BPelicula peli0= new BPelicula();
                        peli0.setIdPelicula(idPelicula);
                        funcion.setPrecio(precio);
                        BSala sala0= new BSala();
                        BSede sede= new BSede();
                        sede.setIdSede(idsede);
                        sala0.setbSede(sede);
                        funcion.setbSala(sala0);
                        funcion.setFecha(fechaStr);
                        funcion.setbPelicula(peli0);
                        session.setAttribute("funcionNUEVA", funcion);

                        BPelicula peli = operadorDao.obtenerPelicula(idPelicula);
                        ArrayList<BSala> salasDisponibles = new ArrayList<>();
                        ArrayList<BSala> salas = operadorDao.listarSalas();
                        for (BSala sala : salas) {
                            if (sala.getbSede().getIdSede() == idsede) {
                                if (operadorDao.salaEsDisponible(fecha, horaInicio, peli.getDuracion(), sala.getIdSala())) {
                                    salasDisponibles.add(sala);
                                }
                            }
                        }
                        request.setAttribute("ListaSalas", salasDisponibles);

                        session.setAttribute("ListaSalas", salasDisponibles);
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/registrar_funcion.jsp");
                        requestDispatcher.forward(request, response);
                    }
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
                    idSala = Integer.parseInt(request.getParameter("idSala").equals("Seleccionar")?"0":request.getParameter("idSala"));
                    if(idSala!=0){
                        operadorDao.crearFuncion(precio, stock, idPelicula, fechaInicio, horaInicio, idSala);
                        response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                    }else{
                        session.setAttribute("msg", "vaciaSala");
                        response.sendRedirect(request.getContextPath()+"/OperadorFuncionesServlet?action=registrar");
                    }
                }catch (NumberFormatException e){
                    e.printStackTrace();
                }
                break;
            case "editar":
                int IDFuncion = Integer.parseInt(request.getParameter("idFuncion"));
                session.removeAttribute("idFuncion");

                BFuncion funcionSel = operadorDao.obtenerFuncion(IDFuncion);
                String fecha = funcionSel.getFecha();
                String hora = funcionSel.getHoraInicio();
                String[] horaMin = hora.split(":");
                String fechaHoraFormato = fecha + "T"+horaMin[0]+":"+horaMin[1];

                request.setAttribute("funcion", funcionSel);
                request.setAttribute("fecha", fechaHoraFormato);
                request.setAttribute("listaPeliculas",operadorDao.listapeliculas());
                request.setAttribute("listaSalas", adminDao.listasala());
                request.setAttribute("aforo", operadorDao.obtenerAforoPorFuncion(IDFuncion));
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/editarFuncion.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "actualizar":
                idFuncion=Integer.parseInt(request.getParameter("idFuncion"));
                int idPeli= Integer.parseInt(request.getParameter("idPeli"));
                try {
                    double precio= Double.parseDouble(request.getParameter("precio"));
                    String fechaHora= request.getParameter("fechaHora");
                    idSala= Integer.parseInt(request.getParameter("idSala"));
                    int stock= Integer.parseInt(request.getParameter("stock"));

                    fecha= fechaHora.split("T")[0];
                    hora= fechaHora.split("T")[1]+":00";
                    BPelicula peli= operadorDao.obtenerPelicula(idPeli);
                    BFuncion funcion=(BFuncion)session.getAttribute("editarFuncion");
                    session.removeAttribute("editarFuncion");
                    if(!funcion.getFecha().equals(fecha)){
                        if(operadorDao.salaEsDisponible(fecha,hora,peli.getDuracion(),idSala)){
                            System.out.println("Exitoso!");
                            operadorDao.actualizarFuncion(idFuncion, idPeli, precio, fecha,hora,idSala,stock);
                            response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                        }else{
                            session.setAttribute("idFuncion", ""+idFuncion);
                            session.setAttribute("error", "incoSalas");
                            response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet?action=editar");
                        }
                    }else{
                        if(idSala!=funcion.getbSala().getIdSala()){
                            if(operadorDao.salaEsDisponible(fecha,hora,peli.getDuracion(),idSala)){
                                System.out.println("Editar Exitoso");
                                operadorDao.actualizarFuncion(idFuncion, idPeli, precio, fecha,hora,idSala,stock);
                                response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                            }else{
                                session.setAttribute("idFuncion", ""+idFuncion);
                                session.setAttribute("error", "incoSalas");
                                response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet?action=editar");
                            }
                        }else{
                            operadorDao.actualizarFuncion(idFuncion, idPeli, precio, fecha,hora,idSala,stock);
                            System.out.println("Editar Exitoso");
                            response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }catch (NumberFormatException e){
                    session.setAttribute("idFuncion", ""+idFuncion);
                    session.setAttribute("error", "tipoDato");
                    response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet?action=editar");
                }
                break;
            case "borrar":
                idFuncion = Integer.parseInt(request.getParameter("idFuncion"));
                operadorDao.deshabilitarFuncion(idFuncion);
                response.sendRedirect(request.getContextPath() + "/OperadorFuncionesServlet");
                break;
            case "filtrar":
                session.removeAttribute("pagina");
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
                    String text = "#%Pel??cula%Precio por Ticket%Stock%Hora de Inicio\n";
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
            default:
                response.sendRedirect(request.getContextPath());
        }
    }
    public void redireccionar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OperadorDao operadorDao = new OperadorDao();
        AdminDao adminDao = new AdminDao();
        request.setAttribute("mensaje", "incompletos");
        request.setAttribute("listaPeliculas",operadorDao.listapeliculas());
        request.setAttribute("listaSedes",adminDao.listarSedes());
        request.setAttribute("idPelicula", 0);
        request.setAttribute("Precio", 1.0);
        request.setAttribute("idSede", 0);
        request.setAttribute("fecha", "");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/registrar_funcion.jsp");
        requestDispatcher.forward(request,response);
    }
}
