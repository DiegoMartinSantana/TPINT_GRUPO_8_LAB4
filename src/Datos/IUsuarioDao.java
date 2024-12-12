package Datos;

import Dominio.Usuario;

public interface IUsuarioDao {

	Usuario Loguear(String nombre_usuario, String pass);
	boolean Insertar(String nombre, int tipo, String pass);
	String Leer(String nombre_usuario);
	boolean Remover(String nombre_usuario);
	boolean ActualizarActivo(String nombre_usuario, int activo);
	boolean Actualizar(String nombre_usuario, String pass);
	boolean BuscarUsuario(String nombre);
	
}
