package NegocioImpl;

import java.util.ArrayList;

import DatosImpl.PrestamoDao;

import Dominio.Dto.PrestamoDto;
import Negocio.IPrestamoNegocio;

public class PrestamosNegocio  implements IPrestamoNegocio{
	
	private PrestamoDao prestamoDao=new PrestamoDao();
	@Override
	public ArrayList<PrestamoDto> GetAll() {
		
		ArrayList<PrestamoDto> prestamos = prestamoDao.listarPrestamos();
		return prestamos;
	}
	public void SetEstado(int idPrestamo, int set) { //set =1 aprobado, 2= rechaza
		
		prestamoDao.SetEstado(idPrestamo, set);
		
	}
		

}
