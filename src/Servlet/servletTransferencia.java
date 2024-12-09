package Servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Datos.ITransferenciaDao;
import DatosImpl.TransferenciaDao;
import Dominio.Cliente;
import Dominio.Cuenta;
import Dominio.Movimiento;
import Dominio.Transferencia;
import Dominio.Usuario;
import NegocioImpl.ClienteNegocio;
import NegocioImpl.MovimientoNegocio;

/**
 * Servlet implementation class servletTrasferencia
 */
@WebServlet("/servletTransferencia")
public class servletTransferencia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/*private MovimientoNegocio movimientoNegocio = new MovimientoNegocio();
	 ClienteNegocio clienteNegocio = new ClienteNegocio();
	 TransferenciaDao traDao = new TransferenciaDao();*/
	
    public servletTransferencia() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    private ITransferenciaDao transferenciaDAO = new TransferenciaDao();
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/transferencia.jsp").forward(request, response);
	}
	
	//-1 = mismas cuentas
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("btnTransferencia") != null) {
	        try {
	            // Obtener parámetros del formulario
	            String origenParam = request.getParameter("id_cuenta_origen");
	            String tipoDestino = request.getParameter("cuentaDestinoOpciones");
	            String destinoParam;

	            if ("misCuentas".equals(tipoDestino)) {
	                destinoParam = request.getParameter("id_cuenta_destino");
	            } else if ("otraCuenta".equals(tipoDestino)) {
	                destinoParam = request.getParameter("cbuOtro");
	            } else {
	                throw new IllegalArgumentException("Opción de cuenta destino no válida.");
	            }
	            String importeParam = request.getParameter("importe");

	            if (origenParam == null || destinoParam == null || importeParam == null) {
	                throw new IllegalArgumentException("Datos incompletos. Verifique el formulario.");
	            }

	            int idCuentaOrigen = Integer.parseInt(origenParam);
	            int idCuentaDestino = Integer.parseInt(destinoParam);
	            float importe = Float.parseFloat(importeParam);
	            String detalle = request.getParameter("detalle");

	         
	            if (idCuentaOrigen == idCuentaDestino) {
	            	request.getSession().setAttribute("MismasCuentas", -1 );
	            	request.getRequestDispatcher("Transferencias.jsp").forward(request, response);
	            	return;
	             
	            }else {
	         
	            	request.getSession().removeAttribute("MismasCuentas");
	            }
	            if (importe <= 0) {
	                throw new IllegalArgumentException("El importe debe ser mayor a cero.");
	            }

	            // Crear objeto de transferencia
	            Transferencia transferencia = new Transferencia();
	            transferencia.setId_cuenta_origen(idCuentaOrigen);
	            transferencia.setId_cuenta_destino(idCuentaDestino);
	            transferencia.setImporte_transferencia(importe);
	            transferencia.setDetalle(detalle);

	            // Procesar transferencia
	            transferenciaDAO.generarTransferencia(transferencia);

	            // Configurar mensaje de éxito
	            request.setAttribute("mensaje", "Transferencia realizada con éxito.");
	            request.setAttribute("tipoMensaje", "success");
	        } catch (NumberFormatException e) {
	            request.setAttribute("mensaje", "Error: Datos inválidos. Verifique los números.");
	            request.setAttribute("tipoMensaje", "error");
	        } catch (IllegalArgumentException e) {
	            request.setAttribute("mensaje", "Error: " + e.getMessage());
	            request.setAttribute("tipoMensaje", "error");
	        } catch (Exception e) {
	            e.printStackTrace(); // Debug en consola
	            request.setAttribute("mensaje", "Error inesperado: " + e.getMessage());
	            request.setAttribute("tipoMensaje", "error");
	        }

	        // Reenviar al JSP
	        request.getRequestDispatcher("/Transferencias.jsp").forward(request, response);
	    }
		
	}
	}


