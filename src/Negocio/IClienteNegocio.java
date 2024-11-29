package Negocio;

import java.time.LocalDate;
import java.util.List;

import Dominio.Cliente;

public interface IClienteNegocio {

	boolean insert(String nombre_usuario, int dni, String cuil, String nombre, String apellido, int sexo,
			String nacionalidad, LocalDate nacimiento, String domicilio, String localidad, int id_provincia, String email,
			String telefono);
	 Cliente getClienteByNombreUsuario(String nombre_usuario) ;

	Cliente Modificar(Cliente cliente) ;
	public List<Cliente> listar();
	public Cliente getClienteById(int Id);
}
