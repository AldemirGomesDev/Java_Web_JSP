package com.infopower.entidades;

public class Tarifa {

	private int idTarifa;
	private String nome;
	private double valor;
	public Tarifa( String nome, double valor) {
		super();
		this.nome = nome;
		this.valor = valor;
	}
	
	public Tarifa(){
		
	}

	public int getIdTarifa() {
		return idTarifa;
	}

	public void setIdTarifa(int idTarifa) {
		this.idTarifa = idTarifa;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}
	
}
