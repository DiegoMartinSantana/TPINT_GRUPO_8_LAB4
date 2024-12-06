
package DatosImpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Datos.IPrestamoDao;
import Dominio.DatosPrestamosSolicitadosSP;
import Dominio.PrestamoSolicitado;
import Dominio.Dto.PrestamoDto;

public class PrestamoDao implements IPrestamoDao {
	private static final String selectById ="SELECT" + 
			"            p.id_prestamo, " + 
			" 			m.id_movimiento, "+
			"           c.id_cuenta, " +
			"            c.cbu AS cbu_cuenta, " + 
			"            cl.cuil, " + 
			"            cl.nombre, "  + 
			"			 cl.apellido, " +
			"            p.importe_pagar, " + 
			"            p.importe_solicitado, " + 
			"            p.monto_cuota, " + 
			"            p.interes, " + 
			"            p.plazo_cuotas, " + 
			"            p.fecha, " + 
			"            p.estado from prestamo p " +
			"            INNER JOIN movimiento m ON p.id_movimiento = m.id_movimiento " + 
			"            INNER JOIN cuenta c ON m.id_cuenta = c.id_cuenta " + 
			"            INNER JOIN cliente cl ON c.id_cliente = cl.id_cliente " + 
			"		     WHERE p.id_prestamo = ?;";
	
	
	private static final String Rechazar = "UPDATE prestamo_solicitado SET estado = 2 WHERE id_prestamo_solicitado = ?";
	
	private static final String selectAll = "SELECT p.importe_pagar, p.importe_solicitado,"
			+ "			p.monto_cuota, p.interes, p.plazo_cuotas,p.id_prestamo_solicitado, p.fecha, p.estado, cl.nombre,p.id_cuenta, "
			+ "			cl.apellido, cl.nombre_usuario, c.cbu AS cbu_cuenta ,cl.cuil FROM prestamo_solicitado p"
			+ "			INNER JOIN CUENTA c ON c.id_cuenta = p.id_cuenta"
			+ "			INNER JOIN CLIENTE cl ON cl.id_cliente = c.id_cliente";
	
	private static final String update = "UPDATE PRESTAMO SET ESTADO = ? WHERE id_prestamo = ?";
	
	
	private static final String insertPrestamosSolicitado = 
	        "INSERT INTO prestamo_solicitado (" +
	        "id_cuenta, monto_cuota, interes, importe_solicitado, fecha, importe_pagar, plazo_cuotas" +
	        ") VALUES (?, ?, ?, ?, ?, ?, ?)";
	
	private static final String aceptarPrestamoSP = "{CALL aceptar_prestamo(?, ?, ?, ?, ?, ?)}";
	
	

