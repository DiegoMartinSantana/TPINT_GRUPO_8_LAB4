<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Dominio.Cliente" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Datos Personales</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css">
    
</head>
<body>
<%@include file="NavegacionComponenteUsuario.jsp" %>
<div class="container mt-5">
   
    <%
        Cliente cliente = (Cliente) request.getAttribute("cliente");
        if (cliente != null) {
    %>
    <div class="card rounded-3 border-0 shadow">
        <div class="card-header  text-center py-3 p-4">
            <h3 class="mb-0">Perfil</h3>
        </div>
        <div class="card-body">
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-person-circle text-primary fs-4 me-3"></i>
                        <p class="mb-0"><strong>Nombre:</strong> <span class="text-dark"><%= cliente.getNombre() %></span></p>
                    </div>
                    <div class="d-flex align-items-center mt-3">
                        <i class="bi bi-person-fill text-primary fs-4 me-3"></i>
                        <p class="mb-0"><strong>Apellido:</strong> <span class="text-dark"><%= cliente.getApellido() %></span></p>
                    </div>
                    <div class="d-flex align-items-center mt-3">
                        <i class="bi bi-card-text text-primary fs-4 me-3"></i>
                        <p class="mb-0"><strong>DNI:</strong> <span class="text-dark"><%= cliente.getDni() %></span></p>
                    </div>
                    <div class="d-flex align-items-center mt-3">
                        <i class="bi bi-person-badge text-primary fs-4 me-3"></i>
                        <p class="mb-0"><strong>CUIL:</strong> <span class="text-dark"><%= cliente.getCuil() %></span></p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-envelope-fill text-primary fs-4 me-3"></i>
                        <p class="mb-0"><strong>Email:</strong> <span class="text-dark"><%= cliente.getEmail() %></span></p>
                    </div>
                    <div class="d-flex align-items-center mt-3">
                        <i class="bi bi-telephone-fill text-primary fs-4 me-3"></i>
                        <p class="mb-0"><strong>Teléfono:</strong> <span class="text-dark"><%= cliente.getTelefono() %></span></p>
                    </div>
                    <div class="d-flex align-items-center mt-3">
                        <i class="bi bi-geo-alt-fill text-primary fs-4 me-3"></i>
                        <p class="mb-0"><strong>Localidad:</strong> <span class="text-dark"><%= cliente.getLocalidad() %></span></p>
                    </div>
                    <div class="d-flex align-items-center mt-3">
                        <i class="bi bi-flag-fill text-primary fs-4 me-3"></i>
                        <p class="mb-0"><strong>Nacionalidad:</strong> <span class="text-dark"><%= cliente.getNacionalidad() %></span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
        } else {
    %>
    <div class="alert alert-warning d-flex align-items-center mt-5 p-4" role="alert">
        <i class="bi bi-exclamation-circle-fill text-warning fs-3 me-3"></i>
        <div>
            <strong>Atención:</strong> No se han encontrado datos del cliente o no tienes acceso a esta sección.
        </div>
    </div>
    <%
        }
    %>
</div>

</body>
</html>