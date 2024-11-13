package Datos;

import java.util.List;

import Dominio.Cliente;

public interface IClienteDao {
	
	boolean insert(String nombre_usuario, int dni, String cuil, String nombre, String apellido, int sexo, String nacionalidad, 
			String nacimiento, String domicilio, String localidad, int id_provincia, String email, String telefono, boolean activo);
	
	public List<Cliente> listar();
	
}
