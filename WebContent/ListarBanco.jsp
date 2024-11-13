<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dominio.Cliente" %>  <!-- Asegúrate de que este sea el paquete correcto de tu clase Cliente -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
<div class="row">
       <div class="col-2"> 
       <%@include file="NavegacionComponente.jsp" %>
       	</div>
        <div class="section col-9">
            <h2>Listado de Clientes</h2>
            
            <table>
				<thead>
                <tr>
                    <th>DNI</th>
                    <th>CUIL</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th>Localidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                 <%
                List<Cliente> clientes = (List<Cliente>)request.getAttribute("clientes");
                if(clientes != null && !clientes.isEmpty()) {
                    for(Cliente cliente : clientes) {
                %>
                    <tr>
                        <td><%= cliente.getDni() %></td>
                        <td><%= cliente.getCuil() %></td>
                        <td><%= cliente.getNombre() %></td>
                        <td><%= cliente.getApellido() %></td>
                        <td><%= cliente.getEmail() %></td>
                        <td><%= cliente.getTelefono() %></td>
                        <td><%= cliente.getLocalidad() %></td>
                        <td>
                            <a href="ClienteServlet?accion=editar&dni=<%= cliente.getDni() %>" class="btn btn-warning btn-sm">Editar</a>
                            <a href="ClienteServlet?accion=eliminar&dni=<%= cliente.getDni() %>" class="btn btn-danger btn-sm">Eliminar</a>
                        </td>
                    </tr>
                <%
                    }
                }
                %>
            </tbody>
            </table>
        </div>

    </div>

</body>
</html>
