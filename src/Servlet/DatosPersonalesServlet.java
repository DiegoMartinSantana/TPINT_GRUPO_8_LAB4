package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatosImpl.ClienteDao;
import Dominio.Cliente;
import Dominio.Usuario;
import NegocioImpl.ClienteNegocio;

@WebServlet("/DatosPersonalesServlet")
public class DatosPersonalesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    

    ClienteNegocio clienteNegocio = new ClienteNegocio();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Usuario user = (Usuario) request.getSession().getAttribute("Usuario");


        if (user == null) {
            response.sendRedirect("Login.jsp");
            return;
        }


        Cliente cliente = clienteNegocio.getClienteByNombreUsuario(user.getNombre_usuario());

        if (cliente != null) {
            request.setAttribute("cliente", cliente);
            request.getRequestDispatcher("DatosPersonales.jsp").forward(request, response);
        } else {
            response.sendRedirect("Login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        
    }

	 
    public DatosPersonalesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
}