package Datos;

import java.util.List;

import Dominio.Movimiento;



public interface IMovimientoDao {
	
	boolean crearMovimiento(Movimiento movimiento);
    List<Movimiento> listarMovimiento();
    Movimiento obtenerMovimientoPorId(int idMovimiento);

}
