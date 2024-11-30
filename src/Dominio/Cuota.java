package Dominio;

import java.time.LocalDate;

public class Cuota {

	private int IdCuota;
	private int IdPrestamo;
	private int NumeroCuota;
	private float Importe;
	private LocalDate FechaPago;
	private LocalDate Vencimento;
	
	public int getIdCuota() {
		return IdCuota;
	}
	public void setIdCuota(int idCuota) {
		IdCuota = idCuota;
	}
	public int getIdPrestamo() {
		return IdPrestamo;
	}
	public void setIdPrestamo(int idPrestamo) {
		IdPrestamo = idPrestamo;
	}
	public int getNumeroCuota() {
		return NumeroCuota;
	}
	public void setNumeroCuota(int numeroCuota) {
		NumeroCuota = numeroCuota;
	}
	public float getImporte() {
		return Importe;
	}
	public void setImporte(float importe) {
		Importe = importe;
	}
	public LocalDate getFechaPago() {
		return FechaPago;
	}
	public void setFechaPago(LocalDate fechaPago) {
		FechaPago = fechaPago;
	}
	public LocalDate getVencimento() {
		return Vencimento;
	}
	public void setVencimento(LocalDate vencimento) {
		Vencimento = vencimento;
	}
	public Cuota() {}
	public Cuota(int idCuota, int idPrestamo, int numeroCuota, float importe, LocalDate fechaPago,
			LocalDate vencimento) {
		super();
		IdCuota = idCuota;
		IdPrestamo = idPrestamo;
		NumeroCuota = numeroCuota;
		Importe = importe;
		FechaPago = fechaPago;
		Vencimento = vencimento;
	}
	
}
