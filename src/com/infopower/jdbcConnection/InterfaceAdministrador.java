package com.infopower.jdbcConnection;

import java.util.List;

import com.infopower.entidades.Administrador;
import com.infopower.entidades.Endereco;

public interface InterfaceAdministrador {
	
	public void cadastrar (Administrador administrador, Endereco endereco);
	public void alterar (Administrador administrador, Endereco endereco);
	public void excluir (Administrador administrador);
	public List<Administrador> listar();
	public Administrador procurar(Integer id);
	public List<Administrador> procurarNome(String nome);
	public Administrador autenticar(Administrador administrador);
	public Administrador autenticar2(String login, String senha);
	public Boolean autenticarExiste(Administrador administrador);

}
