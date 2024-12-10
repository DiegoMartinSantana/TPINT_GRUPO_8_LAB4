package Servlet;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import Dominio.Cliente;
import Dominio.Cuenta;
import Dominio.Prestamo;
import Dominio.Usuario;
import Dominio.Dto.PrestamoDto;
import NegocioImpl.ClienteNegocio;
import NegocioImpl.CuentaNegocio;
import NegocioImpl.PrestamosNegocio;
import NegocioImpl.UsuarioNegocio;


@WebServlet("/PrestamosUsuario")
public class PrestamosUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PrestamosUsuarioServlet() {
        super();
 
    }
   	private ArrayList<PrestamoDto> prestamosPorPagar = new ArrayList<PrestamoDto>();
   	
    private PrestamosNegocio prestamosNegocio = new PrestamosNegocio();
    private CuentaNegocio cuentaNegocio = new CuentaNegocio();

    private ClienteNegocio clienteNegocio  = new ClienteNegocio();
   
    
	private ArrayList<PrestamoDto> prestamosFiltrados = new ArrayList<PrestamoDto>();
    
	private ArrayList<PrestamoDto> prestamosHistorico= new ArrayList<PrestamoDto>();
	
    private void actualizarListado (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Usuario usuarioLogin = (Usuario) request.getSession().getAttribute("Usuario");
    	
    	

	    Cliente cliente = clienteNegocio.getClienteByNombreUsuario(usuarioLogin.getNombre_usuario());

	     
	    ArrayList<Cuenta> cuentas = cuentaNegocio.listarCuentasxCliente(cliente.getId());
	    
	    if(request.getParameter("pagar")!=null) {
	    		
	    		prestamosPorPagar.clear();

	    			obtenerPrestamosPendientesPago(cuentas);
	    			request.getSession().setAttribute("PrestamosPendientesPago",prestamosPorPagar);
	    				
	    		
	    		RequestDispatcher rd = request.getRequestDispatcher("AbonarPrestamos.jsp");
	            rd.forward(request, response);
	            return;
	    		
	    } else {
	     
	    	prestamosHistorico.clear();
	    	
	    	 obtenerPrestamos(cuentas);
	    	
	    	 request.getSession().setAttribute("AllPrestamos",prestamosHistorico);
	    	 
	    	 RequestDispatcher rd = request.getRequestDispatcher("ListarPrestamosUser.jsp");
		        rd.forward(request, response);
				return;

 		}

    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		if(request.getParameter("insert")!=null){
			
			request.getSession().setAttribute("PrestamoAceptado",true);
		}
		actualizarListado(request, response);

		
	}
	
	private void obtenerPrestamosPendientesPago (ArrayList<Cuenta> cuentas) {

	 int x =0;
	 ArrayList<PrestamoDto> prestamos = new ArrayList<PrestamoDto>();

	 prestamos = prestamosNegocio.GetAllAceptados();
		 for (Cuenta cuenta : cuentas) {
			x++; 
			 prestamosFiltrados = (ArrayList<PrestamoDto>) prestamos.stream()
	           .filter(prestamo -> prestamo.getIdCuenta() == cuenta.getIdCuenta())
	           .filter(prestamo -> prestamo.estado ==1)
	        .collect(Collectors.toList());
			
			prestamosPorPagar.addAll(prestamosFiltrados);
			 	
	        }
 }
 
	 private void obtenerPrestamos (ArrayList<Cuenta> cuentas ) {
		 
		 int x =0;
		 ArrayList<PrestamoDto> prestamos = new ArrayList<PrestamoDto>();
		
		 prestamos = prestamosNegocio.GetAll();
			 for (Cuenta cuenta : cuentas) {
				x++; 


				 prestamosFiltrados = (ArrayList<PrestamoDto>) prestamos.stream()
		           .filter(prestamo -> prestamo.getIdCuenta() == cuenta.getIdCuenta())
		        .collect(Collectors.toList());
				
			prestamosHistorico.addAll(prestamosFiltrados);
				 	
		        }
     
	 }
	 
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}



























