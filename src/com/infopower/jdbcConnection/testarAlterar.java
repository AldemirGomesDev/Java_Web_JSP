package com.infopower.jdbcConnection;


import java.util.List;

import com.infopower.controladores.ControladorCliente;
import com.infopower.entidades.Cliente;

public class testarAlterar {

	public static void main(String[] args) {
		int id = 2;
		ClienteDAO clientedao = new ClienteDAO();
		Cliente cliente = new Cliente();
		Boolean existe = false;
		ControladorCliente controladorCliente = new ControladorCliente();
		cliente = controladorCliente.procurarId(id);
		//existe = controladorCliente.existe(cliente);
		if(existe==true){
			
			System.out.println("Nome: " +cliente.getNome()+ "");
			
		}else{
			System.out.println("ID NÃO EXISTE!!");
		}
		
	}

}
