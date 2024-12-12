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
	
	private static final String select_IDcuentaXCBU="SELECT id_cuenta FROM cuenta WHERE cbu = ?";
	
	private static final String TRASNFERIR_FONDOS = "{CALL sp_transferir_fondos(?, ?, ?, ?)}";
	
	public static TransferenciaDao obtenerInstancia() {
        if (instancia == null) {
            instancia = new TransferenciaDao();
        }
        return instancia;
    }

	@Override
	public void generarTransferencia(Transferencia transferencia) throws SQLException {
	    Connection conexion = Conexion.getConexion().getSQLConexion();
	    CallableStatement stmt = null;
	    try {
	        stmt = conexion.prepareCall(TRASNFERIR_FONDOS);
	        stmt.setInt(1, transferencia.getId_cuenta_origen());
	        stmt.setInt(2, transferencia.getId_cuenta_destino());
	        stmt.setFloat(3, transferencia.getImporte_transferencia());
	        stmt.setString(4, transferencia.getDetalle());

	        stmt.execute();
	    } catch (SQLException e) {
	        // Verificar si el error es por saldo insuficiente
	        if (e.getMessage().contains("Saldo insuficiente")) {
	            System.out.println("Error: " + e.getMessage());
	            throw new SQLException("Saldo insuficiente para realizar la transferencia.");
	        } else {
	            e.printStackTrace();
	            try {
	                conexion.rollback();
	            } catch (SQLException e1) {
	                e1.printStackTrace();
	            }
	            throw e;
	        }
	    } finally {
	        if (stmt != null) {
	            try {
	                stmt.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        // No cerrar la conexión aquí
	    }
	}
	
	
	


	public int obtenerIDCuentaPorCBU(String cbu) {
	    PreparedStatement statement = null;
	    ResultSet resultSet = null;
	    Connection conexion = Conexion.getConexion().getSQLConexion();
	    
	    int id_cuenta = 0;

	    try {
	        // Preparar la consulta con el valor del CBU
	        statement = conexion.prepareStatement(select_IDcuentaXCBU);
	        
	        // Establecer el valor del parámetro 'cbu' (en el primer ?)
	        statement.setString(1, cbu);
	        
	        // Ejecutar la consulta
	        resultSet = statement.executeQuery();
	        
	        if (resultSet.next()) {
	            id_cuenta = resultSet.getInt("id_cuenta");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // Cerrar recursos (statement y resultSet) para evitar fugas de memoria
	        try {
	            if (resultSet != null) {
	                resultSet.close();
	            }
	            if (statement != null) {
	                statement.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return id_cuenta;
	}





}
