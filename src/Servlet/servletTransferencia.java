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
import Negocio.ITransferenciaNegocio;
import NegocioImpl.ClienteNegocio;
import NegocioImpl.MovimientoNegocio;
import NegocioImpl.TransferenciaNegocio;

/**
 * Servlet implementation class servletTrasferencia
 */
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
                int idCuentaOrigen = Integer.parseInt(request.getParameter("id_cuenta_origen"));
                int idCuentaDestino = Integer.parseInt(request.getParameter("id_cuenta_destino"));
                float importe = Float.parseFloat(request.getParameter("importe"));
                String detalle = request.getParameter("detalle");

                Transferencia transferencia = new Transferencia();
                transferencia.setId_cuenta_origen(idCuentaOrigen);
                transferencia.setId_cuenta_destino(idCuentaDestino);
                transferencia.setImporte_transferencia(importe);
                transferencia.setDetalle(detalle);

                boolean resultado = transferenciaNegocio.realizarTransferencia(transferencia);

                if (resultado) {
                    request.setAttribute("mensaje", "Transferencia realizada con éxito.");
                    request.setAttribute("tipoMensaje", "success");
                } else {
                    request.setAttribute("mensaje", "Error al realizar la transferencia.");
                    request.setAttribute("tipoMensaje", "error");
                }
            } catch (Exception e) {
                request.setAttribute("mensaje", "Error: " + e.getMessage());
                request.setAttribute("tipoMensaje", "error");
            }

            request.getRequestDispatcher("/Home.jsp").forward(request, response);
        }
		
	}
	}


