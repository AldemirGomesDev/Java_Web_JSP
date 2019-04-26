package com.infopower.servlets;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.infopower.controladores.ControladorCliente;
import com.infopower.criptografia.Criptografia;
import com.infopower.entidades.Cliente;

@WebServlet("/AutenticadorCliente")
public class AutenticadorCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AutenticadorCliente() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String login = request.getParameter("user");
		String senha = Criptografia.criptografar(request.getParameter("pass"));
		Cliente cliente = new Cliente();
		cliente.setLogin(login);
		cliente.setSenha(senha);
		
		ControladorCliente clienteControler = new ControladorCliente();
		Cliente clienteRetorno = clienteControler.autenticar(cliente);
		
		if(clienteRetorno!=null){
			//criançao sessao
			HttpSession session =  request.getSession();
			session.setAttribute("clienteLogado", clienteRetorno);
			
			// vamos obter o valor do timeout da sessão
		    int timeout = session.getMaxInactiveInterval(); 
		    response.getWriter().println("Timeout: " + timeout);
			
			//encaminhando ao index
			response.sendRedirect("JSP/Usuario.jsp");
		}else{
			response.sendRedirect("naoLogado.html");
			
		}	
	}
}