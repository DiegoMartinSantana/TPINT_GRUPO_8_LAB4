package Dominio;

public class Transferencia {

	private int id_cuenta_origen;
	private int id_cuenta_destino;
	private float importe_transferencia;
	private String detalle;
	
	public Transferencia() {};
	
	public Transferencia(int id_cuenta_origen, int id_cuenta_destino, float importe_transferencia, String detalle) {
		this.id_cuenta_origen = id_cuenta_origen;
		this.id_cuenta_destino = id_cuenta_destino;
		this.importe_transferencia = importe_transferencia;
		this.detalle = detalle;
	}
	
	public int getId_cuenta_origen() {
		return id_cuenta_origen;
	}
	public void setId_cuenta_origen(int id_cuenta_origen) {
		this.id_cuenta_origen = id_cuenta_origen;
	}
	public int getId_cuenta_destino() {
		return id_cuenta_destino;
	}
	public void setId_cuenta_destino(int id_cuenta_destino) {
		this.id_cuenta_destino = id_cuenta_destino;
	}
	public float getImporte_transferencia() {
		return importe_transferencia;
	}
	public void setImporte_transferencia(float importe_transferencia) {
		this.importe_transferencia = importe_transferencia;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}
	
	
	
}
