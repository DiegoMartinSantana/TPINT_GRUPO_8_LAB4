
package DatosImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Datos.IPrestamoDao;
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
	
	
	
	
	private static final String selectAll = "SELECT p.importe_pagar, p.importe_solicitado,"
			+ " p.monto_cuota, p.interes, p.plazo_cuotas,p.id_prestamo, p.fecha, p.estado, cl.nombre, "
			+ "cl.apellido, cl.nombre_usuario, c.cbu AS cbu_cuenta ,cl.cuil FROM PRESTAMO p"
			+ " INNER JOIN MOVIMIENTO m ON p.id_movimiento = m.id_movimiento INNER JOIN CUENTA c"
			+ " ON c.id_cuenta = m.id_cuenta INNER JOIN CLIENTE cl ON cl.id_cliente = c.id_cliente "
			+ "ORDER BY p.fecha";
	private static final String update = "UPDATE PRESTAMO SET ESTADO = ? WHERE id_prestamo = ?";

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
	            prestamoDto.idMovimiento = resultSet.getInt("id_movimiento");
	            
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
        	prestamoDto.idPrestamo=resultSet.getInt("id_prestamo");
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
}