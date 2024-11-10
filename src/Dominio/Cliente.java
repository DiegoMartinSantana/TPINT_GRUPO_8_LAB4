package Dominio;

public class Cliente {
	
	private final String nombreUsuario;
	private final int id;
	private final int dni;
	private final String cuil;
	private String nombre;
	private String apellido;
	private final int sexo;
	private String nacionalidad;
	//private Calendar nacimiento;
	private String domicilio;
	private String localidad;
	//Provincia provincia;
	private String email;
	private String telefono;
	private boolean activo;
	

	public Cliente(String nombreUsuario, int id, int dni, String cuil, String nombre, String apellido, int sexo,
			String nacionalidad, String domicilio, String localidad, String email, String telefono, boolean activo) {
		this.nombreUsuario = nombreUsuario;
		this.id = id;
		this.dni = dni;
		this.cuil = cuil;
		this.nombre = nombre;
		this.apellido = apellido;
		this.sexo = sexo;
		this.nacionalidad = nacionalidad;
		this.domicilio = domicilio;
		this.localidad = localidad;
		this.email = email;
		this.telefono = telefono;
		this.activo = activo;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}


	public String getNacionalidad() {
		return nacionalidad;
	}


	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}


	public String getDomicilio() {
		return domicilio;
	}


	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}


	public String getLocalidad() {
		return localidad;
	}


	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public boolean isActivo() {
		return activo;
	}


	public void setActivo(boolean activo) {
		this.activo = activo;
	}


	public String getNombreUsuario() {
		return nombreUsuario;
	}


	public int getId() {
		return id;
	}


	public int getDni() {
		return dni;
	}


	public String getCuil() {
		return cuil;
	}


	public int getSexo() {
		return sexo;
	}
	
	
	
	
	
	
	

}
