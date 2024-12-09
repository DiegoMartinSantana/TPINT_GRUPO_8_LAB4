package DatosImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import Datos.IPagoDao;
import Dominio.Pago;

public class PagoDao implements IPagoDao {
	
	private static PagoDao instancia = null;;

	private static final String PAGAR_CUOTA = "{CALL PagarCuota(?, ?, ?)}";
	
	public static PagoDao obtenerInstancia() {
        if (instancia == null) {
            instancia = new PagoDao();
        }
        return instancia;
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
