package NegocioImpl;

import java.sql.Date;

import DatosImpl.InformesDao;
import Dominio.Informe;
import Negocio.IInformeNegocio;

public class InformeNegocio implements IInformeNegocio {

	private InformesDao informesDao;
	
	public InformeNegocio() {
		this.informesDao = new InformesDao();
	}
	
	@Override
	public Informe obtenerInformePrestamos(Date fechaDesde, Date fechaHasta) throws Exception {
		return informesDao.obtenerInforme(fechaDesde, fechaHasta);
	}

}
