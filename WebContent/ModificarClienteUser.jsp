<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
<div class="row">
       <div class="col-2"> 
       <%@include file="NavegacionComponente.jsp" %>
       	</div>
        <div class="section col-9">
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