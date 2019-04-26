package com.infopower.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.infopower.controladores.ControladorCliente;
import com.infopower.criptografia.Criptografia;
import com.infopower.entidades.Cliente;
import com.infopower.entidades.Endereco;
import com.infopower.exception.ClienteExisteException;
import com.infopower.jdbcConnection.ClienteDAO;

@WebServlet("/ClienteServlet")
public class CadastroClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CadastroClienteServlet() {
        super();
    }
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		ClienteDAO clienteDao = new ClienteDAO();
		
		if(acao != null && acao.equals("exc")){
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			Cliente cliente = new Cliente();
			cliente.setId(id);
			clienteDao.excluir(cliente);
			
			response.sendRedirect("JSP/listaCliente.jsp");
		}
		if(acao != null && acao.equals("alt")){
			
			String id = request.getParameter("id");
			
			Cliente cliente = new Cliente();
			cliente = clienteDao.procurar(Integer.parseInt(id));
			request.setAttribute("cliente", cliente);
			RequestDispatcher saida = request.getRequestDispatcher("JSP/atualizarCliente.jsp");
			saida.forward(request, response);
				
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		
		if(acao != null && acao.equals("salv")){
			
			String nome = request.getParameter("nomeUser");
			String login = request.getParameter("loginUser");
			String senha = Criptografia.criptografar(request.getParameter("senhaUser"));
			String telefone = request.getParameter("telefoneUser");
			String logradouro = request.getParameter("enderecoUser");
			int numero = Integer.parseInt(request.getParameter("numeroUser"));
			String bairro = request.getParameter("bairroUser");
			String cep = request.getParameter("cepUser");
			String cidade = request.getParameter("cidadeUser");
			String estado = request.getParameter("estadoUser");
			String pais = request.getParameter("paisUser");
			String cpf = request.getParameter("cpfUser");
			
			//cria objeto usuario e endereco seta os valores vindos da tela
			Endereco endereco = new Endereco(logradouro, numero, bairro, cidade, cep, estado, pais);
			Cliente cliente = new Cliente(nome, cpf, login, senha, endereco, telefone);
			
		
			//pede para ControladorCliente cadastrar no banco de dados
			
			ControladorCliente clienteControler = new ControladorCliente();
			
				try {
					clienteControler.cadastar(cliente,endereco);
				} catch (ClienteExisteException e) {
					
					System.out.println(e.getMessage());
					
					RequestDispatcher saida = request.getRequestDispatcher("JSP/naoLogado.jsp");
					saida.forward(request, response);
				}
				request.setAttribute("cliente", cliente);
				
				request.setAttribute("mensagem", "Post salvo com sucesso!");
				
			    String site = new String("JSP/cadastroCliente.jsp");

			     response.setStatus(response.SC_MOVED_TEMPORARILY);
			     response.setHeader("Location", site);
			
			 
			
		}
		if(acao != null && acao.equals("alt")){
			
			int id = Integer.parseInt(request.getParameter("id_cliente"));
			String nome = request.getParameter("nomeUser");
			String login = request.getParameter("loginUser");
			String senha = Criptografia.criptografar(request.getParameter("senhaUser"));
			String telefone = request.getParameter("telefoneUser");
			String logradouro = request.getParameter("enderecoUser");
			int numero = Integer.parseInt(request.getParameter("numeroUser"));
			String bairro = request.getParameter("bairroUser");
			String cep = request.getParameter("cepUser");
			String cidade = request.getParameter("cidadeUser");
			String estado = request.getParameter("estadoUser");
			String pais = request.getParameter("paisUser");
			String cpf = request.getParameter("cpfUser");
			
			//cria objeto usuario e endereco seta os valores vindos da tela
			Endereco endereco = new Endereco(logradouro, numero, bairro, cidade, cep, estado, pais);
			Cliente cliente = new Cliente(nome, cpf, login, senha, endereco, telefone);
			cliente.setId(id);
			//pede para ControladorCliente cadastrar no banco de dados
			
			ControladorCliente clienteControler = new ControladorCliente();
			clienteControler.alterar(cliente, endereco);
			
		      String site = new String("JSP/listaCliente.jsp");

		      response.setStatus(response.SC_MOVED_TEMPORARILY);
		      response.setHeader("Location", site);
		}
		 
	}
}