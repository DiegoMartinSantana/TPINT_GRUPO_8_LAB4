package Negocio;

import java.util.List;

import Dominio.Cuenta;

public interface ICuentaNegocio {
	boolean agregarCuenta(Cuenta cuenta);
    boolean actualizarCuenta(Cuenta cuenta);
    boolean eliminarCuenta(int idCuenta);
    List<Cuenta> obtenerCuentas();
    Cuenta obtenerCuentaPorId(int idCuenta);
    int obtenerUltimoIDCuenta();
    List<Cuenta> obtenerCuentasPorCliente(int idCliente);
    boolean actualizarSaldo(Cuenta cuenta);
}
