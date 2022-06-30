package com.example.javasticketscentro.Filters;


import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebFilter(filterName = "FilterLogin")
public class FilterLogin implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletResponse response= (HttpServletResponse) res;
        //Borramos caché
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        //Borramos caché
        chain.doFilter(req,res);
    }
}
