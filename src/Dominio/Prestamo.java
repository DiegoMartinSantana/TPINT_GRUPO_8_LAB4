package Dominio;

import java.time.LocalDate;

public class Prestamo {

	private int  IdPrestamo ;
	private int IdMovimiento;
	private float MontoCuota;
	private float ImporteSolicitado;
	private int PlazoCuotas;
	private float Interes;
	private float ImportePagar;
	private int Estado;
	private LocalDate FechaPrestamo;
	
	public Prestamo() {}
	
	public Prestamo(int idPrestamo, int idMovimiento, float montoCuota, float importeSolicitado, int plazoCuotas,
			float interes, float importePagar, int estado, LocalDate fechaPrestamo) {
		super();
		IdPrestamo = idPrestamo;
		IdMovimiento = idMovimiento;
		MontoCuota = montoCuota;
		ImporteSolicitado = importeSolicitado;
		PlazoCuotas = plazoCuotas;
		Interes = interes;
		ImportePagar = importePagar;
		Estado = estado;
		FechaPrestamo = fechaPrestamo;
	}
	
	public int getIdPrestamo() {
		return IdPrestamo;
	}
	public void setIdPrestamo(int idPrestamo) {
		IdPrestamo = idPrestamo;
	}
	public int getIdMovimiento() {
		return IdMovimiento;
	}
	public void setIdMovimiento(int idMovimiento) {
		IdMovimiento = idMovimiento;
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
	
	
}
