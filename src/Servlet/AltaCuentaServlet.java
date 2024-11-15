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

/**
 * Servlet implementation class AltaCuentaServlet
 */
@WebServlet("/AltaCuentaServlet")
public class AltaCuentaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ClienteDao clienteDao;
    private CuentaDao cuentaDao;
    
    public void init() {
        clienteDao = ClienteDao.ObtenerInstancia();
        cuentaDao = CuentaDao.obtenerInstancia();
    }

    public AltaCuentaServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
        List<Cliente> clientesActivos = clienteDao.listar();
        
     
        request.setAttribute("clientes", clientesActivos);
        
   
        request.getRequestDispatcher("/AltaCuenta.jsp").forward(request, response);
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

        boolean exito = cuentaDao.crearCuenta(nuevaCuenta);

        if (exito) {
        	 response.getWriter().write("Cuenta creada exitosamente");
        } else {
        	response.getWriter().write("Error al crear la cuenta");
        }
    }
}

