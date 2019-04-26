package com.infopower.jdbcConnection;

import java.util.List;

import com.infopower.entidades.Tarifa;

public interface InterfaceTarifa {
	
	public void cadastrar (Tarifa tarifa);
	public void alterar (Tarifa tarifa);
	public void excluir (Tarifa tarifa);
	public List<Tarifa> listar();
	public Boolean Existe(Tarifa tarifa);
	public Tarifa procurar(Integer id);

}
