package Dominio.Dto;

import java.time.LocalDate;

public class PrestamoDto  {

	public float montoCuota;
    public float importeSolicitado;
    public int plazoCuotas;
    public float interes;
    public float importePagar;
    public int estado;
    public LocalDate fechaPrestamo;
    public String cbu;
    public String nombre;
    public String cuil;
    public int idPrestamo;
    public int idCuenta;

    public int getIdCuenta() {
                return idCuenta;
            }

    public void setIdCuenta(int idCuenta) {
                this.idCuenta = idCuenta;
            }
    public String getImportePagarToString() {
		return ""+importePagar;
	}
    public String getImporteSolicitadoToString() {
		return ""+importeSolicitado;
	}
}

