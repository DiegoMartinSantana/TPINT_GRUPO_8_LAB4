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
    	List<Cuenta> listaCuenta = cuentaNegocio.obtenerCuentas();
        request.setAttribute("cuentas", listaCuenta);
        request.getRequestDispatcher("ListarCuenta.jsp").forward(request, response);
        
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 //List<Cuenta> listaCuenta = cuentaDao.listarCuentas();
	       // request.setAttribute("cuentas", listaCuenta);
	       // request.getRequestDispatcher("ListarCuenta.jsp").forward(request, response);
	             

	        if(request.getParameter("EliminarIdCuenta")!=null) {
	        	
	        	int idCuenta = Integer.parseInt(request.getParameter("EliminarIdCuenta"));
	        	
	        	cuentaNegocio.eliminarCuenta(idCuenta);
       	
	        }
	                
	        actualizarCuenta (request, response);
        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}