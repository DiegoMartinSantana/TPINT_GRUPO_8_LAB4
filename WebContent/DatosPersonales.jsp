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
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
   <%@include file="../Styles/StyleDatosPersonales.css" %>
    </style>
</head>
<body>
<%@include file="NavegacionComponenteUsuario.jsp" %>
    <div class="container-fluid p-0">
        <% Cliente cliente = (Cliente) request.getAttribute("cliente"); %>

        <% if (cliente != null) { %>
        <div class="client-profile">
            <div class="profile-header" style="background-color: bg-primary">
                <h2 class="mb-0">Perfil </h2>
          
            </div>
            <div class="profile-body" style="background-color: bg-primary">
                <div class="row">
                    <div class="col-md-6">
                        <div class="info-section">
                            <h4>Información Personal</h4>
                            <div class="info-item">
                                <div class="info-icon">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div class="info-details">
                                    <h6>Nombre Completo</h6>
                                    <p><%= cliente.getNombre() %> <%= cliente.getApellido() %></p>
                                </div>
                            </div>
                            <div class="info-item">
                                <div class="info-icon">
                                    <i class="fas fa-id-card"></i>
                                </div>
                                <div class="info-details">
                                    <h6>DNI</h6>
                                    <p><%= cliente.getDni() %></p>
                                </div>
                            </div>
                            <div class="info-item">
                                <div class="info-icon">
                                    <i class="fas fa-fingerprint"></i>
                                </div>
                                <div class="info-details">
                                    <h6>CUIL</h6>
                                    <p><%= cliente.getCuil() %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="info-section">
                            <h4>Información de Contacto</h4>
                            <div class="info-item">
                                <div class="info-icon">
                                    <i class="fas fa-envelope"></i>
                                </div>
                                <div class="info-details">
                                    <h6>Correo Electrónico</h6>
                                    <p><%= cliente.getEmail() %></p>
                                </div>
                            </div>
                            <div class="info-item">
                                <div class="info-icon">
                                    <i class="fas fa-phone"></i>
                                </div>
                                <div class="info-details">
                                    <h6>Teléfono</h6>
                                    <p><%= cliente.getTelefono() %></p>
                                </div>
                            </div>
                            <div class="info-item">
                                <div class="info-icon">
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                                <div class="info-details">
                                    <h6>Localidad</h6>
                                    <p><%= cliente.getLocalidad() %></p>
                                </div>
                            </div>
                            <div class="info-item">
                                <div class="info-icon">
                                    <i class="fas fa-globe"></i>
                                </div>
                                <div class="info-details">
                                    <h6>Nacionalidad</h6>
                                    <p><%= cliente.getNacionalidad() %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } else { %>
        <div class="container">
            <div class="alert alert-danger text-center mt-5">
                <i class="fas fa-exclamation-circle fa-3x mb-3"></i>
                <h4>No se encontraron datos del cliente</h4>
                <p>Verifica tu acceso o contacta al administrador.</p>
            </div>
        </div>
        <% } %>
    </div>
</body>




</body>
</html>