	public PrestamoDto obtenerPrestamoPorId(int idPrestamo) {
	    PreparedStatement statement;
	    Connection conexion = Conexion.getConexion().getSQLConexion();
	    PrestamoDto prestamoDto = null;


	    try {
	        statement = conexion.prepareStatement(selectById);
	        statement.setInt(1, idPrestamo); 

	        ResultSet resultSet = statement.executeQuery();

	        if (resultSet.next()) {
	            prestamoDto = new PrestamoDto();
	            prestamoDto.idPrestamo = resultSet.getInt("id_prestamo");
	            prestamoDto.cbu = resultSet.getString("cbu_cuenta");
	            prestamoDto.cuil = resultSet.getString("cuil");
	            prestamoDto.importePagar = resultSet.getFloat("importe_pagar");
	            prestamoDto.importeSolicitado = resultSet.getFloat("importe_solicitado");
	            prestamoDto.montoCuota = resultSet.getFloat("monto_cuota");
	            prestamoDto.interes = resultSet.getFloat("interes");
	            prestamoDto.plazoCuotas = resultSet.getInt("plazo_cuotas");
	            prestamoDto.fechaPrestamo = resultSet.getDate("fecha").toLocalDate();
	            prestamoDto.estado = resultSet.getInt("estado");
	            prestamoDto.idCuenta = resultSet.getInt("id_cuenta");
	            
	            String nombre = resultSet.getString("nombre");
	            String apellido = resultSet.getString("apellido");
	            prestamoDto.nombre = nombre + " " + apellido;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return prestamoDto;
	}
public ArrayList<PrestamoDto> listarPrestamos(){
    PreparedStatement statement;
    Connection conexion = Conexion.getConexion().getSQLConexion();
    ArrayList<PrestamoDto> prestamos=new ArrayList<PrestamoDto>();
    try {
        statement = conexion.prepareStatement(selectAll);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
        	
        	PrestamoDto prestamoDto = new PrestamoDto();
        	prestamoDto.idPrestamo=resultSet.getInt("id_prestamo_solicitado");
        	prestamoDto.cbu=(resultSet.getString("cbu_cuenta"));
        	prestamoDto.cuil=(resultSet.getString("cuil"));
        	prestamoDto.importePagar = resultSet.getFloat("importe_pagar");
            prestamoDto.importeSolicitado = resultSet.getFloat("importe_solicitado");
            prestamoDto.montoCuota = resultSet.getFloat("monto_cuota");
            prestamoDto.interes = resultSet.getFloat("interes");
            prestamoDto.plazoCuotas = resultSet.getInt("plazo_cuotas");
            prestamoDto.fechaPrestamo = resultSet.getDate("fecha").toLocalDate();
            prestamoDto.estado = resultSet.getInt("estado");
            String nombre = resultSet.getString("nombre");
            String apellido  = resultSet.getString("apellido");
            prestamoDto.nombre = nombre + " " + apellido;
            prestamoDto.idCuenta=resultSet.getInt("id_cuenta");

            
        	prestamos.add(prestamoDto);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return prestamos;
}
	@Override
public int  SetEstado(int idPrestamo, int set) {

	PreparedStatement statement;
	Connection conexion = Conexion.getConexion().getSQLConexion();
	int filas = 0;
	try {
	    statement = conexion.prepareStatement(update);
	   
	    statement.setInt(1,set);
	    statement.setInt(2,idPrestamo);
	   
	    filas = statement.executeUpdate();
	    if (filas > 0) {
	        conexion.commit();
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	    try {
	        conexion.rollback();
	    } catch (SQLException e1) {
	        e1.printStackTrace();
	    }
	}
	return filas;
}
	@Override
	public boolean rechazarPrestamo(int idPrestamoSolicitado) {
		
		
		PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        boolean isDeleteExitoso = false;

        try {
            statement = conexion.prepareStatement(Rechazar);
            statement.setInt(1, idPrestamoSolicitado);

            if (statement.executeUpdate() > 0) {
                conexion.commit();
                isDeleteExitoso = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conexion.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }

        return isDeleteExitoso;
	}
	@Override
	public boolean crearPrestamoSolicitado(PrestamoSolicitado prestamoSolicitado) {
		PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        boolean isInsertExitoso = false;
 
        try {
            statement = conexion.prepareStatement(insertPrestamosSolicitado);
            statement.setInt(1, prestamoSolicitado.getIdCuenta());
            statement.setFloat(2, prestamoSolicitado.getMontoCuota());
            statement.setFloat(3, prestamoSolicitado.getInteres());
            statement.setFloat(4, prestamoSolicitado.getImporteSolicitado());
            statement.setDate(5, java.sql.Date.valueOf(prestamoSolicitado.getFechaPrestamo()));
            statement.setFloat(6, prestamoSolicitado.getImportePagar());
            statement.setInt(7, prestamoSolicitado.getPlazoCuotas());
            	
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
	public void aceptarPrestamo(DatosPrestamosSolicitadosSP PrestamoSP) {
				 Connection conexion = Conexion.getConexion().getSQLConexion();
	             
	             try {
	            // Establecer los parámetros del procedimiento
	            CallableStatement stmt = conexion.prepareCall(aceptarPrestamoSP); 
	            stmt.setInt(1, PrestamoSP.getIdPrestamoSolicitado());
	            stmt.setFloat(2, PrestamoSP.getMontoSolicitado());
	            stmt.setInt(3, PrestamoSP.getIDCuenta());
	            stmt.setInt(4, PrestamoSP.getIDMovimiento());
	            stmt.setDate(5, java.sql.Date.valueOf(PrestamoSP.getFecha())); 
	            stmt.setString(6, PrestamoSP.getDetallePrestamoSolicitado());

	            // Ejecutar el procedimiento
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

	


