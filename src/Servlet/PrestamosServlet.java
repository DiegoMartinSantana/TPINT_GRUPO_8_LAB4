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

import Dominio.Cuenta;
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
    public PrestamosServlet() {
        super();
        
        
    }
    
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
			//alta
			prestamosNegocio.SetEstado(idPrestamo,1);
			PrestamoDto prestamoDto = prestamosNegocio.obtenerPrestamoPorId(idPrestamo);
	                
	            if (prestamoDto != null) {
	                Cuenta cuenta = cuentaNegocio.obtenerCuentaPorId(prestamoDto.idCuenta); 

	                if (cuenta != null) {               
	                    movimiento.setId_cuenta(cuenta.getIdCuenta());
	                    movimiento.setTipo(2);
	                    movimiento.setImporte(prestamoDto.importeSolicitado); 
	                    movimiento.setDetalle("Aprobación de préstamo");
	                    movimiento.setFecha(java.time.LocalDate.now());
	                    movimiento.setId_destino(0);
	                }
	                cuenta.setSaldo(cuenta.getSaldo() + prestamoDto.importeSolicitado);
	                cuentaNegocio.actualizarSaldo(cuenta);
	            }
			actualizarListado(request, response);
			
		}else {
	
			prestamosNegocio.SetEstado(idPrestamo,2);
		actualizarListado(request, response);
			
			}
		}		
		
		doGet(request, response);
	}

}
