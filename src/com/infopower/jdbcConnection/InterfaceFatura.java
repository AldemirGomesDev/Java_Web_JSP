package com.infopower.jdbcConnection;

import java.util.List;

import com.infopower.entidades.Fatura;


public interface InterfaceFatura {
	
	public void cadastrar (Fatura fatura);
	public void alterar (Fatura fatura);
	public void excluir (Fatura fatura);
	public List<Fatura> listar();
	public Boolean Existe(Fatura fatura);

}
