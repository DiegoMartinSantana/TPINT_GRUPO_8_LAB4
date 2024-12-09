package Dominio;

public class Pago {

	private int idPrestamo;
	private int idCuenta;
	private int idCuota;
	
	public Pago() {};
	
	public Pago(int idPrestamo, int idCuenta, int idCuota) {
		this.idPrestamo = idPrestamo;
		this.idCuenta = idCuenta;
		this.idCuota = idCuota;
	}
	
	public int getIdPrestamo() {
		return idPrestamo;
	}
	public void setIdPrestamo(int idPrestamo) {
		this.idPrestamo = idPrestamo;
	}
	public int getIdCuenta() {
		return idCuenta;
	}
	public void setIdCuenta(int idCuenta) {
		this.idCuenta = idCuenta;
	}
	public int getIdCuota() {
		return idCuota;
	}
	public void setIdCuota(int idCuota) {
		this.idCuota = idCuota;
	}
	
	
	
}
