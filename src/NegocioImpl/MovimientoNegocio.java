package NegocioImpl;

import java.util.ArrayList;
import java.util.List;


import DatosImpl.MovimientoDao;
import Dominio.Movimiento;
import Negocio.IMovimientoNegocio;

public class MovimientoNegocio implements IMovimientoNegocio  {
	
	private MovimientoDao movimientoDao;
	
	public MovimientoNegocio() {
        this.movimientoDao = MovimientoDao.obtenerInstancia();
    }


	@Override
	public boolean crearMovimiento(Movimiento movimiento) {
		
		return movimientoDao.crearMovimiento(movimiento);
	}

	@Override
	public List<Movimiento> listarMovimiento() {
		
		return null;
	}

	@Override
	public Movimiento obtenerMovimientoPorId(int idMovimiento) {
		
		return null;
	}


	@Override
	public ArrayList<Movimiento> obtenerUltimasTransferencias(int idCuenta) {
		
		return movimientoDao.obtenerUltimasTransferencias(idCuenta);
	}
	

}
