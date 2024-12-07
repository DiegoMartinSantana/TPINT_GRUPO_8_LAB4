package DatosImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Datos.IMovimientoDao;
import Datos.ITransferenciaDao;
import Dominio.Cuenta;

public class TransferenciaDao implements ITransferenciaDao {

	private static TransferenciaDao instancia = null;
	
	private static final String select_cuentaXCBU="SELECT id_cuenta, id_cliente, tipo, creacion,cbu, saldo, activa FROM cuenta WHERE cbu = ?";
	
	public static TransferenciaDao obtenerInstancia() {
        if (instancia == null) {
            instancia = new TransferenciaDao();
        }
        return instancia;
    }
	
	@Override
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
	}




}
