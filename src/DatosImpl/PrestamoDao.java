package DatosImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Dominio.Prestamo;

public class PrestamoDao {
	
	
	private static final String selectAll="SELECT * FROM prestamo";
	


	/*
public int updatePrestamo(Prestamo prestamo) {
	
	PreparedStatement statement;
    Connection conexion = Conexion.getConexion().getSQLConexion();
    int filas = 0;
    try {
        statement = conexion.prepareStatement(update);
        statement.setString(1, String.valueOf(prestamo.getAutorizado()));
        statement.setInt(2, prestamo.getIdPrestamo());
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
*/
public ArrayList<Prestamo> listarPrestamos(){
    PreparedStatement statement;
    Connection conexion = Conexion.getConexion().getSQLConexion();
    ArrayList<Prestamo> prestamos=new ArrayList<Prestamo>();
    try {
    	System.out.println("listar");
        statement = conexion.prepareStatement(selectAll);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
        	Prestamo prestamo= new Prestamo();
        	prestamo.setIdPrestamo(resultSet.getInt("id_prestamo"));
        	prestamo.setIdMovimiento(resultSet.getInt("id_movimiento"));
        	prestamo.setMontoCuota(resultSet.getFloat("monto_Cuota"));
        	prestamo.setFechaPrestamo(resultSet.getDate("fecha").toLocalDate());
        	prestamo.setImportePagar(resultSet.getFloat("importe_pagar"));
        	prestamo.setImporteSolicitado(resultSet.getFloat("importe_solicitado"));
        	prestamo.setPlazoCuotas(resultSet.getInt("plazo_coutas"));
        	prestamo.setInteres(resultSet.getFloat("interes"));
        	prestamo.setEstado(resultSet.getInt("estado"));
        	prestamos.add(prestamo);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return prestamos;
}
/*
public int agregarPrestamo(Prestamo prestamo) {
	
	PreparedStatement statement;
    Connection conexion = Conexion.getConexion().getSQLConexion();
    int filas = 0;
    try {
        statement = conexion.prepareStatement(insert);
        statement.setInt(1, prestamo.getIdcliente());
        statement.setInt(2, prestamo.getIdcuenta());
        statement.setDate(3, java.sql.Date.valueOf(prestamo.getFechaPrestamo()));
        statement.setBigDecimal(4, prestamo.getImporteAPagar());
        statement.setBigDecimal(5, prestamo.getImporteSolicitado());
        statement.setInt(6, prestamo.getPlazoEnCuotas());
        statement.setBigDecimal(7, prestamo.getMontoPorCuota());
        statement.setString(8, String.valueOf(prestamo.getAutorizado()));
       
        
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
*/
}