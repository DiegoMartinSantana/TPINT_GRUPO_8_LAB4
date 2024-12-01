package Negocio;

import java.util.ArrayList;


import Dominio.Dto.PrestamoDto;

public interface IPrestamoNegocio {
	ArrayList<PrestamoDto> GetAll();
	void SetEstado(int idPrestamo, int set) ;
	PrestamoDto obtenerPrestamoPorId(int idPrestamo);
}
