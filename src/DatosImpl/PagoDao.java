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

	private static final String PAGAR_CUOTA = "{CALL PagarCuota(?, ?, ?)}";
	private static final String getCuotasByPrestamo = "SELECT c.* FROM cuota c inner join prestamo p on p.id_prestamo = c.id_prestamo where c.id_Prestamo = ?";
	public static PagoDao obtenerInstancia() {
        if (instancia == null) {
            instancia = new PagoDao();
        }
        return instancia;
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

		CallableStatement stmt = conexion.prepareCall(PAGAR_CUOTA); 
		stmt.setInt(1, pago.getIdPrestamo());
        stmt.setInt(2, pago.getIdCuota());
        stmt.setFloat(3, pago.getIdCuenta());
        stmt.execute();
        
		}
		
        catch (SQLException e) {
            e.printStackTrace();
            try {
                conexion.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
		
		
	}

	
	
}
