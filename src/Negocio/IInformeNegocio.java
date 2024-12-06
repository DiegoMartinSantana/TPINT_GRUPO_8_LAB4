package Negocio;

import java.sql.Date;

import Dominio.Informe;

public interface IInformeNegocio {
	Informe obtenerInformePrestamos(Date fechaDesde, Date fechaHasta) throws Exception;
}
