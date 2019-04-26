package com.infopower.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infopower.controladores.ControladorTarifa;
import com.infopower.entidades.Tarifa;
import com.infopower.jdbcConnection.TarifaDAO;

@WebServlet("/TarifaControle")
public class CadastroTarifaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public CadastroTarifaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		TarifaDAO tarifaDao = new TarifaDAO();
		
			if(acao != null && acao.equals("exc")){
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			Tarifa tarifa = new Tarifa();
			tarifa.setIdTarifa(id);
			tarifaDao.excluir(tarifa);
			
			response.sendRedirect("JSP/listaTarifa.jsp");
		}

		if(acao != null && acao.equals("alt")){
			
			String id = request.getParameter("id");
			
			Tarifa tarifa = new Tarifa();
			tarifa = tarifaDao.procurar(Integer.parseInt(id));
			request.setAttribute("tarifa", tarifa);
			RequestDispatcher saida = request.getRequestDispatcher("JSP/atualizarTarifa.jsp");
			saida.forward(request, response);
				
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			String acao = request.getParameter("acao");
			
			if(acao != null && acao.equals("salv")){
				// recebe dados da tela
				String nome = request.getParameter("nomeTarifa");
				String valor = request.getParameter("valorTarifa");
	
				// cria objeto usuario e seta os valores vindos da tela
	
				Tarifa tarifa = new Tarifa();
				tarifa.setNome(nome);
				tarifa.setValor(Double.parseDouble(valor));
				
				// pede para clienteDao cadastrar no banco de dados
	
				TarifaDAO tarifaDao = new TarifaDAO();
				tarifaDao.cadastrar(tarifa);
	
				response.setContentType("text/html");
				// New location to be redirected
				String site = new String("JSP/cadastroTarifa.jsp");
	
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location", site);
			}
			if(acao != null && acao.equals("alt")){
				
				int id = Integer.parseInt(request.getParameter("id_tarifa"));
				String nome = request.getParameter("nome");
				double valor = Double.parseDouble(request.getParameter("valor"));
				
				//cria objeto usuario e endereco seta os valores vindos da tela
				Tarifa tarifa = new Tarifa(nome, valor);
				tarifa.setIdTarifa(id);
				//pede para ControladorCliente cadastrar no banco de dados
				
				ControladorTarifa tarifaControler = new ControladorTarifa();
				tarifaControler.alterar(tarifa);
				
			      String site = new String("JSP/listaTarifa.jsp");

			      response.setStatus(response.SC_MOVED_TEMPORARILY);
			      response.setHeader("Location", site);
			}
		
	}
}