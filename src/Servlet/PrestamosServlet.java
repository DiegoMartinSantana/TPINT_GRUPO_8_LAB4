package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dominio.Cuenta;
import Dominio.Dto.PrestamoDto;
import NegocioImpl.PrestamosNegocio;


@WebServlet("/PrestamosServlet")
public class PrestamosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PrestamosNegocio prestamosNegocio = new PrestamosNegocio();
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
		if(request.getParameter("btnAceptar") == null  &&  value != 0 && value == 1) {
			//alta
			prestamosNegocio.SetEstado(idPrestamo,1);
			//generar cuotas etx etc etc ..
			actualizarListado(request, response);
			
		}else {
	
			prestamosNegocio.SetEstado(idPrestamo,2);
		actualizarListado(request, response);
			
			}
		}		
		
		doGet(request, response);
	}

}
