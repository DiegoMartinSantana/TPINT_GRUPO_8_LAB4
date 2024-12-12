package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatosImpl.CuentaDao;
import DatosImpl.PrestamoDao;
import Dominio.Cuenta;
import Dominio.DatosPrestamosSolicitadosSP;
import Dominio.Movimiento;
import Dominio.Dto.PrestamoDto;
import NegocioImpl.CuentaNegocio;
import NegocioImpl.MovimientoNegocio;
import NegocioImpl.PrestamosNegocio;


@WebServlet("/PrestamosServlet")
public class PrestamosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PrestamosNegocio prestamosNegocio = new PrestamosNegocio();
    private Movimiento movimiento = new Movimiento();
    private MovimientoNegocio movimientoNegocio = new MovimientoNegocio();
    private CuentaNegocio cuentaNegocio = new CuentaNegocio();
    private ArrayList<PrestamoDto> prestamos  ;
    private DatosPrestamosSolicitadosSP PrestamoSP = new DatosPrestamosSolicitadosSP();
    public PrestamosServlet() {
        super();
        
        
    }
    
    private PrestamoDao prestamoDao;
    
    private void actualizarListado (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	prestamos = new ArrayList<PrestamoDto>();
    	prestamos = prestamosNegocio.GetAll();
    	
    	request.getSession().setAttribute("prestamos",prestamos);
		RequestDispatcher rd = request.getRequestDispatcher("AutorizacionPrestamo.jsp?show="+ 3);
        rd.forward(request, response);
		
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		prestamos = new ArrayList<PrestamoDto>();
		prestamos = prestamosNegocio.GetAll();
			
		actualizarListado(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		 String Param  = request.getParameter("value");
		   int value = (Param != null) ? Integer.parseInt(Param) :0 ;
		 String ParamPrestamo  = request.getParameter("idPrestamo");
     
        int idPrestamo = (ParamPrestamo != null) ? Integer.parseInt(ParamPrestamo) :0 ;
     
		if(idPrestamo != 0) {
		if(request.getParameter("btnAceptar") != null  &&  value != 0 && value == 1) {
		
		
			PrestamoDto prestamoDto = prestamosNegocio.obtenerPrestamoPorId(idPrestamo);
	                
	            if (prestamoDto != null) {


	                	PrestamoSP.setIDCuenta(prestamoDto.idCuenta);
	                	PrestamoSP.setMontoSolicitado(prestamoDto.importeSolicitado); 
	                	PrestamoSP.setFecha(java.time.LocalDate.now());
	                	PrestamoSP.setIdPrestamoSolicitado(idPrestamo);       	
	                	prestamosNegocio.aceptarPrestamo(PrestamoSP);
	                	
	                    request.setAttribute("mensaje", "El préstamo ha sido aceptado exitosamente.");
	                	actualizarListado(request, response);
	             
	            }
			
		}else {

            prestamosNegocio.SetEstado(idPrestamo,2);
            if(request.getParameter("idPrestamo") != null ) {

                int prestamo = Integer.parseInt(request.getParameter("idPrestamo"));

                prestamosNegocio.rechazarPrestamo(prestamo);
                
                request.setAttribute("mensajeError", "El préstamo ha sido rechazado exitosamente.");
                actualizarListado(request, response);


            }
        }

        }

       


    }

}
