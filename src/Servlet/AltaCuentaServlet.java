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
import NegocioImpl.ClienteNegocio;
import NegocioImpl.CuentaNegocio;

/**
 * Servlet implementation class AltaCuentaServlet
 */
@WebServlet("/AltaCuentaServlet")
public class AltaCuentaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ClienteNegocio clienteNegocio = new ClienteNegocio();
    private CuentaNegocio cuentaNegocio = new CuentaNegocio();
  
    
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

        Cuenta nuevaCuenta = new Cuenta();
        nuevaCuenta.setIdCliente(idCliente);
        nuevaCuenta.setTipo(tipoCuenta);
        nuevaCuenta.setCreacion(fechaCreacion);
        
        nuevaCuenta.setSaldo(saldoInicial);
        nuevaCuenta.setActiva(activa);

        boolean exito = cuentaNegocio.agregarCuenta(nuevaCuenta);

        if (exito != false) {
            
            ActualizarLista(request, response);
            request.getRequestDispatcher("ListarBanco.jsp").forward(request, response);	
            
        }
        
    }
}

