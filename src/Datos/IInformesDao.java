package Datos;

import java.sql.Date;

import Dominio.Informe;

public interface IInformesDao {

	Informe obtenerInforme(Date fechaDesde, Date fechaHasta) throws Exception;
	
}
