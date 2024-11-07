package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dominio.Usuario;
import NegocioImpl.UsuarioNegocio;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
	String nombreUsuario = request.getParameter("username");
    String password = request.getParameter("password");
    
    Usuario usuario = usuarioNegocio.login(nombreUsuario,password);
    if(usuario == null){
		request.setAttribute("UsuarioNulo", false);
		 RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
	        rd.forward(request, response);
	}
	if(usuario.isActivo()) {
		//Si es admin va hacia posible home admin
		if(usuario.getTipo().codigo== 1) {
			 RequestDispatcher rd = request.getRequestDispatcher("AutorizacionPrestamo.jsp");
		        rd.forward(request, response);
		}else if(usuario.getTipo().codigo==2) {
			 RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
		        rd.forward(request, response);
			
		}
	}else{
		request.setAttribute("UsuarioInactivo", true);
		 RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
	        rd.forward(request, response);
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
