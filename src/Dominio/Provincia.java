package Dominio;

public class Provincia {
	private  int id_provincia;
	private  String nombre;

	public Provincia(int id_provincia, String nombre) {
		this.id_provincia = id_provincia;
		this.nombre = nombre;
	}
	
	public int getId_provincia() {
		return id_provincia;
	}

	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public void setID(int id) {
		this.id_provincia=id;
	}

	@Override
	public String toString() {
		return nombre;
	}
}
