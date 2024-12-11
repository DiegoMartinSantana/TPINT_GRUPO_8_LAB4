package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatosImpl.CuentaDao;
import Dominio.Cuenta;
import NegocioImpl.CuentaNegocio;


@WebServlet("/CuentaServlet")
public class CuentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CuentaNegocio cuentaNegocio = new  CuentaNegocio();
       
    public void init() {
    
    }
	
    public CuentaServlet() {
        super();
    }

    public void actualizarCuenta (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	if(request.getParameter("Limite")!=null){
    		int limite = Integer.parseInt(request.getParameter("Limite"));
    		
    		if(limite==2) {
    		request.getSession().removeAttribute("CreadaCorrectamente");
    	 	request.getSession().setAttribute("LimiteCuentas", true);
    	 	request.getRequestDispatcher("AltaCuenta.jsp").forward(request, response);
    	 	return;
    	 	}
    				else if(limite==1){
    		request.getSession().removeAttribute("LimiteCuentas");
    	 	request.getSession().setAttribute("CreadaCorrectamente", true);
    	 	request.getRequestDispatcher("AltaCuenta.jsp").forward(request, response);
    	}
    }
    	
    	List<Cuenta> listaCuenta = cuentaNegocio.obtenerCuentas();
        request.setAttribute("cuentas", listaCuenta);
        request.getRequestDispatcher("ListarCuenta.jsp").forward(request, response);
        return;
        
    
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	             

	        if(request.getParameter("EliminarIdCuenta")!=null) {
	        	
	        	int idCuenta = Integer.parseInt(request.getParameter("EliminarIdCuenta"));
	        	
	        	cuentaNegocio.eliminarCuenta(idCuenta);
       	
	        }
	                
	        actualizarCuenta (request, response);
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}