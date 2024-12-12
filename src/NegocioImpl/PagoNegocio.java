package NegocioImpl;

import java.util.ArrayList;

import Datos.IPagoDao;
import DatosImpl.CuentaDao;
import DatosImpl.PagoDao;
import DatosImpl.PrestamoDao;
import Dominio.Cuenta;
import Dominio.Cuota;
import Dominio.Pago;
import Dominio.Prestamo;
import Dominio.Dto.PrestamoDto;
import Negocio.IPagoNegocio;

public class PagoNegocio implements IPagoNegocio{

	private IPagoDao pagoDao =  new PagoDao();
	private PrestamoDao prestamoDao = new PrestamoDao();
	
	
	
	@Override
	public boolean realizarPago(Pago pago) throws Exception {

		pagoDao.generarPago(pago);
		return true;
		
	}
	
	public ArrayList<Cuota> getCuotasByPrestamo(int idPrestamo){
		
		return pagoDao.getCuotasByPrestamo(idPrestamo);
		

	}
	
	public Pago getCuentaByCuota(int idCuota) {
		return pagoDao.getCuentaByCuota(idCuota);
	}
	
	public boolean pagar(int idCuota) {
		
		Pago pago = new Pago();
		
		pago = getCuentaByCuota(idCuota);
				
		return pagoDao.generarPago(pago);
		
	}
}
	

 