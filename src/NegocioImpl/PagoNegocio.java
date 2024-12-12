package NegocioImpl;

import java.util.ArrayList;

import Datos.IPagoDao;
import DatosImpl.PagoDao;
import Dominio.Cuota;
import Dominio.Pago;
import Negocio.IPagoNegocio;

public class PagoNegocio implements IPagoNegocio{

	private IPagoDao pagoDao =  new PagoDao();
	
	
	
	@Override
	public boolean realizarPago(Pago pago) throws Exception {

		pagoDao.generarPago(pago);
		return true;
		
	}
	
	public ArrayList<Cuota> getCuotasByPrestamo(int idPrestamo){
		
		return pagoDao.getCuotasByPrestamo(idPrestamo);
		

	}
	
	public boolean PagarCuota(Pago pago){

		return true;
		
	}
	
}
 