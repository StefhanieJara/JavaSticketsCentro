package com.example.javasticketscentro.Servlets;

import com.example.javasticketscentro.Beans.BPelicula;
import com.example.javasticketscentro.Beans.BPersona;
import com.example.javasticketscentro.Beans.BSede;
import com.example.javasticketscentro.Daos.AdminDao;
import com.example.javasticketscentro.Daos.IndexDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "indexServlet", value = {"", "/Index"})
public class indexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action")==null?"":request.getParameter("action");

        //Borramos caché
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        //Borramos caché
        IndexDao indexDao = new IndexDao();
        AdminDao adminDao = new AdminDao();
        String filtro= request.getSession().getAttribute("filtro")==null? "": (String)request.getSession().getAttribute("filtro");
        request.getSession().removeAttribute("filtro");
        BPersona usuario= (BPersona)request.getSession().getAttribute("clienteLog");
        ArrayList<BPelicula> listapeliculas=indexDao.listaPeliculas(filtro);
        if(usuario==null || usuario.getIdPer()==0 || usuario.getRol().equals("Cliente")){
            switch (action){
                case "describir"->{
                    String idPelistr = request.getParameter("id");
                    HttpSession session= request.getSession();
                    session.setAttribute("idPeli", Integer.parseInt(idPelistr));
                    response.sendRedirect(request.getContextPath()+"/UsuariodescripcionServlet");
                }
                default -> {
                    ArrayList<BSede> listaSedes = adminDao.listarSedes();
                    request.setAttribute("Listapeliculas", listapeliculas);
                    request.setAttribute("ListaSedes", listaSedes);
                    request.setAttribute("filtro", filtro);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                    requestDispatcher.forward(request,response);
                }
            }
        }else{
            if(usuario.getRol().equals("Operador")){
                response.sendRedirect(request.getContextPath()+"/indexOperadorServlet");
            }else{
                response.sendRedirect(request.getContextPath()+"/AdminIndexServlet");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        request.getSession().setAttribute("filtro",request.getParameter("filtro"));
        response.sendRedirect(request.getContextPath());
    }
}
