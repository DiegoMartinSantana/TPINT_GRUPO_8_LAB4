package Servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatosImpl.ClienteDao;
import DatosImpl.UsuarioDao;
import Dominio.TipoUsuario;
import NegocioImpl.ClienteNegocio;
import NegocioImpl.UsuarioNegocio;

/**
 * Servlet implementation class servletUsuario
 */
@WebServlet("/servletUsuario")
public class servletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	private UsuarioNegocio userNegocio = new UsuarioNegocio();
	private ClienteNegocio clienteNegocio  =new ClienteNegocio();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if (request.getParameter("btnAceptar") != null) {
			 String nombreUsuario = request.getParameter("usuario");
			 String contrasena = request.getParameter("contrasena");
			
			 int tipoUsuario = 2;
				
			 
			 int dni = Integer.parseInt(request.getParameter("dni"));
			 String cuil = request.getParameter("cuil");
		     String nombre = request.getParameter("nombre");
		     String apellido = request.getParameter("apellido");
		     int sexo = Integer.parseInt(request.getParameter("sexo"));
		     String nacionalidad = request.getParameter("nacionalidad");
		     LocalDate nacimiento = LocalDate.parse(request.getParameter("fechaNacimiento"));
		     String domicilio = request.getParameter("domicilio");
		     String localidad = request.getParameter("localidad");
		     String email = request.getParameter("correoElectronico");
		     String telefono = request.getParameter("telefono");
		     int IdProv =Integer.parseInt(request.getParameter("DdlProvincia"));
		     
		     boolean existe=userNegocio.BuscarUsuario(nombreUsuario);
		     
			if (existe==false) {

				userNegocio.insert(nombreUsuario, tipoUsuario, contrasena);

				boolean agrego = clienteNegocio.insert(nombreUsuario, dni, cuil, nombre, apellido, sexo, nacionalidad,
						nacimiento, domicilio, localidad, IdProv, email, telefono);

				if (agrego) {

					request.getRequestDispatcher("AltaClienteUser.jsp?Agregado=" + true).forward(request, response);

				}
				else {
					request.getRequestDispatcher("AltaClienteUser.jsp?NoAgregadoPorOtro=" + true).forward(request, response);
				}
			}
			 else {
				 
				 request.getRequestDispatcher("AltaClienteUser.jsp?NoAgregado=" + true).forward(request, response);
				 
			 }
		        
		
		}	
	}

}

