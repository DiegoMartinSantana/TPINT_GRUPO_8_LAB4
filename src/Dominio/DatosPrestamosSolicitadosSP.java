package Dominio;

import java.time.LocalDate;

public class DatosPrestamosSolicitadosSP {
	
	public int  IdPrestamoSolicitado;
	public float MontoSolicitado;
	public int IDCuenta;
	public int IDMovimiento;
	public LocalDate fecha;
	public String DetallePrestamoSolicitado = "Prestamo Aceptado";
	
	public DatosPrestamosSolicitadosSP(int idPrestamoSolicitado, float montoSolicitado, int iDCuenta, LocalDate fecha) {
		super();
		IdPrestamoSolicitado = idPrestamoSolicitado;
		MontoSolicitado = montoSolicitado;
		IDCuenta = iDCuenta;
		this.fecha = fecha;
	}
	
	public DatosPrestamosSolicitadosSP() {
		
	}

	public int getIdPrestamoSolicitado() {
		return IdPrestamoSolicitado;
	}

	public void setIdPrestamoSolicitado(int idPrestamoSolicitado) {
		IdPrestamoSolicitado = idPrestamoSolicitado;
	}

	public float getMontoSolicitado() {
		return MontoSolicitado;
	}

	public void setMontoSolicitado(float montoSolicitado) {
		MontoSolicitado = montoSolicitado;
	}

	public int getIDCuenta() {
		return IDCuenta;
	}

	public void setIDCuenta(int iDCuenta) {
		IDCuenta = iDCuenta;
	}

	public int getIDMovimiento() {
		return IDMovimiento;
	}

	public void setIDMovimiento(int iDMovimiento) {
		IDMovimiento = iDMovimiento;
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public String getDetallePrestamoSolicitado() {
		return DetallePrestamoSolicitado;
	}

	public void setDetallePrestamoSolicitado(String detallePrestamoSolicitado) {
		DetallePrestamoSolicitado = detallePrestamoSolicitado;
	}
	
	
	
	

}
