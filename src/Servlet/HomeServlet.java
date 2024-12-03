package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dominio.Cliente;
import Dominio.Cuenta;
import Dominio.Movimiento;
import NegocioImpl.ClienteNegocio;
import NegocioImpl.CuentaNegocio;
import NegocioImpl.MovimientoNegocio;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private MovimientoNegocio movNegocio = new MovimientoNegocio();
       private CuentaNegocio cuentaNegocio = new CuentaNegocio();
       private ClienteNegocio clienteNegocio  = new ClienteNegocio();
		private ArrayList<Cuenta> cuentas = new ArrayList<Cuenta>();
		
    public HomeServlet() {
        super();
    }
	
	private void ObtenerCliente(String nombreUsuario,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cliente cliente = clienteNegocio.getClienteByNombreUsuario(nombreUsuario);
		
		cuentas = cuentaNegocio.listarCuentasxCliente(cliente.getId());		
		if(cuentas.size()==0) {
			RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
	        rd.forward(request, response);
		}
	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String IdCuenta = request.getParameter("cuentaId");
		String nombreUser= (String) request.getSession().getAttribute("UsuarioNombre");
		
		ObtenerCliente(nombreUser,request,response);
		
	
	     ArrayList<Movimiento> Transferencias = new ArrayList<Movimiento>();
	     
		if(IdCuenta !=null) {
			int idCuenta = Integer.parseInt(IdCuenta);
			Transferencias=  movNegocio.obtenerUltimasTransferencias(idCuenta);
		}else {
			int idCuenta = cuentas.get(0).getIdCuenta();
			Transferencias =  movNegocio.obtenerUltimasTransferencias(idCuenta);
		}
		request.getSession().setAttribute("Cuentas", cuentas);
	     request.getSession().setAttribute("Transferencias", Transferencias);
	     
		RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
        rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}



