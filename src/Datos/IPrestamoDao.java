package Datos;

import java.util.ArrayList;

import Dominio.PrestamoSolicitado;
import Dominio.Dto.PrestamoDto;

public interface IPrestamoDao {

	ArrayList<PrestamoDto> listarPrestamos();
	int  SetEstado(int idPrestamo, int set);
    boolean rechazarPrestamo(int idPrestamoSolicitado);
    boolean crearPrestamoSolicitado(PrestamoSolicitado prestamosSolicitado);
}
