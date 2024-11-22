package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatosImpl.ClienteDao;
import Dominio.Cliente;

@WebServlet("/DatosPersonalesServlet")
public class DatosPersonalesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClienteDao clienteDao;

    public void init() {
        clienteDao = ClienteDao.ObtenerInstancia();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        Integer idCliente = (Integer) request.getSession().getAttribute("idCliente");

        if (idCliente != null) {
            Cliente cliente = clienteDao.getClienteById(idCliente);

            if (cliente != null) {
                request.setAttribute("cliente", cliente);
                request.getRequestDispatcher("DatosPersonales.jsp").forward(request, response);
            } 
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