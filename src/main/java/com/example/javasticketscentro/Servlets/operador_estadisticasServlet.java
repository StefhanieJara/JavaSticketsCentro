package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BCelebridad;
import com.example.javasticketscentro.Beans.BFuncion;
import com.example.javasticketscentro.Beans.BPelicula;
import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.EstadisticasDaos;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "operador_estadisticasServlet", value = "/operador_estadisticasServlet")
public class operador_estadisticasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        EstadisticasDaos estadisticasDaos = new EstadisticasDaos();

        switch (action) {
            case "listar":
                try {

                    ArrayList<BFuncion> generos = estadisticasDaos.listarGenero();
                    request.setAttribute("listaGenero", generos);

                    RequestDispatcher listar = request.getRequestDispatcher("Operador/estadisticas.jsp");
                    listar.forward(request, response);
                }
                 catch(IndexOutOfBoundsException e){
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                }
                break;
    }
}



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        EstadisticasDaos estadisticasDaos = new EstadisticasDaos();
        String fecha1 = request.getParameter("date1")== null ? "2022-06-07" : request.getParameter("date1");
        String fecha2 = request.getParameter("date2")== null ? "2022-08-07" : request.getParameter("date2");
        String fecha3 = request.getParameter("date3")== null ? "2022-06-07" : request.getParameter("date3");
        String fecha4 = request.getParameter("date4")== null ? "2022-08-07" : request.getParameter("date4");
        String fecha5 = request.getParameter("date5")== null ? "2022-06-07" : request.getParameter("date5");
        String fecha6 = request.getParameter("date6")== null ? "2022-08-07" : request.getParameter("date6");
        String fecha7 = request.getParameter("date7")== null ? "2022-06-07" : request.getParameter("date7");
        String fecha8 = request.getParameter("date8")== null ? "2022-08-07" : request.getParameter("date8");
        String fecha9 = request.getParameter("date9")== null ? "2022-06-07" : request.getParameter("date9");
        String fecha10 = request.getParameter("date10")== null ? "2022-08-07" : request.getParameter("date10");
        String fecha11 = request.getParameter("date11")== null ? "2022-06-07" : request.getParameter("date11");
        String fecha12 = request.getParameter("date12")== null ? "2022-08-07" : request.getParameter("date12");
        HttpSession session = request.getSession();
        switch (action){
            case "filtrar1":
                try {
                    ArrayList<BFuncion> asistencia = estadisticasDaos.listarAsistencia(fecha1,fecha2);
                    ArrayList<BFuncion> generos = estadisticasDaos.listarGenero();
                    if (asistencia.get(0)!=null){
                        request.setAttribute("listaGenero", generos);
                        request.setAttribute("listaAsistencia", asistencia);
                        request.setAttribute("fecha1",fecha1);
                        request.setAttribute("fecha2",fecha2);

                        RequestDispatcher filtrar = request.getRequestDispatcher("Operador/estadisticas.jsp");
                        filtrar.forward(request, response);
                    }
                }catch (IndexOutOfBoundsException e) {
                    System.out.println("Error al convertir tipo de dato");
                    request.getSession().setAttribute("msg1","No se ha encontrado la función más asistida");
                    response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                }
                break;

            case "filtrar2":
                try {
                    ArrayList<BFuncion> masVista = estadisticasDaos.listarMasVista(fecha3,fecha4);
                    if(masVista.get(0)!=null){
                        request.setAttribute("masVista", masVista);
                        request.setAttribute("fecha3",fecha3);
                        request.setAttribute("fecha4",fecha4);

                        RequestDispatcher filtrar = request.getRequestDispatcher("Operador/estadisticas.jsp");
                        filtrar.forward(request, response);
                    }
                }catch (IndexOutOfBoundsException e){
                    session.setAttribute("msg2","No se ha encontrado la función más vista");
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                }
                break;
            case "filtrar3":
                try {
                    ArrayList<BFuncion> menosVista = estadisticasDaos.listarMenosVista(fecha5,fecha6);
                    if(menosVista.get(0)!=null){
                        request.setAttribute("menosVista", menosVista);
                        request.setAttribute("fecha5",fecha5);
                        request.setAttribute("fecha6",fecha6);

                        RequestDispatcher filtrar = request.getRequestDispatcher("Operador/estadisticas.jsp");
                        filtrar.forward(request, response);
                    }
                }catch (IndexOutOfBoundsException e){
                    session.setAttribute("msg3","No se ha encontrado la función menos vista");
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                }
                break;
            case "filtrar4":

                    BPelicula pelicula = estadisticasDaos.peliculaMejorCalificada(fecha7,fecha8);
                    if (pelicula.getCalificacionPelicula()!=0){
                        request.setAttribute("peliculaMejorCalificada", pelicula);
                        request.setAttribute("fecha7",fecha7);
                        request.setAttribute("fecha8",fecha8);

                        RequestDispatcher filtrar = request.getRequestDispatcher("Operador/estadisticas.jsp");
                        filtrar.forward(request, response);
                    }else{
                        session.setAttribute("msg4","No se ha encontrado la pelicula mejor calificada");
                        System.out.println("Error al convertir tipo de dato");
                        response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                    }

                break;
            case "filtrar5":

                    BCelebridad actor = estadisticasDaos.actorMejorCalificado(fecha9,fecha10);
                    if(actor.getCalificacion()!=0){
                        request.setAttribute("actorMejorCalificado", actor);
                        request.setAttribute("fecha9",fecha9);
                        request.setAttribute("fecha10",fecha10);

                        RequestDispatcher filtrar = request.getRequestDispatcher("Operador/estadisticas.jsp");
                        filtrar.forward(request, response);
                    }else {
                        session.setAttribute("msg5","No se ha encontrado actor mejor calificado");
                        System.out.println("Error al convertir tipo de dato");
                        response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                    }

                break;
            case "filtrar6":

                BCelebridad director = estadisticasDaos.directorMejorCalificado(fecha11,fecha12);
                if(director.getCalificacion()!=0){
                        request.setAttribute("directorMejorCalificado", director);
                        request.setAttribute("fecha11",fecha11);
                        request.setAttribute("fecha12",fecha12);

                        RequestDispatcher filtrar = request.getRequestDispatcher("Operador/estadisticas.jsp");
                        filtrar.forward(request, response);
                }else{
                        session.setAttribute("msg6","No se ha encontrado director mejor calificado");
                        System.out.println("Error al convertir tipo de dato");
                        response.sendRedirect(request.getContextPath() + "/operador_estadisticasServlet");
                }

                break;

        }
    }
}