package NegocioImpl;

import java.util.ArrayList;

import DatosImpl.PrestamoDao;
import Dominio.DatosPrestamosSolicitadosSP;
import Dominio.PrestamoSolicitado;
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

	@Override
	
	public PrestamoDto obtenerPrestamoPorId(int idPrestamo) {
		
		return  prestamoDao.obtenerPrestamoPorId(idPrestamo);
	}
	
	public boolean rechazarPrestamo(int idPrestamoSolicitado) {
		return prestamoDao.rechazarPrestamo(idPrestamoSolicitado);
		
	}
	@Override
	public boolean crearPrestamoSolicitado(PrestamoSolicitado prestamoSolicitado) {
		// TODO Auto-generated method stub
		return prestamoDao.crearPrestamoSolicitado(prestamoSolicitado);
	}
	
	 
	@Override
	
	public void aceptarPrestamo(DatosPrestamosSolicitadosSP PrestamoSP) {
		prestamoDao.aceptarPrestamo(PrestamoSP);
		
	}

		

}
