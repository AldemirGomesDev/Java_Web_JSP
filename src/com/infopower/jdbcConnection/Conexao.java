package com.infopower.jdbcConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.swing.JOptionPane;
//--------- Antigo metodo de conexão--------------------------- 
//public class Conexao {
//	
//	public static Connection getConnection(){
//	Connection con = null;
//	
//	try{
//		Class.forName("org.postgresql.Driver");
//		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/infopower", "postgres", "890");
//		System.out.println("Conectado com SUCESSO!");
//	}catch (SQLException e){
//		
//		JOptionPane.showMessageDialog(null, "Não foi possível Conectar ao Banco!");
//	} catch (ClassNotFoundException e) {
//		JOptionPane.showMessageDialog(null, "Driver não Encontrado!");
//	}
//	return con;
//	}
//
//}
//--------- Antigo metodo de conexão ---------------------------

//--------- Novo metodo de conexão ---------------------------

public class Conexao {
	private static Connection con = null;
	private static Conexao self = null;
	
	protected Connection getConector(){
		try {
			if (con == null) {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/infopower", "postgres", "123");
				System.out.println("Conectado ao BD com SUCESSO!");
			}
			return con;
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
			
		}
		return con;
}
	
	public static synchronized Conexao getInstacia() {
		if (self == null)
			return new Conexao();
		else
			return self;
	}
	@Override
	protected void finalize() throws Throwable {
		if (self != null) {
			desconectar();
		}
	}
	public void desconectar() {
		try {
			con.close();
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
		}
	}
}