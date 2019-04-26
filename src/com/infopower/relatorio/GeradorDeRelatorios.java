package com.infopower.relatorio;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;

import com.infopower.entidades.Fatura;
import com.infopower.jdbcConnection.faturaDAO;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

public class GeradorDeRelatorios {
	
	private Connection conexao;

    public GeradorDeRelatorios() {
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
    		//String pathJasper = getServletContext().getRealPath("/cadastros/cf/relatorio") + "/teste1.jasper ";
    		String jrxml = "relatorio/relatorio.jrxml";
    		String jasper = JasperCompileManager.compileReportToFile(jrxml);
    		System.out.println("Arquivo Copilado com Sucesso! 2 " + jasper); // alunos.jaspe

            // preenche relatorio
    		JasperPrint jp = JasperFillManager.fillReport("relatorio/relatorio.jasper", parametros,jed);
    		//abri o relatorio na tela
    		JasperViewer.viewReport(jp);
    		System.out.println("RELATORIO GERADO COM SUCESSO");
    		
    		//Gera o arquivo pdf
    		//JasperExportManager.exportReportToPdfFile(jp, "relatorio/relatorio.pdf");

        } catch (Exception e) {
            throw new RuntimeException("Erro ao gerar relatório", e);
        }
    }   

}
