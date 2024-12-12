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
	public void generarPago(Pago pago) {
	    Connection conexion = Conexion.getConexion().getSQLConexion();

	    try {
            conexion.setAutoCommit(false);
	        CallableStatement stmt = conexion.prepareCall(PAGAR_CUOTA); 
	        stmt.setInt(1, pago.getIdPrestamo());
	        stmt.setInt(2, pago.getIdCuota());
	        stmt.setInt(3, pago.getIdCuenta()); // Verifica el tipo correcto
	        stmt.execute();
	        conexion.commit(); // Asegúrate de confirmar la transacción si es necesario
	    } catch (SQLException e) {
	        System.err.println("Error al ejecutar el procedimiento almacenado: " + e.getMessage());
	        try {
	            conexion.rollback();
	        } catch (SQLException e1) {
	            System.err.println("Error al realizar el rollback: " + e1.getMessage());
	        }
	    }
	}
	
	
}
