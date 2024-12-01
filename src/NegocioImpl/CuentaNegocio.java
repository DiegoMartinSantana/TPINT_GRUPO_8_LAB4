package NegocioImpl;

import java.util.ArrayList;
import java.util.List;

import DatosImpl.CuentaDao;
import Dominio.Cuenta;
import Negocio.ICuentaNegocio;

public class CuentaNegocio implements ICuentaNegocio {
	private CuentaDao cuentaDao;

    // Constructor
    public CuentaNegocio() {
        this.cuentaDao = CuentaDao.obtenerInstancia();
    }

    @Override
    public boolean agregarCuenta(Cuenta cuenta) {
       // if (cuenta.getCbu().length() != 22) {
           // System.out.println("CBU debe tener 22 dígitos.");
            //return false;
        //}
        return cuentaDao.crearCuenta(cuenta);
    }
    public ArrayList<Cuenta> listarCuentasxCliente(int idCliente) {
    	ArrayList<Cuenta> cuentas = cuentaDao.listarCuentasxCliente(idCliente);
    	
    	
    	return cuentas;
    }

    @Override
    public boolean actualizarCuenta(Cuenta cuenta) {
        Cuenta cuentaExistente = cuentaDao.obtenerCuentaPorId(cuenta.getIdCuenta());
        if (cuentaExistente == null) {
            System.out.println("La cuenta no existe.");
            return false;
        }
        return cuentaDao.actualizarCuenta(cuenta);
    }

    @Override
    public boolean eliminarCuenta(int idCuenta) {
        Cuenta cuenta = cuentaDao.obtenerCuentaPorId(idCuenta);
        if (cuenta == null || !cuenta.isActiva()) {
            System.out.println("No se puede eliminar una cuenta que no existe o que está inactiva.");
            return false;
        }
        return cuentaDao.eliminarCuenta(idCuenta);
    }

    @Override
    public List<Cuenta> obtenerCuentas() {
        return cuentaDao.listarCuentas();
    }

    @Override
    public Cuenta obtenerCuentaPorId(int idCuenta) {
        return cuentaDao.obtenerCuentaPorId(idCuenta);
    }
    
    @Override
	public int obtenerUltimoIDCuenta() {
		return this.cuentaDao.obtenerUltimoIDCuenta();
	}

	@Override
	public List<Cuenta> obtenerCuentasPorCliente(int idCliente) {
	return cuentaDao.listarCuentasxCliente(idCliente);
	}
}
