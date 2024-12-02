package Dominio;

import java.time.LocalDate;

public class PrestamoSolicitado {

	public int  IdPrestamoSolicitado ;
	public int IdCuenta;
	public float MontoCuota;
	public float ImporteSolicitado;
	public int PlazoCuotas;
	public float Interes;
	public float ImportePagar;
	public int Estado;
	public LocalDate FechaPrestamo;
	
	public PrestamoSolicitado() {}
	
	public PrestamoSolicitado(int idPrestamoSolicitado, int idCuenta, float montoCuota, float importeSolicitado, int plazoCuotas,
			float interes, float importePagar, int estado, LocalDate fechaPrestamo) {
		super();
		IdPrestamoSolicitado = idPrestamoSolicitado;
		IdCuenta = idCuenta;
		MontoCuota = montoCuota;
		ImporteSolicitado = importeSolicitado;
		PlazoCuotas = plazoCuotas;
		Interes = interes;
		ImportePagar = importePagar;
		Estado = estado;
		FechaPrestamo = fechaPrestamo;
	}
	

	public float getMontoCuota() {
		return MontoCuota;
	}
	public void setMontoCuota(float montoCuota) {
		MontoCuota = montoCuota;
	}
	public float getImporteSolicitado() {
		return ImporteSolicitado;
	}
	public void setImporteSolicitado(float importeSolicitado) {
		ImporteSolicitado = importeSolicitado;
	}
	public int getPlazoCuotas() {
		return PlazoCuotas;
	}
	public void setPlazoCuotas(int plazoCuotas) {
		PlazoCuotas = plazoCuotas;
	}
	public float getInteres() {
		return Interes;
	}
	public void setInteres(float interes) {
		Interes = interes;
	}
	public float getImportePagar() {
		return ImportePagar;
	}
	public void setImportePagar(float importePagar) {
		ImportePagar = importePagar;
	}
	public int getEstado() {
		return Estado;
	}
	public void setEstado(int  estado) {
		Estado = estado;
	}
	public LocalDate getFechaPrestamo() {
		return FechaPrestamo;
	}
	public void setFechaPrestamo(LocalDate fechaPrestamo) {
		FechaPrestamo = fechaPrestamo;
	}

	public int getIdPrestamoSolicitado() {
		return IdPrestamoSolicitado;
	}

	public void setIdPrestamoSolicitado(int idPrestamoSolicitado) {
		IdPrestamoSolicitado = idPrestamoSolicitado;
	}

	public int getIdCuenta() {
		return IdCuenta;
	}

	public void setIdCuenta(int idCuenta) {
		IdCuenta = idCuenta;
	}
	
	
}