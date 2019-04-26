package com.infopower.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infopower.controladores.ControladorArduino;

@WebServlet("/ArduinoServlet")
public class ArduinoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Calendar hora;
	
    public ArduinoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		double ampers = Double.parseDouble(request.getParameter("ampers"));
		double kw = Double.parseDouble(request.getParameter("kw"));
		double potencia = Double.parseDouble(request.getParameter("potencia"));
		
		hora = new GregorianCalendar();
		
		//-------define os dias para gravar o arquivo----------- 
		int dia = hora.get(GregorianCalendar.DAY_OF_MONTH);
		int mes = hora.get(GregorianCalendar.MONTH);
		int ano = hora.get(GregorianCalendar.YEAR);
		
		String data = dia+"-"+(mes + 1)+"-"+ano;
		
		try {
		ControladorArduino controlerArduino = new ControladorArduino();
			controlerArduino.cadastrar(kw, data);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}