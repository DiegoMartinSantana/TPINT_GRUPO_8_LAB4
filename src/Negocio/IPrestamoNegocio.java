package Negocio;

import java.util.ArrayList;

import Dominio.DatosPrestamosSolicitadosSP;
import Dominio.PrestamoSolicitado;
import Dominio.Dto.PrestamoDto;

public interface IPrestamoNegocio {
	ArrayList<PrestamoDto> GetAll();
	void SetEstado(int idPrestamo, int set) ;
	PrestamoDto obtenerPrestamoPorId(int idPrestamo);
	public boolean crearPrestamoSolicitado(PrestamoSolicitado prestamoSolicitado);
	public void aceptarPrestamo(DatosPrestamosSolicitadosSP PrestamoSP);
	ArrayList<PrestamoDto> GetAllAceptados() ;
	
}
