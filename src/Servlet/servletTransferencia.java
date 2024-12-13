package Servlet;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dominio.Transferencia;
import NegocioImpl.TransferenciaNegocio;

@WebServlet("/servletTransferencia")
public class servletTransferencia extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public servletTransferencia() {
        super();
    }

    
    private TransferenciaNegocio transferenciaNegocio = new TransferenciaNegocio();
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/transferencia.jsp").forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("btnTransferencia") != null) {
		    try {
		        String origenParam = request.getParameter("id_cuenta_origen");
		        String tipoDestino = request.getParameter("cuentaDestinoOpciones");
		        String cbuDestinoParam;
		        String destinoParam = request.getParameter("id_cuenta_destino");
		        String importeParam = request.getParameter("importe");
		        String detalle = request.getParameter("detalle");
		        Transferencia transferencia = new Transferencia();
		        int idCuentaOrigen = Integer.parseInt(origenParam);
		        float importe = Float.parseFloat(importeParam);
		        int idCuentaDestino = Integer.parseInt(destinoParam);

		        if ("misCuentas".equals(tipoDestino)) {
		            transferencia.setId_cuenta_origen(idCuentaOrigen);
		            transferencia.setId_cuenta_destino(idCuentaDestino);
		            transferencia.setImporte_transferencia(importe);
		            transferencia.setDetalle(detalle);
		        } else if ("otraCuenta".equals(tipoDestino)) {
		            cbuDestinoParam = request.getParameter("cbuOtro");
		            idCuentaDestino = transferenciaNegocio.obtenerIDCuentaPorCBU(cbuDestinoParam);
		            transferencia.setId_cuenta_origen(idCuentaOrigen);
		            transferencia.setId_cuenta_destino(idCuentaDestino);
		            transferencia.setImporte_transferencia(importe);
		            transferencia.setDetalle(detalle);
		        } else {
		            throw new IllegalArgumentException("Opción de cuenta destino no válida.");
		        }

		        if (origenParam == null || destinoParam == null || importeParam == null) {
		            throw new IllegalArgumentException("Datos incompletos. Verifique el formulario.");
		        }

		        if (idCuentaOrigen == idCuentaDestino) {
		            request.getSession().setAttribute("MismasCuentas", -1);
		            request.getRequestDispatcher("Transferencias.jsp").forward(request, response);
		            return;
		        } else {
		            request.getSession().removeAttribute("MismasCuentas");
		        }

		        if (importe <= 0) {
		            throw new IllegalArgumentException("El importe debe ser mayor a cero.");
		        }

		        boolean transferenciaExitosa = transferenciaNegocio.realizarTransferencia(transferencia);
		        if (transferenciaExitosa) {
		            request.setAttribute("mensaje", "Transferencia realizada con éxito.");
		            request.setAttribute("tipoMensaje", "success");
		        } else {
		            request.setAttribute("mensaje", "No tienes saldo suficiente.");
		            request.setAttribute("tipoMensaje", "error");
		        }
		    } catch (NumberFormatException e) {
		        request.setAttribute("mensaje", "Error: Datos inválidos. Verifique los números.");
		        request.setAttribute("tipoMensaje", "error");
		    } catch (IllegalArgumentException e) {
		        request.setAttribute("mensaje", "Error: " + e.getMessage());
		        request.setAttribute("tipoMensaje", "error");
		    } catch (Exception e) {
		        e.printStackTrace(); 
		        request.setAttribute("mensaje", "Error inesperado: " + e.getMessage());
		        request.setAttribute("tipoMensaje", "error");
		    }

		    request.getRequestDispatcher("/Transferencias.jsp").forward(request, response);
		}
		
	}
	}


