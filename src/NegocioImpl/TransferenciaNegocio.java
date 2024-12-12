package NegocioImpl;

import DatosImpl.TransferenciaDao;
import Dominio.Transferencia;
import Negocio.ITransferenciaNegocio;

public class TransferenciaNegocio implements ITransferenciaNegocio{

	private TransferenciaDao transferenciaDAO = new TransferenciaDao();

	
	@Override
	public boolean realizarTransferencia(Transferencia transferencia) {
	    try {
	        transferenciaDAO.generarTransferencia(transferencia);
	        return true;
	    } catch (Exception e) {
	        // Manejar la excepción según sea necesario
	        return false;
	    }
	}


	@Override
	public int obtenerIDCuentaPorCBU(String cbuDestinoParam) {
		return transferenciaDAO.obtenerIDCuentaPorCBU(cbuDestinoParam);
	}

		
	
}
