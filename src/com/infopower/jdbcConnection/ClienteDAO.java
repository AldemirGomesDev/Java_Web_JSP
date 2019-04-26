package com.infopower.jdbcConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.infopower.exception.ClienteExisteException;

import javax.swing.JOptionPane;

import com.infopower.entidades.Cliente;
import com.infopower.entidades.Endereco;

public class ClienteDAO implements InterfaceCliente{

	Connection con = (Connection) Conexao.getInstacia().getConector();
	List<Cliente> lista = new ArrayList<Cliente>();

	
	public void cadastrar(Cliente cliente, Endereco endereco) {
		String sql = "INSERT INTO CLIENTE (nome, login, senha, telefone, cpf_cliente, logradouro, numero, bairro, cidade, cep, estado, pais) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		//System.out.println(cliente.getBairro()+""+cliente.getCidade()+"\n"+endereco.getBairro()+""+endereco.getCidade());
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, cliente.getNome());
			preparador.setString(2, cliente.getLogin());
			preparador.setString(3, cliente.getSenha());
			preparador.setString(4, cliente.getTelefone());
			preparador.setString(5, cliente.getCpf());
			preparador.setString(6, endereco.getLogradouro());
			preparador.setInt(7, endereco.getNumero());
			preparador.setString(8, endereco.getBairro());
			preparador.setString(9, endereco.getCidade());
			preparador.setString(10, endereco.getCep());
			preparador.setString(11, endereco.getEstado());
			preparador.setString(12, endereco.getPais());
			preparador.execute();
			preparador.close();

			System.out.println("Cadastrado com SUCESSO!");
		} catch (SQLException e) {

			e.printStackTrace();
		}
}

	public void alterar(Cliente cliente, Endereco endereco) {
		String sql = "UPDATE CLIENTE SET  nome=?, login=?, senha=?, telefone=?, cpf_cliente=?, logradouro=?, numero=?, bairro=?, cidade=?, cep=?, estado=?, pais=? WHERE id_cliente=?";

		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, cliente.getNome());
			preparador.setString(2, cliente.getLogin());
			preparador.setString(3, cliente.getSenha());
			preparador.setString(4, cliente.getTelefone());
			preparador.setString(5, cliente.getCpf());
			preparador.setString(6, endereco.getLogradouro());
			preparador.setInt(7, endereco.getNumero());
			preparador.setString(8, endereco.getBairro());
			preparador.setString(9, endereco.getCidade());
			preparador.setString(10, endereco.getCep());
			preparador.setString(11, endereco.getEstado());
			preparador.setString(12, endereco.getPais());
			preparador.setInt(13, cliente.getId());

			preparador.execute();
			preparador.close();

			System.out.println("Alterado com SUCESSO!");
		} catch (SQLException e) {

			JOptionPane.showMessageDialog(null, e);
		}
	}

	public void excluir(Cliente cliente) {
		String sql = "DELETE FROM CLIENTE WHERE id_cliente=?";

		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, cliente.getId());

			preparador.execute();
			preparador.close();

			System.out.println("Apagado com SUCESSO!");
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public List<Cliente> listar() {
		String sql = "SELECT * FROM CLIENTE";
		List<Cliente> clientes = new ArrayList<Cliente>();
		try {
			PreparedStatement preparador = con.prepareStatement(sql);

			ResultSet resultado = preparador.executeQuery();

			while (resultado.next()) {

				Cliente cliente = new Cliente();
				cliente.setId(resultado.getInt("id_cliente"));
				cliente.setNome(resultado.getString("nome"));
				cliente.setLogin(resultado.getString("login"));
				cliente.setSenha(resultado.getString("senha"));
				cliente.setTelefone(resultado.getString("telefone"));
				cliente.setBairro(resultado.getString("bairro"));
				cliente.setLogradouro(resultado.getString("logradouro"));
				cliente.setNumero(resultado.getInt("numero"));
				cliente.setCidade(resultado.getString("cidade"));
				cliente.setCep(resultado.getString("cep"));
				cliente.setEstado(resultado.getString("estado"));
				cliente.setPais(resultado.getString("pais"));
				cliente.setCpf(resultado.getString("cpf_cliente"));
				clientes.add(cliente);
			}

			preparador.close();

			//System.out.println("Lista Apresentada");
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return clientes;
	}

	public Cliente procurar(Integer id) {
		String sql = "SELECT * FROM Cliente WHERE ID_CLIENTE=?";
		Cliente cliente = null;
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, id);

			ResultSet resultado = preparador.executeQuery();
			
			resultado.next();
			
			cliente = new Cliente();
			cliente.setId(resultado.getInt("id_cliente"));
			cliente.setNome(resultado.getString("nome"));
			cliente.setLogin(resultado.getString("login"));
			cliente.setSenha(resultado.getString("senha"));
			cliente.setTelefone(resultado.getString("telefone"));
			cliente.setBairro(resultado.getString("bairro"));
			cliente.setLogradouro(resultado.getString("logradouro"));
			cliente.setNumero(resultado.getInt("numero"));
			cliente.setCidade(resultado.getString("cidade"));
			cliente.setCep(resultado.getString("cep"));
			cliente.setEstado(resultado.getString("estado"));
			cliente.setPais(resultado.getString("pais"));
			cliente.setCpf(resultado.getString("cpf_cliente"));
			resultado.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cliente;
	}

	public List<Cliente> procurarNome(String nome) {
		String sql = "SELECT * FROM Cliente WHERE nome like";
		List<Cliente> lista = new ArrayList<Cliente>();
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, "%" + nome + "%");

			ResultSet resultado = preparador.executeQuery();
			while (resultado.next()) {
				Cliente cliente = new Cliente();

				cliente.setId(resultado.getInt("id_cliente"));
				cliente.setNome(resultado.getString("nome"));
				cliente.setLogin(resultado.getString("login"));
				cliente.setSenha(resultado.getString("senha"));
				cliente.setTelefone(resultado.getString("telefone"));
				lista.add(cliente);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lista;
	}
	
	public Cliente autenticar(Cliente cliente) {
		String sql = "SELECT * FROM Cliente WHERE login=? and senha=?";
		Cliente clienteRetorno = null;
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, cliente.getLogin());
			preparador.setString(2, cliente.getSenha());

			ResultSet resultado = preparador.executeQuery();
			if (resultado.next()) {
				clienteRetorno = new Cliente();

				clienteRetorno.setId(resultado.getInt("id_cliente"));
				clienteRetorno.setNome(resultado.getString("nome"));
				clienteRetorno.setLogin(resultado.getString("login"));
				clienteRetorno.setSenha(resultado.getString("senha"));
				clienteRetorno.setTelefone(resultado.getString("telefone"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return clienteRetorno;
	}

	public Boolean autenticarExiste(Cliente cliente) {
		String sql = "SELECT * FROM Cliente WHERE login=? and senha=?";
		boolean existe = false;
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, cliente.getLogin());
			preparador.setString(2, cliente.getSenha());

			ResultSet resultado = preparador.executeQuery();
			existe = resultado.next();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return existe;
	}
	public Boolean Existe(Cliente cliente) throws SQLException {
		String sql = "SELECT * FROM Cliente WHERE id_cliente=?";
		boolean existe = false;
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, cliente.getId());

			ResultSet resultado = preparador.executeQuery();
			existe = resultado.next();

		} catch (SQLException e) {
			
		}
		return existe;
	}

	@Override
	public Cliente autenticar2(String nome, String senha) {
		// TODO Auto-generated method stub
		return null;
	}

}
