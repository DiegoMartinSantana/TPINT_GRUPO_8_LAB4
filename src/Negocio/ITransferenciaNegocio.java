package Negocio;

import Dominio.Transferencia;

public interface ITransferenciaNegocio {

	public boolean realizarTransferencia(Transferencia transferencia) throws Exception;
	public int obtenerIDCuentaPorCBU(String cbuDestinoParam);
	
}
