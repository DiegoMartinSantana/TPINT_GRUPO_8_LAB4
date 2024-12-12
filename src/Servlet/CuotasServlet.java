package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import Dominio.Cuota;
import NegocioImpl.PagoNegocio;


@WebServlet("/CuotasServlet")
public class CuotasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private PagoNegocio pagoNegocio = new PagoNegocio();
   
    public CuotasServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		if(request.getParameter("id")!=null) {
			
			int idPrestamo = Integer.parseInt(request.getParameter("id"));
				
			
			ArrayList<Cuota> cuotas = pagoNegocio.getCuotasByPrestamo(idPrestamo);
			
			
			request.getSession().setAttribute("Cuotas", cuotas);
			
			RequestDispatcher rd = request.getRequestDispatcher("AbonarPrestamos.jsp");
            rd.forward(request, response);
            
		}
		
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		if(request.getParameter("btnPagarCuota") != null) {
			
			  
			String idCuotaString = request.getParameter("idcuota"); 
			int idCuota = Integer.parseInt(idCuotaString); 
			request.setAttribute("idCuota", idCuota); 
			RequestDispatcher rd = request.getRequestDispatcher("PagarCuota.jsp");
			rd.forward(request, response);
			

	    	   
	       }
		
		
	}

}























