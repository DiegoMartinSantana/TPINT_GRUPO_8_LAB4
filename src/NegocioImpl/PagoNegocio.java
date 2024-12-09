package NegocioImpl;

import Datos.IPagoDao;
import DatosImpl.PagoDao;
import Dominio.Pago;
import Negocio.IPagoNegocio;

public class PagoNegocio implements IPagoNegocio{

	private IPagoDao pagoDao =  new PagoDao();
	
	@Override
	public boolean realizarPago(Pago pago) throws Exception {

		pagoDao.generarPago(pago);
		return true;
		
	}
	
}
