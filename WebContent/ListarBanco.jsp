<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de Clientes</title>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>

  <div class="container">
       
        <!-- Listado de Clientes -->
        <div class="section">
            <h2>Listado de Clientes</h2>
            
            <table>
                <thead>
                    <tr>
                        <th>DNI</th>
                        <th>CUIL</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Sexo</th>
                        <th>Nacionalidad</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Dirección</th>
                        <th>Localidad</th>
                        <th>Provincia</th>
                        <th>Correo Electrónico</th>
                        <th>Teléfono</th>
                        <th>Usuario</th>
                        <th>Cuentas</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>12345678</td>
                        <td>20-12345678-9</td>
                        <td>Juan</td>
                        <td>Pérez</td>
                        <td>M</td>
                        <td>Argentina</td>
                        <td>1990-01-01</td>
                        <td>Calle Falsa 123</td>
                        <td>Buenos Aires</td>
                        <td>Buenos Aires</td>
                        <td>juan.perez@example.com</td>
                        <td>+54 11 1234-5678</td>
                        <td>usuario1</td>
                        <td>
                            <ul>
                                <li>Tipo: Ahorro, CBU: 1234567890123456789012, Saldo: $10,000</li>
                                <li>Tipo: Corriente, CBU: 2345678901234567890123, Saldo: $15,000</li>
                            </ul>
                        </td>
                    </tr>
                     <tr>
                        <td>87654321</td>
                        <td>20-87654321-9</td>
                        <td>Maria</td>
                        <td>González</td>
                        <td>F</td>
                        <td>Uruguay</td>
                        <td>1985-05-12</td>
                        <td>Avenida Siempre Viva 456</td>
                        <td>Montevideo</td>
                        <td>Montevideo</td>
                        <td>maria.gonzalez@example.com</td>
                        <td>+598 2 9876-5432</td>
                        <td>usuario2</td>
                        <td>
                            <ul>
                                <li>Tipo: Ahorro, CBU: 3456789012345678901234, Saldo: $10,000</li>
                            </ul>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>

    </div>

</body>
</html>
