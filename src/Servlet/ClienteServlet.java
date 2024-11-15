package Servlet;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DatosImpl.ClienteDao;
import DatosImpl.ProvinciaDao;
import DatosImpl.UsuarioDao;
import Dominio.Cliente;
import Dominio.Provincia;

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
        	//va al modificar si es distinto null
        int idCliente = Integer.parseInt(request.getParameter("IdCliente"));
        	Cliente clienteModify = clienteDao.getClienteById(idCliente);
        	clienteModify.getApellido();
        	//redirect a modificar con Cliente entero como parametro
        	request.setAttribute("Cliente", clienteModify);
        	request.getRequestDispatcher("ModificarClienteUser.jsp").forward(request, response);	
        	
        }
        if(request.getParameter("Alta")!=null){
        	LlenarDdlProvincias(request,response);
        	request.getRequestDispatcher("AltaClienteUser.jsp").forward(request, response);	
        }
        
        ActualizarLista(request, response);
    }
    
  
    private void LlenarDdlProvincias(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	ProvinciaDao provDao = new ProvinciaDao();
		
		ArrayList<Provincia> provincias = new ArrayList<Provincia>();
		
		provincias = provDao.getAll();
		//redirect to the usuariocliente jsp
		
		 request.setAttribute("Provincias", provincias);
        
		
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	Cliente cliente = new Cliente();
    	
        cliente.setDni(Integer.parseInt(request.getParameter("dni")));
      
       
                
        //falta provincia
        //falta nacimiento
        
        cliente.setNombre(request.getParameter("nombre"));
        cliente.setCuil(request.getParameter("cuil"));
        cliente.setApellido(request.getParameter("apellido"));
        cliente.setSexo(request.getParameter("sexo").equals("Masculino") ? 1 : (request.getParameter("sexo").equals("Femenino") ? 2 : 3));
        cliente.setNacionalidad(request.getParameter("nacionalidad"));
        cliente.setDomicilio(request.getParameter("direccion"));
        cliente.setLocalidad(request.getParameter("localidad"));
        //falta provincia
        cliente.setEmail(request.getParameter("email"));
        cliente.setTelefono(request.getParameter("telefono"));

        cliente.setId(Integer.parseInt(request.getParameter("id")));
        
        Cliente resultado = clienteDao.Modificar(cliente);

        if (resultado != null) {
          
            ActualizarLista(request, response);
            request.getRequestDispatcher("ListarBanco.jsp").forward(request, response);	
            
        } else {
        	
        }
			
	}
	

}
