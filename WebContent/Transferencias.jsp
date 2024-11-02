<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transferencias</title>
<style>
<%@include file="Styles/StyleCliente.css" %>
</style>
</head>
<body>
  <div class="container">
  <div class="section" id="transferForm" style="margin-top:5px ;" >
            <h2>Realizar Transferencia</h2>
            <label for="tipoTransferencia">Tipo de Transferencia:</label>
            <select id="tipoTransferencia" onchange="toggleCuentaDestino()">
                <option value="propia">Entre Mis Cuentas</option>
                <option value="ajena">A Cuenta Ajena</option>
            </select>
      <div id="cuentaOrigen" style="display: block;margin-top: 15px;">
                <label for="cuentaOrigen">Cuenta Origen:</label>
                <select id="cuentaOrigen">
                    <option value="cuenta1">Cuenta 1</option>
                    <option value="cuenta2">Cuenta 2</option>
                </select>
            </div>
            <div id="cuentaDestinoPropia" style="display: block;margin-top: 15px;">
                <label for="cuentaDestino">Cuenta Destino:</label>
                <select id="cuentaDestino">
                    <option value="cuenta1">Cuenta 1</option>
                    <option value="cuenta2">Cuenta 2</option>
                </select>
            </div>
    
            <div id="cuentaDestinoAjena" style="margin-top: 15px;">
                <label for="cuentaAjena">Cbu:</label>
                <input type="text" id="cuentaAjena">
            </div>
            <div style="margin-top: 15px;">

            <label for="monto" >Monto:</label>
            <input type="number" id="monto" min="1">
            </div>

            <button  style="margin-top: 15px;">Enviar Transferencia</button>
        </div>         </div> 
</body>
</html>