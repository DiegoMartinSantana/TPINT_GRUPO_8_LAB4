package Negocio;

import Dominio.Pago;

public interface IPagoNegocio {

	public boolean realizarPago(Pago pago) throws Exception;
	
}
