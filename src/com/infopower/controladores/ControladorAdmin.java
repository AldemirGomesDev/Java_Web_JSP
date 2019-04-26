package com.infopower.controladores;

import java.util.List;

import com.infopower.entidades.Administrador;
import com.infopower.entidades.Cliente;
import com.infopower.entidades.Endereco;
import com.infopower.exception.ClienteExisteException;
import com.infopower.jdbcConnection.InterfaceAdministrador;
import com.infopower.jdbcConnection.AdministradorDAO;

public class ControladorAdmin {
	private InterfaceAdministrador repositorioAdmin = new AdministradorDAO();
		
	
	public void cadastrar(Administrador administrador, Endereco endereco) throws ClienteExisteException {
		if(repositorioAdmin.autenticarExiste(administrador) == true) throw new ClienteExisteException();
		repositorioAdmin.cadastrar(administrador, endereco);
	}

	public List<Administrador> listar() {
		return repositorioAdmin.listar();
	}
	
	public void alterar(Administrador administrador, Endereco endereco) {
		repositorioAdmin.alterar(administrador, endereco);
	}
	public Administrador procurarId(Integer id){
		return repositorioAdmin.procurar(id);
	}
		
	public void excluir(Administrador administrador) {
		repositorioAdmin.excluir(administrador);
	}
		
	public Administrador autenticar(Administrador administrador) {
		return repositorioAdmin.autenticar(administrador);
	}
	public Administrador autenticar2(String login, String senha) {
		return repositorioAdmin.autenticar2(login, senha);
	}
}