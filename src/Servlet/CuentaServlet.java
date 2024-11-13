package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DatosImpl.CuentaDao;
import Dominio.Cuenta;


@WebServlet("/CuentaServlet")
public class CuentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CuentaDao cuentaDao;
       
    public void init() {
        cuentaDao = CuentaDao.obtenerInstancia();
    }
	
    public CuentaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 List<Cuenta> listaCuenta = cuentaDao.listarCuentas();
	        request.setAttribute("cuentas", listaCuenta);
	        request.getRequestDispatcher("ListarCuenta.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
