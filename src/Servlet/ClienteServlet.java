package Servlet;


import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dominio.Cliente;
import Dominio.Provincia;
import NegocioImpl.ClienteNegocio;
import NegocioImpl.ProvinciaNegocio;

@WebServlet("/ClienteServlet")
public class ClienteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
    private ClienteNegocio clienteNegocio =  new ClienteNegocio();
    private ArrayList<Provincia> provincias = new ArrayList<Provincia>();
    
    
    private void ActualizarLista(HttpServletRequest request, HttpServletResponse response,int eliminado)    throws ServletException, IOException {
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
        if(eliminado==0) {
        request.getRequestDispatcher("ListarBanco.jsp").forward(request, response);
        }else if(eliminado==1) {
        	
        	request.getRequestDispatcher("ListarBanco.jsp?Eliminado=" + true).forward(request, response);

        	return;
        }else if(eliminado==2) {
        	
         	request.getRequestDispatcher("ListarBanco.jsp?TieneCuentas=" + true).forward(request, response);

        	return;
        	
        }
   }
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            
    
    	
        if(request.getParameter("IdClienteEditar") != null) {
        	
        int idCliente = Integer.parseInt(request.getParameter("IdClienteEditar"));
        	Cliente clienteModificar = clienteNegocio.getClienteById(idCliente);
        	
        	
        	LlenarDdlProvincias(request, response);
        	
        	
        	request.setAttribute("Cliente", clienteModificar);
        	request.getRequestDispatcher("ModificarClienteUser.jsp").forward(request, response);	
        	return;
        }
        if(request.getParameter("Alta")!=null){
        	LlenarDdlProvincias(request,response);
        	request.getRequestDispatcher("AltaClienteUser.jsp").forward(request, response);	
        }
        if(request.getParameter("IdClienteEliminar") != null) {
        	int idEliminar = Integer.parseInt(request.getParameter("IdClienteEliminar"));
        	boolean eliminado = clienteNegocio.Eliminar(idEliminar);
        	if(eliminado) {

        		ActualizarLista(request, response, 1);
        	}else {
        			
        		
        		ActualizarLista(request, response, 2);
        	}
        		return;
        }
        ActualizarLista(request, response,0);
    }
    
 
    private void  LlenarDdlProvincias(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	ProvinciaNegocio provNegocio = new ProvinciaNegocio();	
		provincias = provNegocio.getAll();
		
		 request.setAttribute("Provincias", provincias);
		 
	
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Cliente cliente = new Cliente();
	
    cliente.setDni(Integer.parseInt(request.getParameter("dni")));
    
    
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
	
	request.setAttribute("Cliente", resultado);
	request.setAttribute("modificado", true);
	request.getRequestDispatcher("ModificarClienteUser.jsp").forward(request, response);	
	return;
	
    }
}
    

