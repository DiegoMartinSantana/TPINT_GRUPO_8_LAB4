<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
<%@include file="Styles/StyleCliente.css" %>
</style>
</head>
<body>
<div class="container">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item me-3">
                    <a class="nav-link active" aria-current="page" href="Home.jsp">Home</a>
                </li>
                <li class="nav-item me-3">
                    <a class="nav-link" href="DatosPersonales.jsp">Datos Personales</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
  
       
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