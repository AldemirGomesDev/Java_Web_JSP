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

import com.infopower.controladores.ControladorAdmin;
import com.infopower.controladores.ControladorCliente;
import com.infopower.criptografia.Criptografia;
import com.infopower.entidades.Administrador;
import com.infopower.entidades.Cliente;
import com.infopower.entidades.Endereco;
import com.infopower.exception.ClienteExisteException;
import com.infopower.jdbcConnection.AdministradorDAO;

import groovy.ui.SystemOutputInterceptor;

import com.infopower.jdbcConnection.AdministradorDAO;


@WebServlet("/admControle")
public class CadastroAdmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public CadastroAdmServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		AdministradorDAO adminDao = new AdministradorDAO();
		
		if(acao != null && acao.equals("exc")){
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			Administrador admin = new Administrador();
			admin.setMatricula(id);
			adminDao.excluir(admin);
			
			response.sendRedirect("JSP/listaAdmin.jsp");
		}
		if(acao != null && acao.equals("alt")){
			
			String id = request.getParameter("id");
			
			Administrador admin = new Administrador();
			admin = adminDao.procurar(Integer.parseInt(id));
			request.setAttribute("admin", admin);
			RequestDispatcher saida = request.getRequestDispatcher("JSP/atualizarAdministrador.jsp");
			saida.forward(request, response);
				
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String acao = request.getParameter("acao");
		
			if(acao != null && acao.equals("salv")){
				//recebe dados da tela
				String nome = request.getParameter("nomeAdm");
				String login = request.getParameter("loginAdm");
				String senha = Criptografia.criptografar(request.getParameter("senhaAdm"));
				String telefone = request.getParameter("telefoneAdm");
				String logradouro = request.getParameter("enderecoAdm");
				String bairro = request.getParameter("bairroAdm");
				int numero = Integer.parseInt(request.getParameter("numeroAdm"));
				String cep = request.getParameter("cepAdm");
				String cidade = request.getParameter("cidadeAdm");
				String estado = request.getParameter("estadoAdm");
				String pais = request.getParameter("paisAdm");
				
				//cria objeto usuario e endereço seta os valores vindos da tela
				Endereco endereco = new Endereco(logradouro, numero, bairro, cidade, cep, estado, pais);
				Administrador adm = new Administrador(nome, login, senha, endereco, telefone);
				
				//pede para controlador cadastrar no banco de dados
				ControladorAdmin controladorAdmin = new ControladorAdmin();
				try {
					controladorAdmin.cadastrar(adm,endereco);
				} catch (ClienteExisteException e) {
					// enviando mensagem de erro
					
					System.out.println(e.getMessage());
					/*PrintWriter out = response.getWriter();
					out.println("<html>");
					out.println("<body>");
					out.println("<H3>LOGIN OU SENHA JÁ EXISTE!</H3>");
					out.println("<a href='#' onclick='history.go(-1);'>voltar</a>");
					out.println("</body>");
					out.println("</html>");
					 out.close();
					 */
					RequestDispatcher saida = request.getRequestDispatcher("JSP/naoLogado.jsp");
					saida.forward(request, response);
				}
				
				response.setContentType("text/html");
			      // grava no banco e retorna pra pagina de admin logado
				 response.sendRedirect("JSP/cadastroAdmin.jsp"); 
			}
			if(acao != null && acao.equals("alt")){
				
				int id = Integer.parseInt(request.getParameter("matricula"));
				String nome = request.getParameter("nomeAdm");
				String login = request.getParameter("loginAdm");
				String senha = Criptografia.criptografar(request.getParameter("senhaAdm"));
				String telefone = request.getParameter("telefoneAdm");
				String logradouro = request.getParameter("enderecoAdm");
				int numero = Integer.parseInt(request.getParameter("numeroAdm"));
				String bairro = request.getParameter("bairroAdm");
				String cep = request.getParameter("cepAdm");
				String cidade = request.getParameter("cidadeAdm");
				String estado = request.getParameter("estadoAdm");
				String pais = request.getParameter("paisAdm");
				
				//cria objeto usuario e endereco seta os valores vindos da tela
				Endereco endereco = new Endereco(logradouro, numero, bairro, cidade, cep, estado, pais);
				Administrador admin = new Administrador(nome,  login, senha, endereco, telefone);
				admin.setMatricula(id);
				//pede para ControladorCliente cadastrar no banco de dados
				
				ControladorAdmin controladorAdmin = new ControladorAdmin();
				controladorAdmin.alterar(admin, endereco);
				
			      String site = new String("JSP/listaAdmin.jsp");

			      response.setStatus(response.SC_MOVED_TEMPORARILY);
			      response.setHeader("Location", site);
			}

		}
	

}
