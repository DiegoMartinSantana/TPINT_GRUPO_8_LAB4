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

<%@include file="../Styles/StyleFormulario.css" %>

</style>
</head>
<body>
<div class="row">
    <div class="col-2">
        <%@include file="NavegacionComponente.jsp" %>
    </div>
    <div class="section col-8" style="margin-top:120px">
        <h2>Alta de Cuenta</h2>
        <form action="AltaCuentaServlet" method="POST">
            <div class="form-group">
                <label for="cliente">Seleccionar Cliente:</label>
                <select id="clientes" name="clientes" required>
                    <option value="">Seleccione un Cliente</option>
                   
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
            </div>

            <div class="form-group">
                <label for="tipoCuenta">Seleccionar Tipo de Cuenta:</label>
                <select id="tipoCuenta" name="tipoCuenta" required>
                    <option value="1">Cuenta Corriente</option>
                    <option value="2">Cuenta de Ahorro</option>
                </select>
            </div>

            <div class="form-group">
                <label for="fechaCreacion">Fecha de Creación:</label>
                <input type="date" id="fechaCreacion" name="fechaCreacion" 
                       value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" 
                       readonly>
            </div>

            <div class="form-group" style="margin-top:40px;padding:0">
          
               <strong>Se le asignara un Cbu al registrar,</strong> 
               <strong>con un Monto inicial de $10,000.</strong>

            </div>

           <input type="submit" style="width:100%;" value="Aceptar">
           
        </form>
    </div>
</div>

</body>
</html>
