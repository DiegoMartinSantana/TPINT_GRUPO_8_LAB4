package Servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
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
        return;
    }

protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
  
        
    	
    	int idCliente = Integer.parseInt(request.getParameter("clientes")); 
        int tipoCuenta = Integer.parseInt(request.getParameter("tipoCuenta"));
      
        LocalDate fechaCreacion = LocalDate.parse(request.getParameter("fechaCreacion"));
        float saldoInicial = 10000; 
        boolean activa = true; 
        
        int UltimoIDCuenta = cuentaNegocio.obtenerUltimoIDCuenta();
        
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
        boolean exito_mov=false;
        int resultado = cuentaNegocio.agregarCuenta(nuevaCuenta);
        
        if(resultado==1) {
        	exito_mov= movimientoNegocio.crearMovimiento(nuevoMovimiento);
        	
        }
    	
        if(resultado == 3) {
       
        	  request.getRequestDispatcher("CuentaServlet?Limite="+2).forward(request, response);
        	return;
        }
    	if (resultado==1 && exito_mov) {
    		request.getSession().removeAttribute("LimiteCuentas");
    		request.setAttribute("CuentaCreada", true);
            request.getRequestDispatcher("AltaCuenta.jsp").forward(request, response);


        }
      
        
    }
}