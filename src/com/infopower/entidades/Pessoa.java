//Classe pai de Administrador e Cliente
package com.infopower.entidades;

public class Pessoa extends Endereco{
	

	private String nome;
	private String login;
	private String senha;
	Endereco endereco = new Endereco();
	private String telefone;
	
	public Pessoa(String nome, String login, String senha,Endereco endereco, String telefone) {
	this.nome = nome;
	this.login = login;
	this.senha = senha;
	this.endereco = endereco;
	this.telefone = telefone;
	}
	public Pessoa(){
		
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	public Endereco getEnd() {
		return endereco;
	}
	public void setEnd(Endereco end) {
		this.endereco = end;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
}
