package DatosImpl;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Datos.ICuentaDao;
import Dominio.Cliente;
import Dominio.Cuenta;

public class CuentaDao implements ICuentaDao {
	
	private static CuentaDao instancia = null;

    private static final String INSERT = "INSERT INTO cuenta(id_cliente, tipo, creacion, cbu, saldo, activa) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String UPDATE = "UPDATE cuenta SET id_cliente = ?, tipo = ?, creacion = ?, cbu = ?, saldo = ?, activa = ? WHERE id_cuenta = ?";
    private static final String DELETE = "DELETE FROM cuenta WHERE id_cuenta = ?";
    private static final String SELECT_ALL = "SELECT nombre, apellido, dni, creacion, tipo, cbu, saldo FROM cuenta c INNER JOIN cliente cl on cl.id_cliente = c.id_cliente";
    private static final String SELECT_BY_ID = "SELECT * FROM cuenta WHERE id_cuenta = ?";

    private CuentaDao() { }

    public static CuentaDao obtenerInstancia() {
        if (instancia == null) {
            instancia = new CuentaDao();
        }
        return instancia;
    }

    @Override
    public boolean crearCuenta(Cuenta cuenta) {
        PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        boolean isInsertExitoso = false;

        try {
            statement = conexion.prepareStatement(INSERT);
            statement.setInt(1, cuenta.getIdCliente());
            statement.setInt(2, cuenta.getTipo());
            statement.setDate(3, new java.sql.Date(cuenta.getCreacion().getTime()));
            statement.setString(4, cuenta.getCbu());
            statement.setFloat(5, cuenta.getSaldo());
            statement.setBoolean(6, cuenta.isActiva());

            if (statement.executeUpdate() > 0) {
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
    public boolean actualizarCuenta(Cuenta cuenta) {
        PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        boolean isUpdateExitoso = false;

        try {
            statement = conexion.prepareStatement(UPDATE);
            statement.setInt(1, cuenta.getIdCliente());
            statement.setInt(2, cuenta.getTipo());
            statement.setDate(3, new java.sql.Date(cuenta.getCreacion().getTime()));
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
                cuenta.setCreacion(resultSet.getDate("creacion"));
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
                    resultSet.getDate("creacion"),
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

}
