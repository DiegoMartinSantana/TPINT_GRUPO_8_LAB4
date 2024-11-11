package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatosImpl.ClienteDao;
import DatosImpl.UsuarioDao;
import Dominio.Cliente;
import Dominio.TipoUsuario;
import Dominio.Usuario;

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

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if (request.getParameter("btnAceptar") != null) {
			
			 String nombreUsuario = request.getParameter("usuario");
			 String contrasena = request.getParameter("contrasena");
			 int tipoUsuario = 2;
			 boolean activo = true;
			 
			 
			 int dni = Integer.parseInt(request.getParameter("dni"));
			 String cuil = request.getParameter("cuil");
		     String nombre = request.getParameter("nombre");
		     String apellido = request.getParameter("apellido");
		     int sexo = Integer.parseInt(request.getParameter("sexo"));
		     String nacionalidad = request.getParameter("nacionalidad");
		     String domicilio = request.getParameter("domicilio");
		     String localidad = request.getParameter("localidad");
		     String email = request.getParameter("correoElectronico");
		     String telefono = request.getParameter("telefono");
		     
			 
		     UsuarioDao udao= new UsuarioDao();
		     udao.Insertar(nombreUsuario,tipoUsuario,contrasena);
		     
		     ClienteDao cdao =new ClienteDao();
		     cdao.insert(nombreUsuario, dni, cuil, nombre, apellido, sexo, nacionalidad, domicilio, localidad, 1, email, telefono, activo);
		     
		     
			 
		     RequestDispatcher rd = request.getRequestDispatcher("/AltaClienteUser.jsp");   
		     rd.forward(request, response);    
			 
			
			
			
		}
	
	
	}

}
