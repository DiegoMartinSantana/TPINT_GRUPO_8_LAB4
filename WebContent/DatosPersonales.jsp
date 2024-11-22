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
    <div class="container mt-5">
        <h1 class="mb-4">Datos Personales</h1>
        <%
            Cliente cliente = (Cliente) request.getAttribute("cliente");
        %>
        <div class="row">
            <div class="col-md-6">
                <p><strong>Nombre:</strong> <%= cliente != null ? cliente.getNombre() : "No disponible" %></p>
                <p><strong>Apellido:</strong> <%= cliente != null ? cliente.getApellido() : "No disponible" %></p>
                <p><strong>DNI:</strong> <%= cliente != null ? cliente.getDni() : "No disponible" %></p>
                <p><strong>CUIL:</strong> <%= cliente != null ? cliente.getCuil() : "No disponible" %></p>
            </div>
            <div class="col-md-6">
                <p><strong>Email:</strong> <%= cliente != null ? cliente.getEmail() : "No disponible" %></p>
                <p><strong>Teléfono:</strong> <%= cliente != null ? cliente.getTelefono() : "No disponible" %></p>
                <p><strong>Localidad:</strong> <%= cliente != null ? cliente.getLocalidad() : "No disponible" %></p>
                <p><strong>Nacionalidad:</strong> <%= cliente != null ? cliente.getNacionalidad() : "No disponible" %></p>
            </div>
        </div>
        <a href="Home.jsp" class="btn btn-primary mt-4">Volver al Menú Principal</a>
    </div>
</body>
</html>