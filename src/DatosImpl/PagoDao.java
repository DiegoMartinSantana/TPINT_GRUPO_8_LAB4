package DatosImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Datos.IPagoDao;
import Dominio.Cuota;
import Dominio.Pago;
import Dominio.Dto.PrestamoDto;

public class PagoDao implements IPagoDao {
	
	private static PagoDao instancia = null;;

	private static final String PAGAR_CUOTA = "CALL PagarCuota(?, ?, ?)";
	private static final String obtenerPago = "SELECT ps.id_cuenta, p.id_prestamo, c.id_cuota " +
            "FROM cuota c " +
            "INNER JOIN prestamo p ON p.id_prestamo = c.id_prestamo " +
            "INNER JOIN prestamo_solicitado ps ON ps.id_prestamo_solicitado = p.id_prestamo_solicitado " +
            "WHERE c.id_cuota = ?;";
	private static final String getCuotasByPrestamo = "SELECT c.* FROM cuota c inner join prestamo p on p.id_prestamo = c.id_prestamo where c.id_Prestamo = ?";
	private static final String getCuentaByCuota = "SELECT p.id_prestamo, ps.id_cuenta, c.id_cuota \r\n"
			+ "from cuota c\r\n"
			+ "inner join prestamo p on p.id_prestamo = c.id_prestamo\r\n"
			+ "inner join prestamo_solicitado ps on ps.id_prestamo_solicitado = p.id_prestamo_solicitado\r\n"
			+ "where c.id_cuota = ?";
	
	public static PagoDao obtenerInstancia() {
        if (instancia == null) {
            instancia = new PagoDao();
        }
        return instancia;
    }
	
	
	public Pago obtenerPago(int idCouta) {
		
	    PreparedStatement statement;
	    Connection conexion = Conexion.getConexion().getSQLConexion();
	    Pago pago = new Pago();
	    try {
	        statement = conexion.prepareStatement(obtenerPago);
	        statement.setInt(1, idCouta);
	        ResultSet resultSet = statement.executeQuery();

            
	        if (resultSet.next()) { 
       
	            pago.setIdCuota(resultSet.getInt("id_cuota"));
	            pago.setIdPrestamo(resultSet.getInt("id_prestamo"));
	            pago.setIdCuenta(resultSet.getInt("id_cuenta"));

	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return pago;
	}
	
	
	public ArrayList<Cuota> getCuotasByPrestamo(int idPrestamo) {
	    ArrayList<Cuota> cuotas = new ArrayList<>();
	    PreparedStatement statement;
	    Connection conexion = Conexion.getConexion().getSQLConexion();

	    try {
	        statement = conexion.prepareStatement(getCuotasByPrestamo);
	        statement.setInt(1, idPrestamo);
	        ResultSet resultSet = statement.executeQuery();

	        while (resultSet.next()) { 
	            Cuota cuota = new Cuota();
       
	            cuota.setId(resultSet.getInt("id_cuota"));
	            cuota.setIdPrestamo(resultSet.getInt("id_prestamo"));
	            cuota.setNumeroCuota(resultSet.getInt("numero_cuota"));
	            cuota.setImporte(resultSet.getFloat("importe"));
	            cuota.setVencimento(resultSet.getDate("vencimiento").toLocalDate());
	            cuota.setEstado(resultSet.getInt("estado"));
          
	            cuotas.add(cuota);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return cuotas;
	}

	@Override
	public Pago getCuentaByCuota(int idCuota) {
		Pago pago = new Pago();
		
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		
		try {
			statement = conexion.prepareStatement(getCuentaByCuota);
	        statement.setInt(1, idCuota);
	        ResultSet resultSet = statement.executeQuery();
	        
	        while(resultSet.next()) {
	        	pago.setIdPrestamo(resultSet.getInt("id_prestamo"));
	        	pago.setIdCuenta(resultSet.getInt("id_cuenta"));
	        	pago.setIdCuota(resultSet.getInt("id_cuota"));
	        }
	        
		} catch (SQLException e) {
	        e.printStackTrace();
	    }
		
		return pago;
	}
	
	@Override
	public boolean generarPago(Pago pago) {

		Connection conexion = Conexion.getConexion().getSQLConexion();
		
		boolean exitoso = false;
		
		try {

		CallableStatement stmt = conexion.prepareCall(PAGAR_CUOTA); 
		stmt.setInt(1, pago.getIdPrestamo());
        stmt.setInt(2, pago.getIdCuota());
        stmt.setFloat(3, pago.getIdCuenta());
        stmt.execute();
        
        exitoso = true;
		}
		
        catch (SQLException e) {
            e.printStackTrace();
            try {
                conexion.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
		
		return exitoso;
		
	}
	
	
}
