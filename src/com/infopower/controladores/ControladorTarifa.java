package com.infopower.controladores;

import java.util.List;

import com.infopower.entidades.Cliente;
import com.infopower.entidades.Tarifa;
import com.infopower.jdbcConnection.InterfaceTarifa;
import com.infopower.jdbcConnection.TarifaDAO;

public class ControladorTarifa {
private InterfaceTarifa repositorioTarifa = new TarifaDAO();
	
	public void cadastar(Tarifa tarifa) {
		repositorioTarifa.cadastrar(tarifa);
	}
	
	public List<Tarifa> listar(){
		return repositorioTarifa.listar();
	}
	
	public void alterar(Tarifa tarifa){
		repositorioTarifa.alterar(tarifa);
	}
	
	public void excluir(Tarifa tarifa){
		repositorioTarifa.excluir(tarifa);
	}
	public Tarifa procurarId(Integer id){
		return repositorioTarifa.procurar(id);
	}
}