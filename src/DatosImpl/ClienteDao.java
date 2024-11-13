package DatosImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Datos.IClienteDao;
import Dominio.Cliente;



public class ClienteDao implements IClienteDao{
	
	private static ClienteDao instancia = null;
	
	private static final String insert = "insert into cliente(nombre_usuario, dni, cuil, nombre, apellido, sexo, nacionalidad, nacimiento ,domicilio, localidad, id_provincia, email, telefono) VALUES(?, ?, ?,?, ?, ?,?,?, ?, ?,?, ?, ?)";	private static final String select = "SELECT * FROM Cliente WHERE Activo = 1";
	
	public ClienteDao() {}
	
	public static ClienteDao ObtenerInstancia() {
		if(instancia == null) {
			instancia = new ClienteDao();
		}
		return instancia;
	}

	@Override
	public boolean insert(String nombre_usuario, int dni, String cuil, String nombre, String apellido, int sexo,
			String nacionalidad, String nacimiento, String domicilio, String localidad, int id_provincia, String email,
			String telefono) 
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

	@Override
	public List<Cliente> listar() {
		PreparedStatement statement;
        ResultSet resultSet;
        ArrayList<Cliente> clientes = new ArrayList<>();
        
        Connection conexion = Conexion.getConexion().getSQLConexion();
        
        try {
            statement = conexion.prepareStatement(select);
            resultSet = statement.executeQuery();
            
            while(resultSet.next()) {
                Cliente cliente = new Cliente();
                cliente.setNombreUsuario(resultSet.getString("nombre_usuario"));
                cliente.setDni(resultSet.getInt("dni"));
                cliente.setCuil(resultSet.getString("cuil"));
                cliente.setNacionalidad(resultSet.getString("nacionalidad"));
                cliente.setNombre(resultSet.getString("nombre"));
                cliente.setApellido(resultSet.getString("apellido"));
                cliente.setSexo(resultSet.getInt("sexo"));
                cliente.setNacionalidad(resultSet.getString("nacionalidad"));
                cliente.setDomicilio(resultSet.getString("domicilio"));
                cliente.setLocalidad(resultSet.getString("localidad"));
                cliente.setEmail(resultSet.getString("email"));
                cliente.setTelefono(resultSet.getString("telefono"));
                cliente.setActivo(resultSet.getBoolean("activo"));
                
                clientes.add(cliente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return clientes;
	}
}
