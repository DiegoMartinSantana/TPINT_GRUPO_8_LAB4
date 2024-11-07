<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Cliente</title>
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
            <h2>Modificar Cliente</h2>
            <form action="modificacionServlet" method="post">
                <label for="dniModificacion">DNI del Cliente:</label>
                <input type="text" id="dniModificacion" name="dni" required>
                <div style="margin-top: 15px;">
                    <button type="submit">Buscar Cliente</button>
                </div>
            </form>
            <h4>Edición de Datos del Cliente</h4>
            <form action="modificacionServlet" method="post">
                <input type="hidden" name="dni" id="dniEdicion">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
                
                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" required>
                
                <label for="sexo">Sexo:</label>
                <select id="sexo" name="sexo" required>
                     <option value="">Seleccione...</option>
                     <option value="Masculino">Masculino</option>
                     <option value="Femenino">Femenino</option>
                     <option value="Otro">Otro</option>
                </select>
               
                <label for="nacionalidad">Nacionalidad:</label>
                <input type="text" id="nacionalidad" name="nacionalidad" required>
                
                <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>
                
                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion" required>
                <label for="localidad">Localidad:</label>
                <input type="text" id="localidad" name="localidad" required>
                
                <label for="provincia">Provincia:</label>
                <input type="text" id="provincia" name="provincia" required>
                
                <label for="correo">Correo Electrónico:</label>
                <input type="email" id="correo" name="correo" required>
                
                <label for="telefono">Teléfono:</label>
                <input type="tel" id="telefono" name="telefono" required>
                
                <label for="usuario">Usuario:</label>
                <input type="text" id="usuario" name="usuario" required>
                
                <label for="contrasena">Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena" required>
                
                <div style="margin-top: 15px;">
                    <button type="submit">Guardar Cambios</button>
                </div>
            
           
            
            </form>
            
        </div>
    </div>


</body>
</html>