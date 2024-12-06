package Datos;

import Dominio.Cuenta;

public interface ITransferenciaDao {
	
	Cuenta obtenerCuentaPorCBU2(String cbu);

}
