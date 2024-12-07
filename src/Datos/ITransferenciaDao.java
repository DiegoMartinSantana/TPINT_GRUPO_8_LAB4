package Datos;

import Dominio.Cuenta;
import Dominio.Transferencia;

public interface ITransferenciaDao {
	
	/*Cuenta obtenerCuentaPorCBU2(String cbu);*/
	
	void generarTransferencia(Transferencia transferencia);

}
