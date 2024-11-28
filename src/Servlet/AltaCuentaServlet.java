package Servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatosImpl.ClienteDao;
import DatosImpl.CuentaDao;
import Dominio.Cliente;
import Dominio.Cuenta;
import Dominio.Movimiento;
import NegocioImpl.ClienteNegocio;
import NegocioImpl.CuentaNegocio;
import NegocioImpl.MovimientoNegocio;

/**
 * Servlet implementation class AltaCuentaServlet
 */
@WebServlet("/AltaCuentaServlet")
public class AltaCuentaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ClienteNegocio clienteNegocio = new ClienteNegocio();
    private CuentaNegocio cuentaNegocio = new CuentaNegocio();
    private MovimientoNegocio movimientoNegocio = new MovimientoNegocio();
  
    
    private void ActualizarLista(HttpServletRequest request, HttpServletResponse response)    throws ServletException, IOException {
      	 List<Cuenta> listaCuentas = cuentaNegocio.obtenerCuentas();
           request.setAttribute("cuentas", listaCuentas);
           request.getRequestDispatcher("ListarCuenta.jsp").forward(request, response);
      }
    
    
    public AltaCuentaServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
        List<Cliente> clientesActivos = clienteNegocio.listar();
        
     
        request.setAttribute("clientes", clientesActivos);
        
   
        request.getRequestDispatcher("AltaCuenta.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
        
    	
    	int idCliente = Integer.parseInt(request.getParameter("clientes")); 
        int tipoCuenta = Integer.parseInt(request.getParameter("tipoCuenta"));
      
        String fechaCreacion = request.getParameter("fechaCreacion");
        float saldoInicial = 10000; 
        boolean activa = true; 
        
        int UltimoIDCuenta = movimientoNegocio.obtenerUltimoIDMovimiento();
        
        Movimiento nuevoMovimiento = new Movimiento();
        Cuenta nuevaCuenta = new Cuenta();
        
        nuevaCuenta.setIdCliente(idCliente);
        nuevaCuenta.setTipo(tipoCuenta);
        nuevaCuenta.setCreacion(fechaCreacion);
        
        nuevaCuenta.setSaldo(saldoInicial);
        nuevaCuenta.setActiva(activa);
        
        nuevoMovimiento.setId_cuenta(UltimoIDCuenta);
        nuevoMovimiento.setTipo(1);
        nuevoMovimiento.setDetalle("Alta cuenta");
        nuevoMovimiento.setImporte(saldoInicial);
        nuevoMovimiento.setFecha(fechaCreacion);
        nuevoMovimiento.setId_destino(UltimoIDCuenta);
        
        boolean exito = cuentaNegocio.agregarCuenta(nuevaCuenta);
    	boolean exito_mov = movimientoNegocio.crearMovimiento(nuevoMovimiento);

        if (exito != false && exito_mov !=false) {
        	
        	
        	ActualizarLista(request, response);
            
            request.getRequestDispatcher("ListarBanco.jsp").forward(request, response);	
            
            
        }
    }
}

