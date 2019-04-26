package com.infopower.jdbcConnection;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import com.infopower.entidades.Administrador;

public class ArduinoDAO implements InterfaceArduino{
	
	private Connection con = (Connection) Conexao.getInstacia().getConector();
	private PreparedStatement preparador = null;
	private ArrayList<Double>lista;
	private Calendar hora;
	private String data;
	@Override
	public void cadastrar(double kw, String data) throws IOException {
		BufferedWriter escrever = new BufferedWriter(
				new FileWriter("C:/Users/Mathe/Desktop/Arduino-"+data+".txt", true));
		escrever.write(""+kw);	
            escrever.newLine();
            escrever.flush(); 
            escrever.close();
	}
	@Override
	public ArrayList<Double> somatoriaDiaria() throws IOException{
		lista = new ArrayList<>();
		hora = new GregorianCalendar();
		int dia = hora.get(GregorianCalendar.DAY_OF_MONTH);
		int mes = hora.get(GregorianCalendar.MONTH);
		int ano = hora.get(GregorianCalendar.YEAR);
		dia = dia - 1;
		mes = mes + 1;
		
		if(mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12){
			if(dia == 0){
				dia = 31;
			}
		}
		else if(mes == 4 || mes == 6 || mes == 9 || mes == 11){
			if(dia == 0){
				dia = 30;
			}
		}
		else{
			dia = 28;
		}
		String data = dia+"-"+mes+"-"+ano;
		BufferedReader ler = new BufferedReader(
				new FileReader("C:/Users/Mathe/Desktop/Arduino-"+data+".txt"));
		
		while(ler.ready()){
			double kw = Double.parseDouble(ler.readLine());
			lista.add(kw);
		}
		ler.close();
		return lista;
	}
	
	@Override
	public void cadastrarJDBC(double kw, double reais) throws SQLException{
		double kwMesCadastra = kw;
		
		String sql = "SELECT * FROM FATURA";
		
		lista = new ArrayList<>();
		
		try {
			preparador = con.prepareStatement(sql);
			ResultSet resultado = preparador.executeQuery();
			while(resultado.next()){
				double kwMes = resultado.getDouble("consumo_dia");
				lista.add(kwMes);
			}
			
			for (double kwMesSoma : lista) {
				kwMesCadastra += kwMesSoma;
			}
			}catch (Exception e) {
				
			}
			preparador.close();
			
		String sql2 = "INSERT INTO fatura (consumo_dia, consumo_reais, data_fatura, consumo_mes) values (?,?,?,?)";
		
		int dia = hora.get(GregorianCalendar.DAY_OF_MONTH);
		int mes = hora.get(GregorianCalendar.MONTH);
		int ano = hora.get(GregorianCalendar.YEAR);
		dia = dia - 1;
		mes = mes + 1;
		if(mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12){
			if(dia == 0){
				dia = 31;
			}
		}
		else if(mes == 4 || mes == 6 || mes == 9 || mes == 11){
			if(dia == 0){
				dia = 30;
			}
		}
		else{
			dia = 28;
		}
		
		String dataCadastro = dia+"/"+mes+"/"+ano; 
		this.data = dataCadastro;
		try {
			if(autenticarExiste() == false){
				preparador = con.prepareStatement(sql2);
				preparador.setDouble(1, kw);
				preparador.setDouble(2, reais);
				preparador.setString(3, dataCadastro);
				preparador.setDouble(4, kwMesCadastra);
				preparador.execute();
				preparador.close();

				System.out.println("Consumo Cadastrado com SUCESSO!");
				}
			} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean autenticarExiste() {
		String sql = "SELECT * FROM FATURA WHERE data_fatura=?";
		boolean existe = false;
		try {
			preparador = con.prepareStatement(sql);
			preparador.setString(1, data);
			ResultSet resultado = preparador.executeQuery();
			existe = resultado.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return existe;
	}
}