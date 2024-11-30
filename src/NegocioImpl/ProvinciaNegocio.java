package NegocioImpl;

import java.util.ArrayList;

import DatosImpl.ProvinciaDao;
import Dominio.Provincia;
import Negocio.IProvinciaNegocio;

public class ProvinciaNegocio  implements IProvinciaNegocio{

	ProvinciaDao provDao = new ProvinciaDao();
	
	
	
	public ArrayList<Provincia> getAll(){
		return provDao.getAll();
	}
}
