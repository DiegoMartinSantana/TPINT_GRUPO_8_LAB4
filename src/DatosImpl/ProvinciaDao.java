package DatosImpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import Datos.IProvinciaDao;

import Dominio.Provincia;
public class ProvinciaDao implements IProvinciaDao {
	
	 private static final String getAll= "SELECT * FROM provincia";
	 
	@Override
	public ArrayList<Provincia> getAll() {
		
		PreparedStatement statement;
        ResultSet resultSet;
        ArrayList<Provincia> provincias = new ArrayList<Provincia>();
        Connection conexion = Conexion.getConexion().getSQLConexion();

        try {
            statement = conexion.prepareStatement(getAll);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Provincia prov = new Provincia(1,"");
                prov.setID(resultSet.getInt("id_provincia"));
                prov.setNombre(resultSet.getString("nombre"));
                provincias.add(prov);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return provincias;
		
	
	}

	
	
}
