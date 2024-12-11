<%@ page import="java.util.ArrayList" %>
<%@ page import="Dominio.Provincia" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<title>Alta Cliente</title>




</head>
<style>


<%@include file="../Styles/StyleCliente.css" %>
<%@include file="../Styles/StyleFormulario.css" %>
</style>
</head>
<body>
   <div class="row">
        <div class="col-2"> 
            <%@include file="NavegacionComponente.jsp" %>
        </div>
        <div class="section col-8">
    <h2>Generar Cliente</h2>
    <form action="servletUsuario" method="post">
     
        <div class="form-group">
        
         <label for="usuario">Usuario:</label>
            <input type="text" id="usuario" name="usuario" placeholder="Ingrese su usuario" required>

           <label for="contrasena">Contraseña:</label>
<div class="password-wrapper">
    <input type="password" id="contrasena" name="contrasena" placeholder="Ingrese su contraseña" required>
      <span class="material-icons toggle-password" id="togglePassword">visibility</span>


</div>
            
            <label for="dni">DNI:</label>
            <input type="text" id="dni" name="dni" placeholder="Ingrese su DNI" required>

            <label for="cuil">CUIL:</label>
            <input type="text" id="cuil" name="cuil" placeholder="Ingrese su CUIL" required>

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" placeholder="Ingrese su nombre" required>

            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" placeholder="Ingrese su apellido" required>

            <label for="sexo">Sexo:</label>
            <select id="sexo" name="sexo" required>
                <option value="">Seleccione...</option>
                <option value="1">Masculino</option>
                <option value="2">Femenino</option>
                <option value="3">Otro</option>
            </select>

           
        </div>

      
        <div class="form-group-right">
            <label for="fechaNacimiento">Fecha de Nacimiento:</label>
            <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>
         <label for="nacionalidad">Nacionalidad:</label>
            <input type="text" id="nacionalidad" name="nacionalidad" placeholder="Ingrese su nacionalidad" required>
        
            <label for="provincia">Provincia:</label>
            <select id="DdlProvincia" name="DdlProvincia" required>
                <option value="">Seleccione...</option>
                <% ArrayList<Provincia> provincias = (ArrayList<Provincia>) request.getAttribute("Provincias");
                if(provincias != null) {
                    for(Provincia provincia : provincias) { %>
                        <option value="<%= provincia.getId_provincia() %>"><%= provincia.getNombre() %></option>
                <% }} else { %>
                    <option value="">No hay provincias disponibles</option>
                <% } %>
            </select>

            <label for="localidad">Localidad:</label>
            <input type="text" id="localidad" name="localidad" placeholder="Ingrese su localidad" required>

            <label for="domicilio">Domicilio:</label>
            <input type="text" id="domicilio" name="domicilio" placeholder="Ingrese su domicilio" required>

            <label for="correoElectronico">Correo Electrónico:</label>
            <input type="email" id="correoElectronico" name="correoElectronico" placeholder="Ingrese su correo electrónico" required>

            <label for="telefono">Teléfono:</label>
            <input type="tel" id="telefono" name="telefono" placeholder="Ingrese su número de teléfono" required>

           
        </div>

       
    </form>
     <div class="">
            <input type="submit" style="width:100%" value="Aceptar" name="btnAceptar">
        </div>
</div>

    </div>
<script>
    document.getElementById("togglePassword").addEventListener("click", function () {
        const passwordInput = document.getElementById("contrasena");
        const isPassword = passwordInput.type === "password";
        passwordInput.type = isPassword ? "text" : "password";
     
    });
</script>

</body>
</html>