package Dominio;

public enum TipoMovimiento {
	ALTA_CUENTA(1),
	ALTA_PRESTAMO(2),
	PAGO_PRESTAMOS(3),
	TRANSFERENCIA(4);
	
	public final int codigo;
	
	private TipoMovimiento(int codigo) {
		this.codigo = codigo;
	}

	public static TipoMovimiento get(int codigo) {
		TipoMovimiento tipo = null;
		switch(codigo) {
		case 1:
			tipo = ALTA_CUENTA;
			break;
		case 2:
			tipo = ALTA_PRESTAMO;
			break;
		case 3:
			tipo = PAGO_PRESTAMOS;
			break;
		case 4:
			tipo = TRANSFERENCIA;
			break;
			
		}
		return tipo;
	}
}
