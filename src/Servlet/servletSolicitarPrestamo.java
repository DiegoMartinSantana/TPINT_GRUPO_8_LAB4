package Servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dominio.Cliente;
import Dominio.PrestamoSolicitado;
import NegocioImpl.CuentaNegocio;
import NegocioImpl.PrestamosNegocio;

/**
 * Servlet implementation class servletSolicitatPrestamo
 */
@WebServlet("/servletSolicitarPrestamo")
public class servletSolicitarPrestamo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 private PrestamosNegocio prestamoNegocio = new PrestamosNegocio();
       
   
    public servletSolicitarPrestamo() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		float importeSolicitado = Float.parseFloat(request.getParameter("monto"));
		int plazoCuotas = Integer.parseInt(request.getParameter("cuotas"));
		float interes = Float.parseFloat(request.getParameter("interes"));
		LocalDate fechaCreacion = LocalDate.parse(request.getParameter("fechaCreacion"));
        float importePagar = Float.parseFloat(request.getParameter("importe_pagar"));
        int idCuenta = Integer.parseInt(request.getParameter("cuenta"));
        float montoCuota = importePagar/plazoCuotas;

       
  
        PrestamoSolicitado prestamoSolicitado = new PrestamoSolicitado();
        prestamoSolicitado.setImporteSolicitado(importeSolicitado);
        prestamoSolicitado.setPlazoCuotas(plazoCuotas);
        prestamoSolicitado.setInteres(interes);
        prestamoSolicitado.setFechaPrestamo(fechaCreacion);
        prestamoSolicitado.setImportePagar(importePagar);
        prestamoSolicitado.setIdCuenta(idCuenta);
        prestamoSolicitado.setMontoCuota(montoCuota);
        prestamoSolicitado.setEstado(3);
        
        boolean insertExitoso = prestamoNegocio.crearPrestamoSolicitado(prestamoSolicitado);

       
		RequestDispatcher rd = request.getRequestDispatcher("PrestamosUsuario");
        rd.forward(request, response);
        return;
	}

}
