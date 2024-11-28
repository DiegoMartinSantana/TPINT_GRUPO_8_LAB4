package Negocio;

import java.util.List;

import Dominio.Movimiento;

public interface IMovimientoNegocio {
	
	boolean crearMovimiento(Movimiento movimiento);
    List<Movimiento> listarMovimiento();
    Movimiento obtenerMovimientoPorId(int idMovimiento);
    int obtenerUltimoIDMovimiento();

}
