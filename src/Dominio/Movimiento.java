package Dominio;

public class Movimiento {
	
	private int id;
	private int id_cuenta;
	private int tipo;
	private float importe;
	private String detalle; 
	private int id_destino;
	private String fecha;
	 public String Destino ;
	
	public Movimiento () {
		
	}
	
	
	public Movimiento(int id, int id_cuenta, int tipo, float importe, String detalle, int id_destino, String fecha) {
		super();
		this.id = id;
		this.id_cuenta = id_cuenta;
		this.tipo = tipo;
		this.importe = importe;
		this.detalle = detalle;
		this.id_destino = id_destino;
		this.fecha = fecha;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_cuenta() {
		return id_cuenta;
	}
	public void setId_cuenta(int id_cuenta) {
		this.id_cuenta = id_cuenta;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public float getImporte() {
		return importe;
	}
	public void setImporte(float importe) {
		this.importe = importe;
	}
	public String getDetalle() {
		return detalle;
	}
	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}
	public int getId_destino() {
		return id_destino;
	}
	public void setId_destino(int id_destino) {
		this.id_destino = id_destino;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	
	
	
	
	

}