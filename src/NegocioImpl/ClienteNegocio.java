package NegocioImpl;

import java.util.List;

import DatosImpl.ClienteDao;
import Dominio.Cliente;
import Negocio.IClienteNegocio;

public class ClienteNegocio implements IClienteNegocio{

	public ClienteNegocio() {
		
	}
	 private ClienteDao clienteDao = new ClienteDao();
	@Override
	public boolean insert(String nombre_usuario, int dni, String cuil, String nombre, String apellido, int sexo,
			String nacionalidad, String nacimiento, String domicilio, String localidad, int id_provincia, String email,
			String telefono) {
		return clienteDao.insert(nombre_usuario, dni, cuil, nombre, apellido, sexo, nacionalidad, nacimiento, domicilio, localidad, id_provincia, email, telefono);

	}
	@Override
	public Cliente Modificar(Cliente cliente) {
		return clienteDao.Modificar(cliente);
	}
	@Override
	public List<Cliente> listar() {
		
		List<Cliente> listado = clienteDao.listar();
		return listado;
	}
	@Override
	public Cliente getClienteById(int Id) {
		return clienteDao.getClienteById(Id);
	}
	public Cliente getClienteByNombreUsuario(String nombre_usuario) {
		return clienteDao.getClienteByNombreUsuaro(nombre_usuario);
	}
	
}
