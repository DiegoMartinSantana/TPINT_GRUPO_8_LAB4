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
	
	/*@Override
	public Cuenta obtenerCuentaPorCBU2(String cbu) {
	    Cuenta cuenta = null;
	    PreparedStatement statement = null;
	    ResultSet resultSet = null;

	    try {
	        Connection conexion = Conexion.getConexion().getSQLConexion();
	        statement = conexion.prepareStatement(select_cuentaXCBU);
	        statement.setString(1, cbu);
	        resultSet = statement.executeQuery();

	        if (resultSet.next()) {
	            cuenta = new Cuenta(
	                resultSet.getInt("id_cuenta"),
	                resultSet.getInt("id_cliente"),
	                resultSet.getInt("tipo"),
	                resultSet.getDate("creacion").toLocalDate(),
	                resultSet.getString("cbu"),
	                resultSet.getFloat("saldo"),
	                resultSet.getBoolean("activa")
	            );
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (resultSet != null) resultSet.close();
	            if (statement != null) statement.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return cuenta;
	}*/




}
