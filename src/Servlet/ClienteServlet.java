package Servlet;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatosImpl.ClienteDao;
import DatosImpl.UsuarioDao;
import Dominio.Cliente;

@WebServlet("/ClienteServlet")
public class ClienteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClienteDao clienteDao;
    
    public void init() {
        clienteDao = ClienteDao.ObtenerInstancia();
    }
    private void ActualizarLista(HttpServletRequest request, HttpServletResponse response)    throws ServletException, IOException {
   	 List<Cliente> listaClientes = clienteDao.listar();
        request.setAttribute("clientes", listaClientes);
        request.getRequestDispatcher("ListarBanco.jsp").forward(request, response);
   }
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
        
        if(request.getParameter("IdCliente") != null) {
        int idCliente = Integer.parseInt(request.getParameter("IdCliente"));
        	Cliente clienteModify = clienteDao.getClienteById(idCliente);
        	clienteModify.getApellido();
        	//redirect a modificar con Cliente entero como parametro
        	request.setAttribute("Cliente", clienteModify);
        	request.getRequestDispatcher("ModificarClienteUser.jsp").forward(request, response);
        }
        ActualizarLista(request, response);
    }
  
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	Cliente cliente = new Cliente();

        cliente.setDni(Integer.parseInt(request.getParameter("dni")));
        cliente.setNombre(request.getParameter("nombre"));
        cliente.setApellido(request.getParameter("apellido"));
        cliente.setSexo(request.getParameter("sexo").equals("Masculino") ? 1 : (request.getParameter("sexo").equals("Femenino") ? 2 : 3));
        cliente.setNacionalidad(request.getParameter("nacionalidad"));
        cliente.setDomicilio(request.getParameter("direccion"));
        cliente.setLocalidad(request.getParameter("localidad"));
        //falta provincia
        cliente.setEmail(request.getParameter("correo"));
        cliente.setTelefono(request.getParameter("telefono"));
        cliente.setNombreUsuario(request.getParameter("usuario"));
   
        Cliente resultado = clienteDao.Modificar(cliente);

        if (resultado != null) {
            response.getWriter().write("Cliente modificado exitosamente");
            ActualizarLista(request, response);
            
        } else {
        	
            response.getWriter().write("Error al modificar el cliente");
        }
			
	}
	

}
