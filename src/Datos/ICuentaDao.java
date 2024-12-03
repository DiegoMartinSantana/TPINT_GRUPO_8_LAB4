package Datos;

import java.util.ArrayList;
import java.util.List;

import Dominio.Cuenta;

public interface ICuentaDao {
	boolean crearCuenta(Cuenta cuenta);
	boolean actualizarCuenta(Cuenta cuenta);
	boolean eliminarCuenta(int idCuenta);
    List<Cuenta> listarCuentas();
    Cuenta obtenerCuentaPorId(int idCuenta);
    int obtenerUltimoIDCuenta();
    ArrayList<Cuenta> listarCuentasxCliente(int idCliente);
    boolean actualizarSaldo(Cuenta cuenta);
    
}
