package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPersonal;
import com.example.javasticketscentro.Beans.BSala;
import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.OperadorDao;
import com.mysql.cj.util.DnsSrv;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTML;
import java.io.IOException;

@WebServlet(name = "personalServlet", urlPatterns = {"/personalServlet"})
public class personalServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        OperadorDao operadorDao = new OperadorDao();
        AdminDao adminDao = new AdminDao();

        switch (action){
            case "listar" -> {
                request.setAttribute("listaPersonal",operadorDao.listapersonal());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/personal.jsp");
                requestDispatcher.forward(request,response);
            }
            case "crear"-> {
                request.setAttribute("sedes",adminDao.listarSedes());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/registrar_personal.jsp");
                requestDispatcher.forward(request,response);
            }
            case "eliminar"->{

            }
            case "editar" ->{
                HttpSession session= request.getSession();
                int id=(int)session.getAttribute("id");

                BPersonal bPersonal = operadorDao.buscarPorId(id);
                request.setAttribute("bPersonal", bPersonal);
                request.setAttribute("sedes", adminDao.listarSedes());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/editar_personal.jsp");
                requestDispatcher.forward(request,response);
            }
            default -> {response.sendRedirect(request.getContextPath() + "/personalServlet");}
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        AdminDao adminDao = new AdminDao();
        OperadorDao operadorDao = new OperadorDao();
        String nombre;
        String apellido;
        String Sede_idSedeStr;
        nombre= request.getParameter("nombrepersonal");
        apellido = request.getParameter("apellidopersonal");
        Sede_idSedeStr = request.getParameter("elegirSede");

        switch (action){
            case "guardar"-> {
                try {
                    int elegirSede = adminDao.encontrarIDSede(Sede_idSedeStr);
                    if (elegirSede != 0) {
                        operadorDao.añadirPersonal(nombre,apellido,elegirSede);
                        response.sendRedirect(request.getContextPath() + "/personalServlet");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/personalServlet?action=crear");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Error al convertir tipo de dato");
                }
            }
            case "actualizar" ->{
                HttpSession session= request.getSession();
                String idStr = request.getParameter("idPersonal");
                try {
                    int id = Integer.parseInt(idStr);
                    int elegirSede = adminDao.encontrarIDSede(Sede_idSedeStr);
                    if (elegirSede != 0) {
                        if(esSoloLetras(nombre)&&esSoloLetras(apellido)){
                            operadorDao.actualizarPersonal(id,nombre,apellido,elegirSede);
                            session.removeAttribute("id");
                            response.sendRedirect(request.getContextPath() + "/personalServlet");
                        }else{
                            session.setAttribute("id", id);
                            session.setAttribute("msg", "errorNombres");
                            response.sendRedirect(request.getContextPath() + "/personalServlet?action=editar");
                        }
                    }else {
                        session.setAttribute("id", id);
                        response.sendRedirect(request.getContextPath() + "/personalServlet?action=editar");
                    }
                } catch (NumberFormatException e){
                    System.out.println("Error al convertir tipo de dato");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/editar_personal.jsp");
                    requestDispatcher.forward(request,response);
                }
            }
            case "editar" ->{
                String idStr = request.getParameter("id");
                try{
                    int id = Integer.parseInt(idStr);
                    BPersonal bPersonal = operadorDao.buscarPorId(id);
                    if(bPersonal != null){
                        request.setAttribute("bPersonal", bPersonal);
                        request.setAttribute("sedes", adminDao.listarSedes());
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Operador/editar_personal.jsp");
                        requestDispatcher.forward(request,response);
                    }else {
                        response.sendRedirect(request.getContextPath() + "/personalServlet");
                    }
                }catch (NumberFormatException e){
                    System.out.println("ID debe ser entero");
                    response.sendRedirect(request.getContextPath() + "/personalServlet");
                }
            }
        }
    }

    static boolean esSoloLetras(String cadena)
    {
        //Recorremos cada caracter de la cadena y comprobamos si son letras.
        //Para comprobarlo, lo pasamos a mayuscula y consultamos su numero ASCII.
        //Si está fuera del rango 65 - 90, es que NO son letras.
        //Para ser más exactos al tratarse del idioma español, tambien comprobamos
        //el valor 165 equivalente a la Ñ

        for (int i = 0; i < cadena.length(); i++)
        {
            char caracter = cadena.toUpperCase().charAt(i);
            int valorASCII = caracter;
            if (valorASCII != 165 && (valorASCII < 65 || valorASCII > 90))
                return false; //Se ha encontrado un caracter que no es letra
        }
        //Terminado el bucle sin que se haya retornado false, es que todos los caracteres son letras
        return true;
    }

}
