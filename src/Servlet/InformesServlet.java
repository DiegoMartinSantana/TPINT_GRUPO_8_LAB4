package Servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dominio.Informe;
import Negocio.IInformeNegocio;
import NegocioImpl.InformeNegocio;

/**
 * Servlet implementation class InformesServlert
 */
@WebServlet("/InformesServlet")
public class InformesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private IInformeNegocio informesNegocio;
    
    public InformesServlet() {
    	this.informesNegocio = new InformeNegocio();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("Informes.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("btnGenerar") != null) {
		
		try {
				
		Date fechaDesde = Date.valueOf(request.getParameter("fechaDesde"));
        Date fechaHasta = Date.valueOf(request.getParameter("fechaHasta"));
        
        
		Informe informePrestamos = informesNegocio.obtenerInformePrestamos(fechaDesde, fechaHasta);
		
        
        request.setAttribute("informePrestamos", informePrestamos);
		
        request.getRequestDispatcher("Informes.jsp").forward(request, response);
        
		}
		
		catch(Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al generar informes: " + e.getMessage());
            request.getRequestDispatcher("Informes.jsp").forward(request, response);
		}

		}
	}
	
}
