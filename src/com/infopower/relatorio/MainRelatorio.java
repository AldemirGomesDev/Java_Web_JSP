package com.infopower.relatorio;

import java.util.List;

import com.infopower.controladores.ControladorFatura;
import com.infopower.entidades.Fatura;

public class MainRelatorio {

	public static void main(String[] args) {
	GeradorDeRelatorios relatorio = new GeradorDeRelatorios();
	Fatura fatura = new Fatura();
	ControladorFatura controlefatura = new ControladorFatura();
	List<Fatura> lista = controlefatura.listar();
	fatura = lista.get(0);
	relatorio.geraPdf(fatura);

	}

}
