package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dominio.Cliente;
import Dominio.Cuenta;
import Dominio.Movimiento;
import Dominio.Usuario;
import NegocioImpl.ClienteNegocio;
import NegocioImpl.CuentaNegocio;
import NegocioImpl.MovimientoNegocio;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MovimientoNegocio movNegocio = new MovimientoNegocio();
    private ClienteNegocio clienteNegocio = new ClienteNegocio();
    private CuentaNegocio cuentaNegocio = new CuentaNegocio();


    public HomeServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario user = (Usuario) request.getSession().getAttribute("Usuario");

        if (user == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        Cliente cliente = clienteNegocio.getClienteByNombreUsuario(user.getNombre_usuario());
        if (cliente != null) {
            request.setAttribute("cliente", cliente);

            List<Cuenta> cuentas = cuentaNegocio.obtenerCuentasPorCliente(cliente.getId());
            request.setAttribute("cuentas", cuentas);

            ArrayList<Movimiento> transferencias = new ArrayList<>();
            for (Cuenta cuenta : cuentas) {
                transferencias.addAll(movNegocio.obtenerUltimasTransferencias(cuenta.getIdCuenta()));
            }
            request.setAttribute("transferencias", transferencias);

            RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("Login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}


