package DatosImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Datos.IMovimientoDao;
import Dominio.Cuenta;
import Dominio.Movimiento;

public class MovimientoDao implements IMovimientoDao {
	
	
	
	private static MovimientoDao instancia = null;
	private static final String obtenerTransferenciaByCuenta ="SELECT " +
            "id_movimiento, " +
            "id_cuenta, " +
            "id_tipo_movimiento, " +
            "importe, " +
            "detalle, " +
            "id_destino, " +
            "fecha " +
            "FROM " +
            "movimiento " +
            "WHERE " +
            "id_cuenta = ? " +
            "ORDER BY " +
            "fecha , id_movimiento " ;
          

	private static final String insertarMovimiento = "INSERT INTO movimiento(id_cuenta,id_tipo_movimiento, fecha, detalle, importe,id_destino) VALUES (?,?,?,?,?,?)";
	
	private static final String SELECT_CUENTA = "SELECT c." + 
    		"FROM cuenta " + 
    		"INNER JOIN movimiento m" + 
    		"ON c.id_cuenta = m.id_cuenta where c.id_cuenta = ?";
	
	private static final String select_cuentaXCBU="SELECT id_cuenta, id_cliente, tipo, creacion,cbu, saldo, activa FROM cuenta WHERE cbu = ?";
	
	public static MovimientoDao obtenerInstancia() {
        if (instancia == null) {
            instancia = new MovimientoDao();
        }
        return instancia;
    }

	  
	public ArrayList<Movimiento> obtenerUltimasTransferencias(int idCuenta) {
	    PreparedStatement statement;
	    ResultSet resultSet;
	    Connection conexion = Conexion.getConexion().getSQLConexion();
	    ArrayList<Movimiento> transferencias = new ArrayList<>();

	    
	    try {
	        statement = conexion.prepareStatement(obtenerTransferenciaByCuenta);
	        statement.setInt(1, idCuenta);
	        resultSet = statement.executeQuery();
	        	
	        while (resultSet.next()) {
	            Movimiento movimiento = new Movimiento();
	            movimiento.setId(resultSet.getInt("id_movimiento"));
	            movimiento.setId_cuenta(resultSet.getInt("id_cuenta"));
	            movimiento.setTipo(resultSet.getInt("id_tipo_movimiento"));
	            movimiento.setImporte(resultSet.getFloat("importe"));
	            movimiento.setDetalle(resultSet.getString("detalle"));
	            movimiento.setId_destino(resultSet.getInt("id_destino"));
	            movimiento.setFecha(resultSet.getDate("fecha").toLocalDate());
	            transferencias.add(movimiento);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return transferencias;
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
                    resultSet.getDate("creacion").toLocalDate(),
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
    
  
    public Cuenta obtenerCuentaPorCBU(String cbu) {
        Cuenta cuenta = null;
        try (Connection conexion = Conexion.getConexion().getSQLConexion();
             PreparedStatement statement = conexion.prepareStatement(select_cuentaXCBU)) {
            statement.setString(1, cbu);
            ResultSet resultSet = statement.executeQuery();

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
        }
        
        return cuenta;
    }
   
    
	@Override
	public boolean crearMovimiento(Movimiento movimiento) {
	    boolean isInsertExitoso = false;

	    try (Connection conexion = Conexion.getConexion().getSQLConexion();
	         PreparedStatement statement = conexion.prepareStatement(insertarMovimiento)) {

	        statement.setInt(1, movimiento.getId_cuenta());
	        statement.setInt(2, movimiento.getTipo());
	        statement.setDate(3, java.sql.Date.valueOf(movimiento.getFecha()));
	        statement.setString(4, movimiento.getDetalle());
	        statement.setFloat(5, movimiento.getImporte());
	        statement.setInt(6, movimiento.getId_destino());

	        int rows = statement.executeUpdate();
	        if (rows > 0) {
	            conexion.commit();
	            isInsertExitoso = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
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

	public boolean crearMovimiento2(Movimiento movimiento) {
	    PreparedStatement statement = null;
	    Connection conexion = null;
	    boolean isInsertExitoso = false;

	    try {
	        conexion = Conexion.getConexion().getSQLConexion();
	        if (conexion == null) {
	            throw new SQLException("La conexión a la base de datos es nula.");
	        }

	        // Desactivar autocommit para manejar la transacción manualmente
	        conexion.setAutoCommit(false);

	        statement = conexion.prepareStatement(insertarMovimiento);
	        statement.setInt(1, movimiento.getId_cuenta());
	        statement.setInt(2, movimiento.getTipo());
	        statement.setDate(3, java.sql.Date.valueOf(movimiento.getFecha()));
	        statement.setString(4, movimiento.getDetalle());
	        statement.setFloat(5, movimiento.getImporte());
	        statement.setInt(6, movimiento.getId_destino());

	        int rows = statement.executeUpdate();
	        if (rows > 0) {
	            conexion.commit();  // Confirmar la transacción
	            isInsertExitoso = true;
	        } else {
	            conexion.rollback();  // Revertir la transacción si no hay filas afectadas
	        }
	    } catch (SQLException e) {
	        System.err.println("Error al insertar el movimiento: " + e.getMessage());
	        e.printStackTrace();
	        try {
	            if (conexion != null) {
	                conexion.rollback();  // Revertir en caso de error
	            }
	        } catch (SQLException e1) {
	            e1.printStackTrace();
	        }
	    } finally {
	        try {
	            if (statement != null) {
	                statement.close();  // Cerrar el PreparedStatement
	            }
	            if (conexion != null) {
	                conexion.setAutoCommit(true);  // Restaurar autocommit
	                conexion.close();  // Cerrar la conexión
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return isInsertExitoso;
	}
    
	
	
	
	
	
}