package NegocioImpl;

import java.util.ArrayList;

import DatosImpl.ProvinciaDao;
import Dominio.Provincia;

public class ProvinciaNegocio {

	ProvinciaDao provDao = new ProvinciaDao();
	
	
	
	public ArrayList<Provincia> getAll(){
		return provDao.getAll();
	}
}
