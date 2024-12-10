package Negocio;

import java.util.ArrayList;

import Dominio.Cuota;
import Dominio.Pago;

public interface IPagoNegocio {

	 public boolean realizarPago(Pago pago) throws Exception;
	public ArrayList<Cuota> getCuotasByPrestamo(int idPrestamo);
	
}
