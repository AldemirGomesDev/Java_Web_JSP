package com.infopower.controladores;

import java.io.IOException;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import com.infopower.jdbcConnection.ArduinoDAO;
import com.infopower.jdbcConnection.InterfaceArduino;

public class ControladorArduino {

	private InterfaceArduino arduino = new ArduinoDAO();
	
	public ControladorArduino() {
	
	}
	
	public void cadastrar(double kw, String data) throws SQLException{
		try {
			arduino.cadastrar(kw, data);
			
		} catch (IOException e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "Erro no Arquivo",JOptionPane.ERROR_MESSAGE);
			}
		cadastrarJDBC();
	}
	
	private double somatoriaDiaria(){
		
		double somatorio = 0;
		
		try {
		
			for(double soma : arduino.somatoriaDiaria()){
				somatorio += soma; 
			}	
		} catch (IOException e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "Erro no Arquivo",JOptionPane.ERROR_MESSAGE);
		}
		return somatorio;
	}
	
	public void cadastrarJDBC() throws SQLException{
		double valor = somatoriaDiaria() * 0.003875;
		arduino.cadastrarJDBC(somatoriaDiaria(), valor);
	}
}