package Dominio;

public class Usuario {
	public static String DEFAULT_PASSWORD = "default";
	private final String nombre_usuario;
	private final TipoUsuario tipo;
	private boolean activo;

	public Usuario(String nombre_usuario, TipoUsuario tipo, boolean activo) {
		this.nombre_usuario = nombre_usuario;
		this.tipo = tipo;
		this.activo = activo;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public String getNombre_usuario() {
		return nombre_usuario;
	}

	public TipoUsuario getTipo() {
		return tipo;
	}
	
}
