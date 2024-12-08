<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
<%@ page import="Dominio.Cliente" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Alta de Cuenta</title>
<style>
<%@include file="../Styles/StyleCliente.css" %>

label, select, input[type="text"], input[type="date"] {
    display: block;
    margin-top: 10px;
    width: 100%;
}

</style>
</head>
<body>
<div class="row">
       <div class="col-2"> 
       <%@include file="NavegacionComponente.jsp" %>
       	</div>
        <div class="section col-8">
            <h2>Alta de Cuenta</h2>
            <form action="AltaCuentaServlet" method="POST">
                
                <label for="cliente">Seleccionar Cliente:</label>
                <select id="clientes" name="clientes" required>
                    <option value="">Seleccione un Cliente</option>
                    <%-- Itera sobre la lista de clientes activos --%>
                    <%
   					 List<Cliente> clientes = (List<Cliente>)request.getAttribute("clientes"); 
    				if (clientes != null) {
      				  for (Cliente cliente : clientes) {
					%>
   			        <option value="<%= cliente.getId() %>">
            	    <%= cliente.getDni() + " - " + cliente.getNombre() + " " + cliente.getApellido() %>
          		  </option>
					<%
    				    }
  				  } 
					%>
       				
                </select>
                
                <label for="tipoCuenta">Seleccionar Tipo de Cuenta:</label>
                <select id="tipoCuenta" name="tipoCuenta" required>
                    <option value="1">Cuenta Corriente</option>
                    <option value="2">Cuenta de Ahorro</option>
                </select>
                
                <label for="fechaCreacion">Fecha de Creaci�n:</label>
                <input type="date" id="fechaCreacion" name="fechaCreacion" 
                       value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" 
                       readonly>
                
                <p>El cbu se generara automaticamente.</p>
                <br>
                <div style="margin-top: 15px;">
                    <label>Monto Inicial: $10,000</label>
                </div>
        
                <div style="margin-top: 15px;">
                    <button type="submit">Aceptar</button>
                </div>
            </form>
        </div>
      
    </div>

</body>
</html>
