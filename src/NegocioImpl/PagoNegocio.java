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
	
	public int PagarCuota(int idCuota,int idCuentaDebitar ){
		CuentaDao cuentaDao;
		Pago pago = pagoDao.obtenerPago(idCuota);
		PrestamoDto prestamo = prestamoDao.obtenerPrestamoPorIdV2(pago.getIdPrestamo());
		cuentaDao = CuentaDao.obtenerInstancia();
		Cuenta cuenta = cuentaDao.obtenerCuentaPorId(idCuentaDebitar);
		if(cuenta.getSaldo()<prestamo.montoCuota ) {
			//saldo insuficiente
			return 2;
		}
		pagoDao.generarPago(pago);
		return 1;
		
	}
	
}
 