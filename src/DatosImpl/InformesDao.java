package DatosImpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Datos.IInformesDao;
import Dominio.Cliente;
import Dominio.Informe;

public class InformesDao implements IInformesDao {

	private static final String SELECT_INFORMES = "SELECT 	COUNT(*) AS Cantidad,"
			+ "			sum(importe_solicitado) AS Total,"
			+ "			(SELECT CONCAT(nombre, ' ', apellido) as nombre FROM cliente C"
			+ "			JOIN cuenta cu ON c.id_cliente = cu.id_cliente"
			+ "            JOIN prestamo_solicitado ps ON ps.id_cuenta = cu.id_cuenta"
			+ "            JOIN prestamo p on p.id_prestamo_solicitado = ps.id_prestamo_solicitado"
			+ "			GROUP BY CONCAT(nombre, ' ', apellido) ORDER BY COUNT(*) DESC LIMIT 1) AS Cliente_Lider"
			+ "			FROM prestamo WHERE fecha BETWEEN ? AND ?";
	private static final String SELECT_CUMPLIMIENTO = "SELECT " +
            "(SELECT COUNT(*) FROM cuota WHERE fecha_pago IS NOT NULL AND vencimiento BETWEEN ? AND ?) * 100.0 / " +
            "(SELECT COUNT(*) FROM cuota WHERE vencimiento BETWEEN ? AND ?) AS tasa_cumplimiento";
	private static final String SELECT_CLIENTES_VIP = 
		    "SELECT c.id_cliente, c.nombre, c.apellido, SUM(p.importe_solicitado) AS total_prestado \r\n"
		    + "FROM cliente c \r\n"
		    + "		    JOIN cuenta cu ON c.id_cliente = cu.id_cliente "
		    + "		    JOIN prestamo_solicitado ps ON ps.id_cuenta = cu.id_cuenta"
		    + "		    JOIN prestamo p ON ps.id_prestamo_solicitado = p.id_prestamo_solicitado "
		    + "		    GROUP BY c.id_cliente, c.nombre, c.apellido "
		    + "		    ORDER BY total_prestado DESC "
		    + "		    LIMIT 3";
	
	
	public void cargarClientesVIP(Informe informe) throws Exception {
	    PreparedStatement statement = null;
	    Connection conexion = Conexion.getConexion().getSQLConexion();
	    ResultSet rs = null;

	    try {
	        statement = conexion.prepareStatement(SELECT_CLIENTES_VIP);
	        rs = statement.executeQuery();

	        List<Cliente> clientesVIP = new ArrayList<>();
	        while (rs.next()) {
	            Cliente cliente = new Cliente();
	            cliente.setId(rs.getInt("id_cliente"));
	            cliente.setNombre(rs.getString("nombre"));
	            cliente.setApellido(rs.getString("apellido"));
	            cliente.setTotalPrestado(BigDecimal.valueOf(rs.getDouble("total_prestado")));
	            clientesVIP.add(cliente);
	        }

	        informe.setClientesVIP(clientesVIP);
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw e;
	    } finally {
	        if (rs != null) rs.close();
	        if (statement != null) statement.close();
	    }
	}
	
	@Override
	public Informe obtenerInforme(Date fechaDesde, Date fechaHasta) throws Exception {
		
		PreparedStatement statement = null;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        ResultSet rs = null;
		
		Informe informe = new Informe();

		try {
			statement = conexion.prepareStatement(SELECT_INFORMES);
			statement.setDate(1, fechaDesde);
			statement.setDate(2, fechaHasta);
			
			rs = statement.executeQuery();
			
			if (rs.next()) {
				
				informe.setCantidadPrestamos(rs.getInt("Cantidad"));
				informe.setTotalPrestado(BigDecimal.valueOf(rs.getDouble("Total")));
                informe.setClienteLider(rs.getString("Cliente_Lider"));
				
			}
			
			PreparedStatement stmtCumplimiento = conexion.prepareStatement(SELECT_CUMPLIMIENTO);
			stmtCumplimiento.setDate(1, fechaDesde);
			stmtCumplimiento.setDate(2, fechaHasta);
			stmtCumplimiento.setDate(3, fechaDesde);
			stmtCumplimiento.setDate(4, fechaHasta);
			
			ResultSet rsCumplimiento = stmtCumplimiento.executeQuery();
			
			if(rsCumplimiento.next()) {
				informe.setTasaCumplimiento(rsCumplimiento.getDouble("tasa_cumplimiento"));
			}
			
			cargarClientesVIP(informe);
			
			return informe;
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		finally {
			if (rs != null) rs.close();
            if (statement != null) statement.close();
		}
		
		
	}

	
	
}
