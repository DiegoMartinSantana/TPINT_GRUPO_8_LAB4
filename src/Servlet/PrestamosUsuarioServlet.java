package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    
    private PrestamosNegocio prestamosNegocio = new PrestamosNegocio();
    private CuentaNegocio cuentaNegocio = new CuentaNegocio();

    private ClienteNegocio clienteNegocio  = new ClienteNegocio();
    private ArrayList<PrestamoDto> prestamosAceptados;
    
	private ArrayList<PrestamoDto> prestamosFiltrados = new ArrayList<PrestamoDto>();
	
    private void actualizarListado (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Usuario usuarioLogin = (Usuario) request.getSession().getAttribute("Usuario");
	  
	    
	    Cliente cliente = clienteNegocio.getClienteByNombreUsuario(usuarioLogin.getNombre_usuario());

	     
	    ArrayList<Cuenta> cuentas = cuentaNegocio.listarCuentasxCliente(cliente.getId());
	    
	    obtenerPrestamos(cuentas);

	    /*
    	 prestamosAceptados = new ArrayList<PrestamoDto>();
    	 prestamosAceptados = prestamosNegocio.GetAll();
    	 */
    	
	    //
    	request.getSession().setAttribute("AllPrestamos",prestamosFiltrados);
    	
		RequestDispatcher rd = request.getRequestDispatcher("ListarPrestamosUser.jsp");
        rd.forward(request, response);
		
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		actualizarListado(request, response);

		
	}

	 private void obtenerPrestamos (ArrayList<Cuenta> cuentas ) {
	    	
		 int x =0;
		 ArrayList<PrestamoDto> prestamos = new ArrayList<PrestamoDto>();
		 ArrayList<PrestamoDto> allPrestamos = new ArrayList<PrestamoDto>();
		 prestamos = prestamosNegocio.GetAll();
			 for (Cuenta cuenta : cuentas) {
				x++; 


				 prestamosFiltrados = (ArrayList<PrestamoDto>) prestamos.stream()
		           .filter(prestamo -> prestamo.getIdCuenta() == cuenta.getIdCuenta())
		        .collect(Collectors.toList());
				
				 allPrestamos.addAll(prestamosFiltrados);

		        }
     
	 }
	 
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}






















