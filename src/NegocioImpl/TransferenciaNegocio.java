package NegocioImpl;

import Datos.ITransferenciaDao;
import DatosImpl.TransferenciaDao;
import Dominio.Transferencia;
import Negocio.ITransferenciaNegocio;

public class TransferenciaNegocio implements ITransferenciaNegocio{

	private ITransferenciaDao transferenciaDAO = new TransferenciaDao();

	
	@Override
	public boolean realizarTransferencia(Transferencia transferencia) throws Exception{
		
		transferenciaDAO.generarTransferencia(transferencia);
        return true;
		
	}

		
	
}
