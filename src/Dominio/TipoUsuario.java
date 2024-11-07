package Dominio;

public enum TipoUsuario {
	ADMINISTRADOR(1),
	CLIENTE(2);
	
	public final int codigo;
	
	private TipoUsuario(int codigo) {
		this.codigo = codigo;
	}

	public static TipoUsuario get(int codigo) {
		TipoUsuario tipo = null;
		switch(codigo) {
		case 1:
			tipo = ADMINISTRADOR;
			break;
		case 2:
			tipo = CLIENTE;
			break;
		}
		return tipo;
	}
}
