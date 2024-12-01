package Negocio;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dominio.Movimiento;

public interface IMovimientoNegocio {
	
	boolean crearMovimiento(Movimiento movimiento);
    List<Movimiento> listarMovimiento();
    Movimiento obtenerMovimientoPorId(int idMovimiento);
    ArrayList<Movimiento> obtenerUltimasTransferencias(int idCuenta);
}
