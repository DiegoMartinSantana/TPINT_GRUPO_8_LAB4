<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Dominio.Cliente" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Datos Personales</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@include file="NavegacionComponenteUsuario.jsp" %>

    <div class="container mt-5">
        <h1 class="mb-4">Datos Personales</h1>
        <%
            Cliente cliente = (Cliente) request.getAttribute("cliente");
            if (cliente != null) {
        %>
        <div class="row">
            <div class="col-md-6">
                <p><strong>Nombre:</strong> <%= cliente.getNombre() %></p>
                <p><strong>Apellido:</strong> <%= cliente.getApellido() %></p>
                <p><strong>DNI:</strong> <%= cliente.getDni() %></p>
                <p><strong>CUIL:</strong> <%= cliente.getCuil() %></p>
            </div>
            <div class="col-md-6">
                <p><strong>Email:</strong> <%= cliente.getEmail() %></p>
                <p><strong>Teléfono:</strong> <%= cliente.getTelefono() %></p>
                <p><strong>Localidad:</strong> <%= cliente.getLocalidad() %></p>
                <p><strong>Nacionalidad:</strong> <%= cliente.getNacionalidad() %></p>
            </div>
        </div>
        <%
            } else {
        %>
        <div class="alert alert-warning" role="alert">
            No se han encontrado datos del cliente, o no tiene acceso a esta seccion.
        </div>
        <%
            }
        %>
    </div>
</body>
</html>