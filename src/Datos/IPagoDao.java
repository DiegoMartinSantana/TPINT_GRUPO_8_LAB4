package Datos;

import java.util.ArrayList;

import Dominio.Cuota;
import Dominio.Pago;

public interface IPagoDao {

	void generarPago(Pago pago);
	public ArrayList<Cuota> getCuotasByPrestamo(int idPrestamo);
	
}
