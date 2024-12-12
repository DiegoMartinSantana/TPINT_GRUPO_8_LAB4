package Datos;

import java.util.ArrayList;

import Dominio.Cuota;
import Dominio.Pago;

public interface IPagoDao {

	boolean generarPago(Pago pago);
	public ArrayList<Cuota> getCuotasByPrestamo(int idPrestamo);
	public Pago getCuentaByCuota(int idCuota);
	
}

	
	
