package Datos;

import java.sql.SQLException;

import Dominio.Cuenta;
import Dominio.Transferencia;

public interface ITransferenciaDao {

	
	void generarTransferencia(Transferencia transferencia) throws SQLException;

}
