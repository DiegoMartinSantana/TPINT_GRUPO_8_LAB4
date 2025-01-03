package Datos;

import java.util.ArrayList;

import Dominio.DatosPrestamosSolicitadosSP;
import Dominio.PrestamoSolicitado;
import Dominio.Dto.PrestamoDto;

public interface IPrestamoDao {

	ArrayList<PrestamoDto> listarPrestamos();
	int  SetEstado(int idPrestamo, int set);
    boolean rechazarPrestamo(int idPrestamoSolicitado);
    boolean crearPrestamoSolicitado(PrestamoSolicitado prestamosSolicitado);
    void aceptarPrestamo(DatosPrestamosSolicitadosSP PrestamoSP);
    public PrestamoDto obtenerPrestamoPorIdV2(int idPrestamo);
}
