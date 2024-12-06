package Dominio;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Cliente {
	
	private String nombreUsuario;
	private  int id;
	private  int dni;
	private  String cuil;
	private String nombre;
	private String apellido;
	private  int sexo;
	private String nacionalidad;
	private LocalDate nacimiento;
	private String domicilio;
	private List<Cuenta> cuentasCliente;
	private String localidad;
	private Provincia provincia;
	private String email;
	private String telefono;
	private boolean activo;
	private BigDecimal totalPrestado;
	
	public Cliente() {
		this.cuentasCliente = new ArrayList<>();
	}

	
	public Cliente(String nombreUsuario, int id, int dni, String cuil, String nombre, String apellido, int sexo,
			String nacionalidad , String domicilio, String localidad, String email, String telefono, boolean activo,Provincia provincia,LocalDate nacimiento) {
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
		this.cuentasCliente = new ArrayList<>();
		this.nacimiento= nacimiento;
		this.provincia=provincia;
	}

	public LocalDate getNacimiento() {
		return nacimiento;
	}


	public void setNacimiento(LocalDate nacimiento) {
		this.nacimiento = nacimiento;
	}


	public List<Cuenta> getCuentasCliente() {
		return cuentasCliente;
	}


	public void setCuentasCliente(List<Cuenta> cuentasCliente) {
		this.cuentasCliente = cuentasCliente;
	}


	public Provincia getProvincia() {
		return provincia;
	}


	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}


	public void agregarCuenta(Cuenta cuenta) {
		this.cuentasCliente.add(cuenta);
		cuenta.setCliente(this);
	}
	
	public List<Cuenta> getCuentas(){
		return cuentasCliente;
	}
	
	public void setCuentas(List<Cuenta> cuentas) {
		this.cuentasCliente = cuentas;
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
	
	public void setNombreUsuario(String nombre_usuario) { 
		this.nombreUsuario = nombre_usuario; 
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


	public void setDni(int dni) {
		this.dni = dni;
		
	}


	public void setCuil(String cuil) {
		this.cuil = cuil;
		
	}


	public void setSexo(int sexo) {
		this.sexo = sexo;
		
	}


	public void setId(int id) {
		this.id=id;
		
	}


	public BigDecimal getTotalPrestado() {
		return totalPrestado;
	}


	public void setTotalPrestado(BigDecimal totalPrestado) {
		this.totalPrestado = totalPrestado;
	}


	
	
	
	
	
	
	

}
