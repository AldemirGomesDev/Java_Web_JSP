package com.infopower.servlets;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.infopower.entidades.Administrador;
@WebFilter(dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.FORWARD }, urlPatterns = {"/JSP/*"})

public class FiltroAutentica implements Filter {
	private String contextPath;
	   
    public FiltroAutentica() {
		// TODO Auto-generated constructor stub
	}
 
    @Override
    public void doFilter(ServletRequest request,
            ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
    	
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String url = httpServletRequest .getRequestURI();
        //capturando sessao
        HttpSession sessao = httpServletRequest .getSession();
      //estar logado?
        if (sessao.getAttribute("adminLogado")!=null || url.contains("index.jsp") || url.contains("AutenticadorAdministrador2")
        		|| sessao.getAttribute("clienteLogado")!=null ) {
            chain.doFilter(request, response); //Permite o fluxo
        } else {
            ((HttpServletResponse) response).sendRedirect("../index.jsp");
        }
    }
    @Override
    public void destroy() {
    }
 
    @Override
    public void init(FilterConfig filterConfig) {
        this.contextPath = filterConfig.getServletContext().getContextPath();
    }



}
