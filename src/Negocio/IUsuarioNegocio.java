package Negocio;

import Dominio.TipoUsuario;
import Dominio.Usuario;

public interface IUsuarioNegocio {
	
	Usuario login(String nombre_usuario, String pass);
	boolean insert(String nombre_usuario, int tipoUsuario, String pass);
	Usuario read(String nombre_usuario);
	boolean remove(Usuario usuario);
	boolean updateActivo(Usuario usuario);
	boolean updatePassword(Usuario usuario, String pass);
	boolean BuscarUsuario(String nombre);
	
}
