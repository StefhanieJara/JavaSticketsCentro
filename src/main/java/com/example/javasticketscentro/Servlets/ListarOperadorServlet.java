package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.LoginDao;
import com.example.javasticketscentro.JavaPDF;

import java.io.*;
import java.net.URLEncoder;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ListarOperadorServlet", value = "/ListarOperadorServlet")
public class ListarOperadorServlet extends HttpServlet {
    private static int cant_resultClientes=5;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        AdminDao adminDao = new AdminDao();
        ArrayList<String> filtros= new ArrayList<>();
        filtros.add("");
        filtros.add("");
        filtros.add("");
        filtros.add("");
        int pagina= request.getParameter("pagina") == null ? 1 :Integer.parseInt(request.getParameter("pagina"));
        switch (action){
            case "listar":
                String nombreBuscar = request.getParameter("nombreBuscar")==null ? "" :  request.getParameter("nombreBuscar");
                String apellidoBuscar = request.getParameter("apellidoBuscar")==null ? "" : request.getParameter("apellidoBuscar");
                String dniBuscar = request.getParameter("dniBuscar")==null ? "" : request.getParameter("dniBuscar");
                String emailBuscar= request.getParameter("emailBuscar")==null ? "" : request.getParameter("emailBuscar");
                request.setAttribute("listaOperadores",adminDao.listarOperador(emailBuscar,nombreBuscar,apellidoBuscar,dniBuscar,pagina,cant_resultClientes, true));
                int cant_paginas=(int)Math.ceil((double)adminDao.listarOperador(emailBuscar,nombreBuscar, apellidoBuscar, dniBuscar, pagina, cant_resultClientes, false).size()/cant_resultClientes);
                request.setAttribute("cant_paginas", cant_paginas);
                request.setAttribute("pagina", pagina);
                request.setAttribute("filtros", filtros);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaOp.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "agregar":
                RequestDispatcher agregarOperadores = request.getRequestDispatcher("/Admin/registrarOperador.jsp");
                agregarOperadores.forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        AdminDao adminDao = new AdminDao();
        LoginDao loginDao = new LoginDao();
        ArrayList<String> filtros = new ArrayList<>();
        HttpSession session = request.getSession();
        switch (action) {
            case "crear":
                String nombre = request.getParameter("nombreOperador");
                String apellido = request.getParameter("apellidoOperador");
                String rol = "Operador";
                String foto = "xd";
                String num = request.getParameter("numCel");
                String usuario = request.getParameter("usuario");
                String contrasenia = request.getParameter("contrasenia");
                String email = request.getParameter("email");
                String direccion = request.getParameter("direccion");
                String fecha_Nc = request.getParameter("fechaNac");
                String dnistr = request.getParameter("dni");
                if (loginDao.existeEmail(email)) {
                    session.setAttribute("error", "emailExiste");
                    response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet?action=agregar");
                } else {
                    if(nombre.isEmpty() || apellido.isEmpty() || usuario.isEmpty() ||
                            contrasenia.isEmpty() || email.isEmpty() || direccion.isEmpty() ||
                            fecha_Nc.isEmpty()){
                        session.setAttribute("error", "vacio");
                        response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet?action=agregar");
                    }else{
                    if (dnistr.charAt(0) == '-') {
                        session.setAttribute("error", "negativo");
                        response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet?action=agregar");
                    } else {
                        if (num.charAt(0) == '-') {
                            session.setAttribute("error", "negativo1");
                            response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet?action=agregar");

                        }else{
                            if (num.charAt(0) != '9') {
                                session.setAttribute("error", "comienzo");
                                response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet?action=agregar");}
                            else{
                            int numCel = Integer.parseInt(num);
                            int dni = Integer.parseInt(dnistr);
                            if (((int) Math.log10(dni) + 1) == 8) {
                                if (((int) Math.log10(numCel) + 1) == 9) {
                                    adminDao.anadirOperadores(nombre, dni, apellido, numCel, foto, fecha_Nc, email, usuario, contrasenia, direccion, rol);
                                    response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet");
                                    } else {
                                    session.setAttribute("error", "digitonumero");
                                    response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet?action=agregar");
                                }
                            } else {
                                session.setAttribute("error", "digitodni");
                                response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet?action=agregar");
                            }}}}}}


                break;
            case "borrar":
                String id = request.getParameter("id");
                adminDao.eliminarOperador(Integer.parseInt(id));
                response.sendRedirect(request.getContextPath() + "/ListarOperadorServlet");
                break;
            case "buscar":
                String nombreBuscar = request.getParameter("nombreBuscar");
                filtros.add(nombreBuscar);
                String apellidoBuscar = request.getParameter("apellidoBuscar");
                filtros.add(apellidoBuscar);
                String dniBuscar = request.getParameter("dniBuscar");
                filtros.add(dniBuscar);
                String emailBuscar =request.getParameter("emailBuscar");
                filtros.add(emailBuscar);
                int pagina= Integer.parseInt(request.getParameter("pagina"));
                int cant_paginas=(int)Math.ceil((double)adminDao.listarOperador(emailBuscar,nombreBuscar, apellidoBuscar, dniBuscar, pagina, cant_resultClientes, false).size()/cant_resultClientes);
                request.setAttribute("listaOperadores",adminDao.listarOperador(emailBuscar,nombreBuscar,apellidoBuscar,dniBuscar,pagina,cant_resultClientes, true));
                request.setAttribute("cant_paginas", cant_paginas);
                request.setAttribute("pagina", pagina);
                request.setAttribute("filtros", filtros);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/administradorListaOp.jsp");
                requestDispatcher.forward(request,response);
                break;
        }
    }

}

