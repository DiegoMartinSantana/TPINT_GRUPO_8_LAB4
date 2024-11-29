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
<%@include file="../Styles/StyleTablas.css" %>
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
  <div class="col-9 section">
    <h2 class="text-center mb-4">Autorización de préstamos</h2>

    <div>
        <table class="table table-hover align-middle" style="border-radius: 16px; overflow: hidden; background: #fff; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            <thead style="background: #007bff; color: #fff; text-align: center;">
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
                <tr style="border-bottom: 1px solid #e0e0e0;">
                    <td style="text-align: center;">12345678</td>
                    <td style="text-align: center;">20-12345678-9</td>
                    <td style="text-align: center;">Juan</td>
                    <td style="text-align: center;">Pérez</td>
                    <td style="text-align: center;">$1.500.000 ARS</td>
                    <td style="text-align: center;">6</td>
                    <td>
                        <ul style="font-size: 14px; list-style: none; padding: 0; margin: 0;">
                            <li>Tipo: Ahorro, CBU: 1234567890123456789012, Saldo: $10,000</li>
                            <li>Tipo: Corriente, CBU: 2345678901234567890123, Saldo: $15,000</li>
                        </ul>
                    </td>
                    <td style="text-align: center;">
                        <form action="procesarPrestamo" method="post" style="display: inline-block;">
                            <input type="hidden" name="dni" value="12345678"/>
                            <button type="submit" name="accion" value="aceptar" class="btn btn-success btn-sm me-2">Aceptar</button>
                            <button type="submit" name="accion" value="rechazar" class="btn btn-danger btn-sm">Rechazar</button>
                        </form>
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #e0e0e0;">
                    <td style="text-align: center;">87654321</td>
                    <td style="text-align: center;">20-87654321-9</td>
                    <td style="text-align: center;">Maria</td>
                    <td style="text-align: center;">González</td>
                    <td style="text-align: center;">$3.750.000 ARS</td>
                    <td style="text-align: center;">12</td>
                    <td>
                        <ul style="font-size: 14px; list-style: none; padding: 0; margin: 0;">
                            <li>Tipo: Ahorro, CBU: 3456789012345678901234, Saldo: $10,000</li>
                        </ul>
                    </td>
                    <td style="text-align: center;">
                        <form action="procesarPrestamo" method="post" style="display: inline-block;">
                            <input type="hidden" name="dni" value="87654321"/>
                            <button type="submit" name="accion" value="aceptar" class="btn btn-success btn-sm me-2">Aceptar</button>
                            <button type="submit" name="accion" value="rechazar" class="btn btn-danger btn-sm">Rechazar</button>
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
   

</body>
</html>