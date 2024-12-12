package NegocioImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DatosImpl.CuentaDao;
import DatosImpl.MovimientoDao;
import DatosImpl.PrestamoDao;
import Dominio.Cuenta;
import Dominio.Movimiento;
import Negocio.IMovimientoNegocio;

public class MovimientoNegocio implements IMovimientoNegocio  {
	
	private MovimientoDao movimientoDao;
	private CuentaDao cuentaDao ;
	private PrestamoDao prestamoDao = new PrestamoDao();
	public MovimientoNegocio() {
        this.movimientoDao = MovimientoDao.obtenerInstancia();
        this.cuentaDao = CuentaDao.obtenerInstancia();
    }


	@Override
	public boolean crearMovimiento(Movimiento movimiento){
		
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
		
		ArrayList<Movimiento> movimientos =  movimientoDao.obtenerUltimasTransferencias(idCuenta);
	
		return movimientos;
	}


	@Override
	public Cuenta obtenerCuentaPorCBU(String cbu) {
		return movimientoDao.obtenerCuentaPorCBU(cbu);
	}


	@Override
	public boolean crearMovimiento2(Movimiento movimiento) {
		return movimientoDao.crearMovimiento2(movimiento);
	}

	
	

}