package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dominio.Transferencia;
import NegocioImpl.PagoNegocio;

@WebServlet("/PagarCuota")
public class PagarCuotaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PagoNegocio pagoNegocio = new PagoNegocio();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("btnPagarCuota") != null) {
		    	int idCuentaPago = Integer.parseInt(request.getParameter("id_cuenta_pago")); 
		    	// validar saldo previo a pagar
		    	int idCuotaPago = Integer.parseInt(request.getParameter("idCuota"));
		    	
		    	boolean resultado = pagoNegocio.pagar(idCuotaPago);
		    	
		    if(!resultado) {
                request.setAttribute("saldoInsuficiente", true);
		    	
		    }else {
		    	request.setAttribute("pagoRealizado", true);
		    }
		    			    	
		    request.getRequestDispatcher("PagarCuota.jsp?idCuota=" + idCuotaPago).forward(request, response);
		
		
		
		
	}

}}
