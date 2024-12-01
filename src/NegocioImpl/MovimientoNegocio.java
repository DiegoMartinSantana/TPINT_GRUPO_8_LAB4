package NegocioImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DatosImpl.CuentaDao;
import DatosImpl.MovimientoDao;
import DatosImpl.PrestamoDao;
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
		/*
		for(Movimiento mov : movimientos) {
	
			if(mov.getTipo()==3) {
				mov.Destino= "Pago Prestamo";
			
			}else if(mov.getTipo()== 4) {
				
				//si el tipo de destino es una transferencia, entonces el id de destino tiene que ser un id cuenta
				mov.Destino= ""
			}
		*/	
		
		
		
		return movimientos;
	}
	

}