package NegocioImpl;

import DatosImpl.UsuarioDao;
import Dominio.TipoUsuario;
import Dominio.Usuario;
import Negocio.IUsuarioNegocio;


public class UsuarioNegocio implements IUsuarioNegocio {
	
	

	private UsuarioDao usuarioDao = new UsuarioDao();
	
	
	
	@Override
	public Usuario login(String nombre_usuario, String pass) {
		Usuario usuarioRegistrado = null;
		
		usuarioRegistrado = usuarioDao.Loguear(nombre_usuario, pass);
		
		if(usuarioRegistrado== null) {
			return null;
		}
		return usuarioRegistrado;
		
		
	}

	@Override
	public boolean insert(String nombre_usuario, int tipoUsuario, String pass) {
	     return usuarioDao.Insertar(nombre_usuario,tipoUsuario,pass);
	}

	@Override
	public boolean remove(Usuario usuario) {
		return true;
	}

	@Override
	public Usuario read(String nombre_usuario) {
		Usuario usuario = null;
		return usuario;
		
	}
	

	@Override
	public boolean updateActivo(Usuario usuario) {
		return true;
	}

	@Override
	public boolean updatePassword(Usuario usuario, String pass) {
		return true;
	}

	@Override
	public boolean BuscarUsuario(String nombre) {
		return usuarioDao.BuscarUsuario(nombre);
	}

}
