<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alta de Cuenta</title>
<style>
<%@include file="Styles/StyleCliente.css" %>

label, select, input[type="text"], input[type="date"] {
    display: block;
    margin-top: 10px;
    width: 100%;}

</style>
</head>
<body>

  <div class="container">
       
        <div class="section">
            <h2>Alta de Cuenta</h2>
            <form action="altaCuentaServlet" method="post">
                
                <label for="cliente">Seleccionar Cliente:</label>
                <select id="cliente" name="cliente" required>
                    <option value="cliente1">Cliente 1</option>
                    <option value="cliente2">Cliente 2</option>
                </select>
                
                <label for="tipoCuenta">Seleccionar Tipo de Cuenta:</label>
                <select id="tipoCuenta" name="tipoCuenta" required>
                    <option value="ahorro">Cuenta de Ahorro</option>
                    <option value="corriente">Cuenta Corriente</option>
    
                </select>
                
                <label for="fechaCreacion">Fecha de Creación:</label>
                <input type="date" id="fechaCreacion" name="fechaCreacion" 
                       value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" 
                       readonly>
                
                <label for="cbu">CBU:</label>
                <input type="text" id="cbu" name="cbu" maxlength="22" placeholder="Ingrese el CBU" required>
                
                <div style="margin-top: 15px;">
                    <label>Monto Inicial: $10,000</label>
                </div>

                <div style="margin-top: 15px;">
                    <label for="activo">
                        <input type="checkbox" id="activo" name="activo" value="true"> Activo
                    </label>
                </div>
                
                <div style="margin-top: 15px;">
                    <button type="submit">Aceptar</button>
                </div>
            </form>
        </div>
      
    </div>

</body>
</html>