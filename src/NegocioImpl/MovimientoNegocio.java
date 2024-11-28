package NegocioImpl;

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
		// TODO Auto-generated method stub
		return movimientoDao.crearMovimiento(movimiento);
	}

	@Override
	public List<Movimiento> listarMovimiento() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Movimiento obtenerMovimientoPorId(int idMovimiento) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
