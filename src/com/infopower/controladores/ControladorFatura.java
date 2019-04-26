package com.infopower.controladores;

import java.util.List;

import com.infopower.entidades.Fatura;
import com.infopower.jdbcConnection.InterfaceFatura;
import com.infopower.jdbcConnection.faturaDAO;

public class ControladorFatura {
private InterfaceFatura repositorioFatura = new faturaDAO();
	
	public void cadastar(Fatura fatura) {
		repositorioFatura.cadastrar(fatura);
	}
	
	public List<Fatura> listar(){
		return repositorioFatura.listar();
	}
	
	public void alterar(Fatura fatura){
		repositorioFatura.alterar(fatura);
	}
	
	public void excluir(Fatura fatura){
		repositorioFatura.excluir(fatura);
	}
}


