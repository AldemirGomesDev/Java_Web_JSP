//Classe filha de usuario
package com.infopower.entidades;

public class Administrador extends Pessoa{
	
//	declara��po do contrutor
	public Administrador(String nome, String login, String senha, Endereco endereco, String telefone) {
		//uso da heran�a
		super(nome, login,senha,endereco, telefone);
	}
	public Administrador(){
		
	}
	private int matricula;

	public int getMatricula() {
		return matricula;
	}
	public void setMatricula(int matricula) {
		this.matricula = matricula;
	}
	
}
