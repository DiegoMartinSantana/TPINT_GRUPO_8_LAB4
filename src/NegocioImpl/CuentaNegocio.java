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
    public int  agregarCuenta(Cuenta cuenta) {
    
	//1 = ok 2=error bd 3 = tiene 3 cuentas
    	boolean Habilitado = cuentaDao.ValidarLimiteCuentas( cuenta.getIdCliente());
    	
    	if(Habilitado) {
    	if(cuentaDao.crearCuenta(cuenta)){
    		return 1;
    	} 
    	}else {
    		return 3;
    	}
    	return 2;
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

	@Override
	public boolean actualizarSaldo(Cuenta cuenta) {
		return cuentaDao.actualizarSaldo(cuenta);
	}
}
