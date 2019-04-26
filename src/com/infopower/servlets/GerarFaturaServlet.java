package com.infopower.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infopower.entidades.Cliente;
import com.infopower.entidades.Fatura;
import com.infopower.relatorio.GeradorDeRelatorios;

import javafx.scene.chart.PieChart.Data;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

@WebServlet("/GerarFaturaServlet")
public class GerarFaturaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public GerarFaturaServlet() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		String acao = request.getParameter("acao");
		Fatura fatura;
			if(acao != null && acao.equals(request.getParameter("acao"))){
				
				int id = Integer.parseInt(request.getParameter("id"));
				
				String data = request.getParameter("data_fatura");
				
				double consumoRs = Double.parseDouble(request.getParameter("consumo_rs"));
				double consumoKw = Double.parseDouble(request.getParameter("consumo_kw"));
				double consumoDia = Double.parseDouble(request.getParameter("consumo_dia"));
				double consumoMes = Double.parseDouble(request.getParameter("consumo_mes"));
				
				fatura = new Fatura(id, data,  consumoKw, consumoRs, consumoDia, consumoMes);
				
				// gera relatório
		        geraPdf(fatura);
		        response.sendRedirect("JSP/listaFatura.jsp");
			}


	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
	public void geraPdf(Fatura fatura) {

        try {
        	System.out.println("Gerando relatório 2...");
    		
    		
    		JREmptyDataSource jed = new JREmptyDataSource();
    		HashMap<String, Object> parametros = new HashMap<String, Object>();
    		
    		//passa os valores da fatura para Ireport
    		parametros.put("idFatura", fatura.getId());
    		parametros.put("dataFatura", fatura.getData());
    		parametros.put("consumoDia", fatura.getConsumoDia());
    		parametros.put("consumoMes", fatura.getConsumoMes());
    		parametros.put("consumoKw", fatura.getConsumoKw());
    		parametros.put("consumoReal", fatura.getConsumoRs());
    		 
            // compila jrxml e gera o jasper
    		String jrxml = getServletContext().getRealPath("/relatorio") + "/relatorio.jrxml ";
    		String jasper = JasperCompileManager.compileReportToFile(jrxml);
    		System.out.println("Arquivo Copilado com Sucesso! 2 "); // alunos.jaspe

            // preenche relatorio
    		JasperPrint jp = JasperFillManager.fillReport(getServletContext().getRealPath("/relatorio") + "/relatorio.jasper ", parametros,jed);
    		//abri o relatorio na tela
    		JasperViewer.viewReport(jp, false);
    		System.out.println("RELATORIO GERADO COM SUCESSO");
    		
    		//Gera o arquivo pdf
    		//JasperExportManager.exportReportToPdfFile(jp, "relatorio/relatorio.pdf");

        } catch (Exception e) {
            throw new RuntimeException("Erro ao gerar relatório", e);
        }
    }   

}
