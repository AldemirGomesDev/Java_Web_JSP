package com.infopower.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infopower.controladores.ControladorAdmin;
import com.infopower.controladores.ControladorCliente;
import com.infopower.entidades.Cliente;
import com.infopower.jdbcConnection.ClienteDAO;

@WebServlet("/ExcluirServlet")
public class ExcluirServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExcluirServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	/*	Cliente cliente = new Cliente();
		ClienteDAO clientedao = new ClienteDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		cliente.setId(id);
		clientedao.excluir(cliente);
		
		RequestDispatcher rd = request.getRequestDispatcher("/lista-contatos-elegante.jsp");
		rd.forward(request, response);
		
		ControladorCliente controladorCliente = new ControladorCliente();
		controladorCliente.excluir(cliente);
		*/
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("Entrou no servlet ExcluirUsuario");
		int id = Integer.parseInt(request.getParameter("id"));  
		Cliente cliente = new Cliente();
		cliente.setId(id);
		ClienteDAO clientedao = new ClienteDAO();
		clientedao.excluir(cliente);
		//RequestDispatcher dispatcher = request.getRequestDispatcher("listar-usuarios.jsp");  
		//dispatcher.forward(request, response);
		response.sendRedirect("listar-usuarios.jsp");
	}

}
