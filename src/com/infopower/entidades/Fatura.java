package com.infopower.entidades;


public class Fatura {
	private int id;
	private String data;
	private double consumoKw;
	private double consumoRs;
	private double consumoDia;
	private double consumoMes;
	
	public Fatura(){
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public double getConsumoKw() {
		return consumoKw;
	}

	public void setConsumoKw(double consumoKw) {
		this.consumoKw = consumoKw;
	}

	public double getConsumoRs() {
		return consumoRs;
	}

	public void setConsumoRs(double consumoRs) {
		this.consumoRs = consumoRs;
	}

	public double getConsumoDia() {
		return consumoDia;
	}

	public void setConsumoDia(double consumoDia) {
		this.consumoDia = consumoDia;
	}

	public double getConsumoMes() {
		return consumoMes;
	}

	public void setConsumoMes(double consumoMes) {
		this.consumoMes = consumoMes;
	}

	public Fatura(int id, String data, double consumoKw, double consumoRs, double consumoDia, double consumoMes) {
		super();
		this.id = id;
		this.data = data;
		this.consumoKw = consumoKw;
		this.consumoRs = consumoRs;
		this.consumoDia = consumoDia;
		this.consumoMes = consumoMes;
	}
	
}
	
	