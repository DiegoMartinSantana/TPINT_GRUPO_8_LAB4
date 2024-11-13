package Servlet;


import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatosImpl.ClienteDao;
import Dominio.Cliente;

@WebServlet("/ClienteServlet")
public class ClienteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClienteDao clienteDao;
    
    public void init() {
        clienteDao = ClienteDao.ObtenerInstancia();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Cliente> listaClientes = clienteDao.listar();
        request.setAttribute("clientes", listaClientes);
        request.getRequestDispatcher("ListarBanco.jsp").forward(request, response);
        
        
    }
}
