package com.infopower.jdbcConnection;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public interface InterfaceArduino {
	public void cadastrar(double kw, String data) throws IOException;
	public ArrayList<Double> somatoriaDiaria() throws IOException;
	public void cadastrarJDBC(double kw, double reais) throws SQLException;
}
