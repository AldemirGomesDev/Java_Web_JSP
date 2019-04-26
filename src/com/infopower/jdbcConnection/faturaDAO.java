package com.infopower.jdbcConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.infopower.entidades.Fatura;

public class faturaDAO implements InterfaceFatura{
	
	Connection con = (Connection) Conexao.getInstacia().getConector();
	List<Fatura> lista = new ArrayList<Fatura>();

	@Override
	public void cadastrar(Fatura fatura) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void alterar(Fatura fatura) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void excluir(Fatura fatura) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Fatura> listar() {
		String sql = "SELECT * FROM FATURA";
		List<Fatura> faturas = new ArrayList<Fatura>();
		try {
			PreparedStatement preparador = con.prepareStatement(sql);

			ResultSet resultado = preparador.executeQuery();

			while (resultado.next()) {

				Fatura fatura = new Fatura();
				fatura.setId(resultado.getInt("id_fatura"));
				fatura.setData(resultado.getString("data_fatura"));
				fatura.setConsumoDia(resultado.getDouble("consumo_dia"));
				fatura.setConsumoMes(resultado.getDouble("consumo_mes"));
				fatura.setConsumoKw(resultado.getDouble("consumo_kw"));
				fatura.setConsumoRs(resultado.getDouble("consumo_reais"));
				faturas.add(fatura);
			
			}

			preparador.close();

			//System.out.println("Lista Apresentada");
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return faturas;
	}

	@Override
	public Boolean Existe(Fatura fatura) {
		// TODO Auto-generated method stub
		return null;
	}

}
