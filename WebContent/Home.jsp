<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"></style>

<style>
<%@include file="../Styles/StyleCliente.css" %>
</style>
</head>
<body>
  <%@include file="NavegacionComponenteUsuario.jsp" %>

<div class="container">

        <div class="section">
            <h2>Selecciona tu Cuenta</h2>
            <select id="cuentaSelect" onchange="mostrarHistorial()">
                <option value="cuenta1">Cuenta 1 - $5000</option>
                <option value="cuenta2">Cuenta 2 - $3000</option>
            </select>
        </div>
    
        <div class="section" >
            <h2>Historial de Transferencias</h2>
            <table>
                <thead>
                    <tr>
                        <th>Fecha</th>
                        <th>Monto</th>
                        <th>Destino</th>
                    </tr>
                </thead>
                <tbody id="historialTable">
                  
                <tr>
                    <td>01/10/2023</td>
                    <td>$200</td>
                    <td>Cuenta 2</td>
                </tr>
                <tr>
                    <td>02/10/2023</td>
                    <td>$150</td>
                    <td>Cuenta 1</td>
                </tr>
                <tr>
                    <td>03/10/2023</td>
                    <td>$300</td>
                    <td>1556595143036</td>
                </tr>
                </tbody>
            </table>
        </div>
    
      
        <div class="section" style="margin-top: 15px;">
            <button >Nueva Transferencia</button>
        </div>
    
       
      
    </div>

</body>
</html>