package DatosImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;

import Datos.IClienteDao;



public class ClienteDao implements IClienteDao{
	
	private static ClienteDao instancia = null;
	
	private static final String insert = "INSERT INTO Cliente(nombre_usuario, dni, cuil, nombre, apellido, sexo, nacionalidad,nacimiento, domicilio, localidad, id_provincia, email, telefono, activo) VALUES(?, ?, ?,?, ?, ?,?,?, ?, ?,?, ?, ?,?)";
	
	public static ClienteDao ObtenerInstancia() {
		if(instancia == null) {
			instancia = new ClienteDao();
		}
		return instancia;
	}
	
	
	public boolean insert(String nombre_usuario, int dni, String cuil, String nombre, String apellido, int sexo,
			String nacionalidad, String nacimiento, String domicilio, String localidad, int id_provincia, String email,
			String telefono, boolean activo) 
	{
		
		PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        boolean isInsertExitoso = false;
        
        try 
        {
            statement = conexion.prepareStatement(insert);
            statement.setString(1, nombre_usuario);
            statement.setInt(2, dni);
            statement.setString(3, cuil);
            statement.setString(4, nombre);
            statement.setString(5, apellido);
            statement.setInt(6, sexo);
            statement.setString(7, nacionalidad);
            statement.setString(8, nacimiento);
            statement.setString(9, domicilio);
            statement.setString(10, localidad);
            statement.setInt(11, id_provincia);
            statement.setString(12, email);
            statement.setString(13, telefono);
            statement.setBoolean(14, activo);
            if(statement.executeUpdate() > 0)
			{
				conexion.commit();
				isInsertExitoso = true;
			}
        }
                
        catch (SQLException e) 
    		{
    			e.printStackTrace();
    			try 
    			{
    				conexion.rollback();
    			} 
    			catch (SQLException e1) 
    			{
    				e1.printStackTrace();
    			}
    		}
    		
    		return isInsertExitoso;	
}
}
