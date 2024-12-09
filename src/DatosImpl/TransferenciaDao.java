package DatosImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Datos.IMovimientoDao;
import Datos.ITransferenciaDao;
import Dominio.Cuenta;
import Dominio.Transferencia;

public class TransferenciaDao implements ITransferenciaDao {

	private static TransferenciaDao instancia = null;
	
	/*private static final String select_cuentaXCBU="SELECT id_cuenta, id_cliente, tipo, creacion,cbu, saldo, activa FROM cuenta WHERE cbu = ?";*/
	
	private static final String TRASNFERIR_FONDOS = "{CALL sp_transferir_fondos(?, ?, ?, ?)}";
	
	public static TransferenciaDao obtenerInstancia() {
        if (instancia == null) {
            instancia = new TransferenciaDao();
        }
        return instancia;
    }

	@Override
	public void generarTransferencia(Transferencia transferencia) {
		
        Connection conexion = Conexion.getConexion().getSQLConexion();
	
		
		try {

		CallableStatement stmt = conexion.prepareCall(TRASNFERIR_FONDOS); 
		stmt.setInt(1, transferencia.getId_cuenta_origen());
        stmt.setInt(2, transferencia.getId_cuenta_destino());
        stmt.setFloat(3, transferencia.getImporte_transferencia());
        stmt.setString(4, transferencia.getDetalle());

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
