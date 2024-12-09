
package DatosImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Datos.ICuentaDao;
import Dominio.Cliente;
import Dominio.Cuenta;

public class CuentaDao implements ICuentaDao {
	
	private static CuentaDao instancia = null;

    private static final String INSERT = "INSERT INTO cuenta (id_cliente, tipo, creacion, cbu, saldo, activa) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String UPDATE = "UPDATE cuenta SET id_cliente = ?, tipo = ?, creacion = ?, cbu = ?, saldo = ?, activa = ? WHERE id_cuenta = ?";
    private static final String DELETE = "UPDATE cuenta SET activa = 0 WHERE id_cuenta = ?";
    private static final String SELECT_ALL = "SELECT id_cuenta, nombre, apellido, dni, creacion, tipo, cbu, saldo FROM cuenta c INNER JOIN cliente cl on cl.id_cliente = c.id_cliente WHERE activa = 1 ORDER BY creacion";
    private static final String SELECT_BY_ID = "SELECT * FROM cuenta WHERE id_cuenta = ?";
    private static final String traerUltimoIDMovimiento ="SELECT IFNULL(MAX(id_cuenta), 0) + 1 AS next_id FROM cuenta";
    private static final String SELECT_CUENTAS_BY_CLIENTE = "SELECT id_cuenta, c.activa, nombre, apellido, dni, creacion, tipo, cbu, saldo " + 
    														"FROM cuenta c INNER JOIN cliente cl on cl.id_cliente = c.id_cliente where c.id_cliente=?";
    private static final String UPDATE_SALDO = "UPDATE cuenta SET saldo = ? WHERE id_cuenta = ?";
    private CuentaDao() { }

    public static CuentaDao obtenerInstancia() {
        if (instancia == null) {
            instancia = new CuentaDao();
        }
        return instancia;
    }
    
    private String generarCbu() {
        Random r = new Random();
        String cbu = "";
        cbu += (char) (r.nextInt(9) + '1');
        for(int i = 1; i < 22; i++) {
            cbu += (char) (r.nextInt(10) + '0');
        }
        return cbu;
    }
    public ArrayList<Cuenta> listarCuentasxCliente(int idCliente) {
        PreparedStatement statement;
        ResultSet resultSet;
        ArrayList<Cuenta> cuentas = new ArrayList<>();
        Connection conexion = Conexion.getConexion().getSQLConexion();

        try {
            statement = conexion.prepareStatement(SELECT_CUENTAS_BY_CLIENTE);
            statement.setInt(1, idCliente);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
            	Cliente cliente = new Cliente();
                cliente.setNombre(resultSet.getString("nombre"));
                cliente.setApellido(resultSet.getString("apellido"));
                cliente.setDni(resultSet.getInt("dni"));
               cliente.setId(idCliente);
                Cuenta cuenta = new Cuenta();
                cuenta.setActiva(resultSet.getBoolean("activa"));
                cuenta.setIdCuenta(resultSet.getInt("id_cuenta"));
                cuenta.setCreacion(resultSet.getDate("creacion").toLocalDate());
                cuenta.setTipo(resultSet.getInt("tipo"));
                cuenta.setCbu(resultSet.getString("cbu"));
                cuenta.setSaldo(resultSet.getFloat("saldo"));
             
                
                cuenta.setCliente(cliente);
                cuentas.add(cuenta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cuentas;
    }
    
    @Override
    public boolean crearCuenta(Cuenta cuenta) {
        PreparedStatement statement = null;
        Connection conexion = null;
        boolean isInsertExitoso = false;
        String cbu = generarCbu();
        
        try {
            conexion = Conexion.getConexion().getSQLConexion();
            statement = conexion.prepareStatement(INSERT);
            statement.setInt(1, cuenta.getIdCliente());
            statement.setInt(2, cuenta.getTipo());
            statement.setDate(3, java.sql.Date.valueOf(cuenta.getCreacion()));
            statement.setString(4, cbu);
            statement.setFloat(5, cuenta.getSaldo());
            statement.setBoolean(6, cuenta.isActiva());
            	
            int rows = statement.executeUpdate();
            if (rows > 0) {
                conexion.commit();
                isInsertExitoso = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (conexion != null) {
                    conexion.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return isInsertExitoso;
    }

    @Override
    public boolean actualizarCuenta(Cuenta cuenta) {
        PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        boolean isUpdateExitoso = false;

        try {
            statement = conexion.prepareStatement(UPDATE);
            statement.setInt(1, cuenta.getIdCliente());
            statement.setInt(2, cuenta.getTipo());
            statement.setDate(3, java.sql.Date.valueOf(cuenta.getCreacion()));
            statement.setString(4, cuenta.getCbu());
            statement.setFloat(5, cuenta.getSaldo());
            statement.setBoolean(6, cuenta.isActiva());
            statement.setInt(7, cuenta.getIdCuenta());

            if (statement.executeUpdate() > 0) {
                conexion.commit();
                isUpdateExitoso = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conexion.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }

        return isUpdateExitoso;
    }

    @Override
    public boolean actualizarSaldo(Cuenta cuenta) {
        PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        boolean isUpdateExitoso = false;

        try {
            statement = conexion.prepareStatement(UPDATE_SALDO);
            statement.setFloat(1, cuenta.getSaldo());


            if (statement.executeUpdate() > 0) {
                conexion.commit();
                isUpdateExitoso = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conexion.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }

        return isUpdateExitoso;
    }

    @Override
    public boolean eliminarCuenta(int idCuenta) {
        PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        boolean isDeleteExitoso = false;

        try {
            statement = conexion.prepareStatement(DELETE);
            statement.setInt(1, idCuenta);

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
    public List<Cuenta> listarCuentas() {
        PreparedStatement statement;
        ResultSet resultSet;
        ArrayList<Cuenta> cuentas = new ArrayList<>();
        Connection conexion = Conexion.getConexion().getSQLConexion();

        try {
            statement = conexion.prepareStatement(SELECT_ALL);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
            	Cliente cliente = new Cliente();
                cliente.setNombre(resultSet.getString("nombre"));
                cliente.setApellido(resultSet.getString("apellido"));
                cliente.setDni(resultSet.getInt("dni"));

                Cuenta cuenta = new Cuenta();
                
                cuenta.setIdCuenta(resultSet.getInt("id_cuenta"));
                cuenta.setCreacion(resultSet.getDate("creacion").toLocalDate());
                cuenta.setTipo(resultSet.getInt("tipo"));
                cuenta.setCbu(resultSet.getString("cbu"));
                cuenta.setSaldo(resultSet.getFloat("saldo"));
                
                cuenta.setCliente(cliente);
                cuentas.add(cuenta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cuentas;
    }
    
    @Override
    public Cuenta obtenerCuentaPorId(int idCuenta) {
        Cuenta cuenta = null;
        try (Connection conexion = Conexion.getConexion().getSQLConexion();
             PreparedStatement statement = conexion.prepareStatement(SELECT_BY_ID)) {
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
    
    @Override
	public int obtenerUltimoIDCuenta() {
		  PreparedStatement statement;
		    ResultSet resultSet;
		    
		    Connection conexion = Conexion.getConexion().getSQLConexion();
		    int ultimoIDMovimiento = -1;
		    
		    try {
		        statement = conexion.prepareStatement(traerUltimoIDMovimiento);
		        resultSet = statement.executeQuery();
		        
		        if (resultSet.next()) {
		            ultimoIDMovimiento = resultSet.getInt("next_id");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    
		    return ultimoIDMovimiento;

}
}
