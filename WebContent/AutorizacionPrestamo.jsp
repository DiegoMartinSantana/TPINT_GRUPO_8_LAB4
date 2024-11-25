<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Autorizaciones</title>
<style>
<%@include file="../Styles/StyleCliente.css" %>

.btnAceptar {
	background-color: #51bb55;
	color: white;
	border: 1px solid #51bb55;
}
        
.btnRechazar {
	background-color: #FF0000;
	color: white;
	border: 1px solid #FF0000;
}
    
</style>
</head>

<body>
<div class="row">
       <div class="col-2"> 
       <%@include file="NavegacionComponente.jsp" %>
       	</div>
        <div class="section col-9">
            <h2>Autorización de préstamos</h2>
            
            <table>
                <thead>
                    <tr>
                        <th>DNI</th>
                        <th>CUIL</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Préstamo pedido</th>
                        <th>Cuotas</th>
                        <th>CBU depósito</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>12345678</td>
                        <td>20-12345678-9</td>
                        <td>Juan</td>
                        <td>Pérez</td>
                        <td>$1.500.000 ARS</td>
                        <td>6</td>
                        <td>
                            <ul>
                                <li>Tipo: Ahorro, CBU: 1234567890123456789012, Saldo: $10,000</li>
                                <li>Tipo: Corriente, CBU: 2345678901234567890123, Saldo: $15,000</li>
                            </ul>
                        </td>
                        <td>
                        <form action="procesarPrestamo" method="post">
                            <input type="hidden" name="dni" value="87654321"/>
                            <button type="submit" name="accion" value="aceptar" class="btnAceptar">Aceptar</button>
                            <button type="submit" name="accion" value="rechazar" class="btnRechazar">Rechazar</button>
                        </form>
                    </td>
                    </tr>
                     <tr>
                        <td>87654321</td>
                        <td>20-87654321-9</td>
                        <td>Maria</td>
                        <td>González</td>
                        <td>$3.750.000 ARS</td>
                        <td>12</td>
                        <td>
                            <ul>
                                <li>Tipo: Ahorro, CBU: 3456789012345678901234, Saldo: $10,000</li>
                            </ul>
                        </td> 
                       	<td>
                        <form action="procesarPrestamo" method="post">
                            <input type="hidden" name="dni" value="87654321"/>
                            <button type="submit" name="accion" value="aceptar" class="btnAceptar">Aceptar</button>
                            <button type="submit" name="accion" value="rechazar" class="btnRechazar">Rechazar</button>
                        </form>
                    </td>         
                    </tr>

                </tbody>
            </table>
        </div>
        </div>
     
   

</body>
</html>