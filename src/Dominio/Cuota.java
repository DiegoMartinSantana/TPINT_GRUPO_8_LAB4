package Dominio;

import java.sql.Date;
import java.time.LocalDate;

public class Cuota {

	
	private int IdCuota;
	private int IdPrestamo;
	private int NumeroCuota;
	private float Importe;

	private LocalDate Vencimento;
	
	public int getId() {
		return IdCuota;
	}
	
	public void setId(int id) {
		IdCuota=id;
	}
	
	public int getEstado() {
		return Estado;
	}
	public void setEstado(int estado) {
		Estado = estado;
	}
	private int Estado;
	
	public int getIdPrestamo() {
		return IdPrestamo;
	}
	public void setIdPrestamo(int idPrestamo) {
		IdPrestamo = idPrestamo;
	}
	public int getNumeroCuota() {
		return NumeroCuota;
	}
	public Cuota(int idPrestamo, int numeroCuota, float importe, LocalDate vencimento, int estado) {
		super();
		IdPrestamo = idPrestamo;
		NumeroCuota = numeroCuota;
		Importe = importe;
		Vencimento = vencimento;
		Estado = estado;
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

	
	public LocalDate getVencimento() {
		return Vencimento;
	}
	public void setVencimento(LocalDate date) {
		Vencimento = date;
	}
	public Cuota() {}
	
	
}
