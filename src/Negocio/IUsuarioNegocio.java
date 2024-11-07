package Negocio;

import Dominio.TipoUsuario;
import Dominio.Usuario;

public interface IUsuarioNegocio {
	
	Usuario login(String nombre_usuario, String pass);
	Usuario insert(String nombre_usuario, TipoUsuario tipo, String pass);
	Usuario read(String nombre_usuario);
	boolean remove(Usuario usuario);
	boolean updateActivo(Usuario usuario);
	boolean updatePassword(Usuario usuario, String pass);
	
}
