<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pedido de Pr�stamo</title>
<style>
<%@include file="../Styles/StyleCliente.css" %>

</style>
</head>
<body>

<div class="container">
    <div class="section">
        <h2>Pedido de Pr�stamo</h2>
        
        <!-- Formulario para solicitar un pr�stamo -->
        <form action="pedirPrestamo" method="post">
            
            <!-- Monto del pr�stamo -->
            <div class="field">
                <label for="monto">Monto del Pr�stamo:</label>
                <input type="number" id="monto" name="monto" placeholder="Ingrese el monto" required min="1000" max="100000">
            </div>
            <br>
            
            <!-- Cantidad de cuotas -->
            <div class="field">
                <label for="cuotas">Cantidad de Cuotas:</label>
                <select id="cuotas" name="cuotas" required>
                    <option value="3">3 cuotas</option>
                    <option value="6">6 cuotas</option>
                    <option value="12">12 cuotas</option>
                    <option value="24">24 cuotas</option>
                </select>
            </div>
            <br>
            <!-- Seleccionar cuenta de destino -->
            <div class="field">
                <label for="cuenta">Seleccionar Cuenta de Dep�sito:</label>
                <select id="cuenta" name="cuenta" required>
                    <option value="cuenta1">Cuenta 1 - CBU: 1234567890123456789012</option>
                    <option value="cuenta2">Cuenta 2 - CBU: 2345678901234567890123</option>
                    <!-- Aqu� puedes cargar din�micamente las cuentas del cliente desde el backend -->
                </select>
            </div>
            <br>
            <!-- Bot�n para solicitar el pr�stamo -->
            <button type="submit">Solicitar Pr�stamo</button>
            
        </form>
    </div>
</div>

</body>
</html>