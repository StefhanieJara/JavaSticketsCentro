package com.example.javasticketscentro.Filters;


import com.example.javasticketscentro.Beans.BPersona;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebFilter(filterName = "FilterOperador", value ={"/indexOperadorServlet", "/editarPeliculaServlet",
                        "/insertarCelebridadServlet", "/operador_estadisticasServlet",
                        "/OperadorGestionSalasServlet", "/peliculaVisualizacionServlet",
                        "/personalServlet", "/RegistrarPeliculaServlet","/OperadorFuncionesServlet","/OperadorEditaPerfilServlet"})
public class FilterOperador implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletResponse response= (HttpServletResponse) res;
        HttpServletRequest request= (HttpServletRequest) req;
        BPersona usuario= (BPersona)request.getSession().getAttribute("clienteLog");
        if(usuario==null || usuario.getIdPer()==0){
            response.sendRedirect(request.getContextPath()+"/UsuariologinclientServlet");
        }else{
            if(usuario.getRol().equals("Operador")){
                //Borramos caché
                response.setHeader("Pragma", "No-cache");
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setDateHeader("Expires", 0);
                //Borramos caché
                chain.doFilter(req,res);
            }else{
                if(usuario.getRol().equals("Cliente")){
                    response.sendRedirect(request.getContextPath());
                }else{
                    response.sendRedirect(request.getContextPath()+"/AdminIndexServlet");
                }
            }
        }
    }
}
