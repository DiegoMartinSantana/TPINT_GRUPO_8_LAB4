package DatosImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Datos.IUsuarioDao;
import Dominio.Cuenta;
import Dominio.TipoUsuario;
import Dominio.Usuario;

public class UsuarioDao implements IUsuarioDao {
	
	private static UsuarioDao instancia = null;
	
	
	private static final String insertar = "insert into usuario(nombre_usuario,tipo,pass) values (?,?,?)";
	private static final String leer ="select nombre_usuario,tipo,activo from usuario where nombre_usuario = ?";
	private static final String login ="select nombre_usuario, tipo, activo from usuario where nombre_usuario = ? and pass = ?";
	private static final String actualizarActivo ="update usuario set activo = ? where nombre_usuario = ?";
	private static final String actualizar ="update usuario set pass = ? where nombre_usuario = ?";
	private static final String remover = "delete from usuario where nombre_usuario = ?";
	private static final String buscarUsuario ="select *from usuario where nombre_usuario= ?";
	
	
	public static UsuarioDao ObtenerInstancia() {
		if(instancia == null) {
			instancia = new UsuarioDao();
		}
		return instancia;
	}

	@Override
	public Usuario Loguear(String nombre_usuario, String pass) {
        PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        
        if (conexion == null) {
            throw new IllegalStateException("No se pudo obtener la conexión a la base de datos.");
        }
        
        Usuario usuario = null;

        try {
            statement = conexion.prepareStatement(login);
            statement.setString(1, nombre_usuario);
            statement.setString(2, pass);
            ResultSet rs = statement.executeQuery();
            TipoUsuario tipo = null;
      
            if (rs.next()) {
                String nombre = rs.getString("nombre_usuario");
                
                int tipoCodigo = rs.getInt("tipo"); 

                switch (tipoCodigo) {
                    case 1:
                        tipo = TipoUsuario.ADMINISTRADOR; 
                        break;
                    case 2:
                        tipo = TipoUsuario.CLIENTE;
                   
                }

                boolean activo = rs.getBoolean("activo");
                usuario = new Usuario(nombre, tipo, activo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
       
        return usuario;
    }


	@Override
	public boolean Insertar(String nombre_usuario, int tipo, String pass) {
		PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        boolean isInsertExitoso = false;
        try 
        {
        	statement = conexion.prepareStatement(insertar);
            statement.setString(1, nombre_usuario);
            statement.setInt(2, tipo);
            statement.setString(3, pass);
            
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
	public String Leer(String nombre_usuario) {
		return "";
	}

	@Override
	public boolean ActualizarActivo(String nombre_usuario, int activo) {
		return false;
	}

	@Override
	public boolean Actualizar(String nombre_usuario, String pass) {
		return true;
	}

	@Override
	public boolean Remover(String nombre_usuario) {
		return true;
	}

	@Override
	public boolean BuscarUsuario(String nombre) {
		
        
        boolean isInsertExitoso = false;
        
        try (Connection conexion = Conexion.getConexion().getSQLConexion();
               PreparedStatement statement = conexion.prepareStatement(buscarUsuario)) {
               statement.setString(1, nombre);
               ResultSet resultSet = statement.executeQuery();

               if (resultSet.next()) {
            	   isInsertExitoso = true;
               }
           } catch (SQLException e) {
               e.printStackTrace();
           }
        
		
		return isInsertExitoso;	
	}

}