package NegocioImpl;

import DatosImpl.TransferenciaDao;
import Dominio.Transferencia;
import Negocio.ITransferenciaNegocio;

public class TransferenciaNegocio implements ITransferenciaNegocio{

	private TransferenciaDao transferenciaDAO = new TransferenciaDao();

	
	@Override
	public boolean realizarTransferencia(Transferencia transferencia) throws Exception{
		
		transferenciaDAO.generarTransferencia(transferencia);
        return true;
		
	}


	@Override
	public int obtenerIDCuentaPorCBU(String cbuDestinoParam) {
		return transferenciaDAO.obtenerIDCuentaPorCBU(cbuDestinoParam);
	}

		
	
}
