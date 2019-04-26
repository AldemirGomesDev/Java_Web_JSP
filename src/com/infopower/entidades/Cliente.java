//Classe filha de usuario
package com.infopower.entidades;

public class Cliente extends Pessoa{
	
	private int id;
	private String cpf;
	
	public Cliente(String nome, String cpf, String login, String senha, Endereco endereco, String telefone) {
		//Utilização da herança
		super(nome,login,senha,endereco,telefone);

		this.cpf = cpf;
	}
	
	public Cliente(){
		super();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	
}
