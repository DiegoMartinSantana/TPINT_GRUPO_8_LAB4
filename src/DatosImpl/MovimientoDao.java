package DatosImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import Datos.IMovimientoDao;
import Dominio.Cuenta;
import Dominio.Movimiento;

public class MovimientoDao implements IMovimientoDao {
	
	
	private static MovimientoDao instancia = null;
	private static final String insertarMovimiento = "INSERT INTO movimiento(id_cuenta,id_tipo_movimiento, fecha, detalle, importe,id_destino) VALUES (?,?,?,?,?,?)";
	private static final String SELECT_CUENTA = "SELECT c." + 
    		"FROM cuenta " + 
    		"INNER JOIN movimiento m" + 
    		"ON c.id_cuenta = m.id_cuenta where c.id_cuenta = ?";
	
	public static MovimientoDao obtenerInstancia() {
        if (instancia == null) {
            instancia = new MovimientoDao();
        }
        return instancia;
    }

	  
    @Override
    public Cuenta obtenerCuentaPorId(int idCuenta) {
        Cuenta cuenta = null;
        try (Connection conexion = Conexion.getConexion().getSQLConexion();
             PreparedStatement statement = conexion.prepareStatement(SELECT_CUENTA)) {
            statement.setInt(1, idCuenta);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                cuenta = new Cuenta(
                    resultSet.getInt("id_cuenta"),
                    resultSet.getInt("id_cliente"),
                    resultSet.getInt("tipo"),
                    resultSet.getString("creacion"),
                    resultSet.getString("cbu"),
                    resultSet.getFloat("saldo"),
                    resultSet.getBoolean("activa")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cuenta;
    }
    
	@Override
	public boolean crearMovimiento(Movimiento movimiento) {
		PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        boolean isInsertExitoso = false;
        
        try {
        	
        	statement = conexion.prepareStatement(insertarMovimiento);
	        statement.setInt(1, movimiento.getId_cuenta());
	        statement.setInt(2, movimiento.getTipo());
	        statement.setString(3,movimiento.getFecha());
	        statement.setString(4, movimiento.getDetalle());
	        statement.setFloat(5, movimiento.getImporte());
	        statement.setInt(6, movimiento.getId_destino());
            	
            int rows = statement.executeUpdate();
            if (rows >0) {
                conexion.commit();
                isInsertExitoso = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conexion.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }

        return isInsertExitoso;
	}

	@Override
	public List<Movimiento> listarMovimiento() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	@Override
	public Movimiento obtenerMovimientoPorId(int idMovimiento) {
		// TODO Auto-generated method stub
		return null;
	}

	
    
	
	
	
	
	
}
