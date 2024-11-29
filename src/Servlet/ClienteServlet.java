package Servlet;


import java.io.IOException;
import java.time.LocalDate;
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
import NegocioImpl.ClienteNegocio;
import NegocioImpl.ProvinciaNegocio;

@WebServlet("/ClienteServlet")
public class ClienteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
    private ClienteNegocio clienteNegocio =  new ClienteNegocio();
    private ArrayList<Provincia> provincias = new ArrayList<Provincia>();
    
    
    private void ActualizarLista(HttpServletRequest request, HttpServletResponse response)    throws ServletException, IOException {
   	 List<Cliente> listaClientes = clienteNegocio.listar(); 	 
   	 LlenarDdlProvincias(request, response);
   	 
   	 for (Cliente cliente : listaClientes) {
         for (Provincia provincia : provincias) {
             if (cliente.getProvincia() != null && cliente.getProvincia().getId_provincia() == provincia.getId_provincia()) {
                 cliente.setProvincia(provincia);
                 break; 
             }
         }
     }
   	 
        request.setAttribute("clientes", listaClientes);
        request.getRequestDispatcher("ListarBanco.jsp").forward(request, response);
   }
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
               
        if(request.getParameter("IdCliente") != null) {
        	
        int idCliente = Integer.parseInt(request.getParameter("IdCliente"));
        	Cliente clienteModify = clienteNegocio.getClienteById(idCliente);
        	clienteModify.getApellido();
        	LlenarDdlProvincias(request, response);
        	
        	request.setAttribute("Cliente", clienteModify);
        	request.getRequestDispatcher("ModificarClienteUser.jsp").forward(request, response);	
        	
        }
        if(request.getParameter("Alta")!=null){
        	LlenarDdlProvincias(request,response);
        	request.getRequestDispatcher("AltaClienteUser.jsp").forward(request, response);	
        }
        
        ActualizarLista(request, response);
    }
    
 
    private void  LlenarDdlProvincias(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	ProvinciaNegocio provNegocio = new ProvinciaNegocio();	
		provincias = provNegocio.getAll();
		
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
	     LocalDate nacimiento = LocalDate.parse(request.getParameter("fechaNacimiento"));

        cliente.setNacimiento(nacimiento);
        
        int IdProv =Integer.parseInt(request.getParameter("DdlProvincia"));
        Provincia prov = new Provincia(IdProv,"");
        cliente.setProvincia(prov);
        cliente.setEmail(request.getParameter("email"));
        cliente.setTelefono(request.getParameter("telefono"));

        cliente.setId(Integer.parseInt(request.getParameter("id")));
        
        Cliente resultado = clienteNegocio.Modificar(cliente);

        if (resultado != null) {
          
            ActualizarLista(request, response);
            request.getRequestDispatcher("ListarBanco.jsp").forward(request, response);	
            
        } else {
        	
        }
			
	}
	
    

}
