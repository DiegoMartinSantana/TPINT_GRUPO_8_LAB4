package Servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatosImpl.TransferenciaDao;
import Dominio.Cliente;
import Dominio.Cuenta;
import Dominio.Movimiento;
import Dominio.Usuario;
import NegocioImpl.ClienteNegocio;
import NegocioImpl.MovimientoNegocio;

/**
 * Servlet implementation class servletTrasferencia
 */
@WebServlet("/servletTrasferencia")
public class servletTrasferencia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MovimientoNegocio movimientoNegocio = new MovimientoNegocio();
	 ClienteNegocio clienteNegocio = new ClienteNegocio();
	 TransferenciaDao traDao = new TransferenciaDao();
	
    public servletTrasferencia() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    String tipoCuentaDestino = request.getParameter("cuentaDestinoOpciones");
	        String cuentaDestino = null;
	        String cbuOtro = null;
	        String detalle = request.getParameter("detalle");
	        float monto = Float.parseFloat(request.getParameter("monto"));
	        LocalDate fechaCreacion = LocalDate.parse(request.getParameter("fechaCreacion"));
	        
	        Movimiento nuevoMovimiento = new Movimiento();
	        Cuenta cuentaDestinoObj = new Cuenta();
	        
	        
	        

	        if ("misCuentas".equals(tipoCuentaDestino)) {
	           
	        	cuentaDestino = request.getParameter("cuentaDestino");
	            cuentaDestinoObj = traDao.obtenerCuentaPorCBU2(cuentaDestino);
	            
	        } else if ("otraCuenta".equals(tipoCuentaDestino)) {
	            
	            cbuOtro = request.getParameter("cbuOtro");

	            if (cbuOtro != null && !cbuOtro.trim().isEmpty()) {
	                
	                
					cuentaDestinoObj = movimientoNegocio.obtenerCuentaPorCBU(cbuOtro);

	                if (cuentaDestinoObj == null) {
	                    
	                    request.setAttribute("error", "No se encontró la cuenta con el CBU proporcionado.");
	                    request.getRequestDispatcher("Transferencias.jsp").forward(request, response);
	                    return;
	                }
	            } else {
	                
	                request.setAttribute("error", "Debe ingresar un CBU válido.");
	                request.getRequestDispatcher("Transferencias.jsp").forward(request, response);
	                return;
	            }
	        }
	        
            
	        
	        
	        nuevoMovimiento.setId_cuenta(cuentaDestinoObj.getIdCuenta());
	        nuevoMovimiento.setTipo(4);
	        nuevoMovimiento.setDetalle(detalle);
	        nuevoMovimiento.setImporte(monto);
	        nuevoMovimiento.setFecha(fechaCreacion);
	        nuevoMovimiento.setId_destino(cuentaDestinoObj.getIdCuenta());
	        
	        
 
	        
	        boolean exito_mov = movimientoNegocio.crearMovimiento(nuevoMovimiento);
	        
	        if (exito_mov) {
	        	
	        	request.getRequestDispatcher("Home.jsp").forward(request, response);	
	            
	            
	        }
	        else {
	        	 System.out.println("NO INGRESO.");
	        }
	        
	        
	        
	        
	        
	        
		
		
	}

}
