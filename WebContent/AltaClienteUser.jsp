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

<title>Alta Cliente</title>

<style>
<%@include file="../Styles/StyleCliente.css" %>

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
        <div class="section col-8">
            <h2>Alta de Cliente</h2>
            <form action="servletUsuario" method="post">
            
            <label for="dni">DNI:</label>
            <input type="text" id="dni" name="dni" required>

            <label for="cuil">CUIL:</label>
            <input type="text" id="cuil" name="cuil" required>

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>

            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" required>
            
            <label for="sexo">Sexo:</label>
            <select id="sexo" name="sexo" required>
                <option value="">Seleccione...</option>
                <option value="1">Masculino</option>
                <option value="2">Femenino</option>
                <option value="3">Otro</option>
            </select>
            
            <label for="nacionalidad">Nacionalidad:</label>
            <input type="text" id="nacionalidad" name="nacionalidad" required>

            <label for="fechaNacimiento">Fecha de Nacimiento:</label>
            <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>

           
            
			<label for="provincia">Provincia:</label>
			<select id="DdlProvincia" name="DdlProvincia" required>
		                <option value="">Seleccione...</option>
			<%
                        ArrayList<Provincia> provincias = (ArrayList<Provincia>) request.getAttribute("Provincias");
					if(provincias!=null ){
					for(Provincia provincia : provincias){
						
				%>
				
				   <option value="<%= provincia.getId_provincia() %>"><%= provincia.getNombre() %></option>

				<%}}else { %>
				<option value"" >No hay provincias disponibles </option>
				<%} %>
				</select>
				
             <label for="localidad">Localidad:</label>
            <input type="text" id="localidad" name="localidad" required>
				
 			<label for="domicilio">Domicilio:</label>
            <input type="text" id="domicilio" name="domicilio" required>

           
            <label for="correoElectronico">Correo Electronico:</label>
            <input type="email" id="correoElectronico" name="correoElectronico" required>

            <label for="telefono">Telefono:</label>
            <input type="tel" id="telefono" name="telefono" required>

            <label for="usuario">Usuario:</label>
            <input type="text" id="usuario" name="usuario" required>

            <label for="contrasena">Contrasena:</label>
            <input type="password" id="contrasena" name="contrasena" required>
            
            
            <input type="submit" value="Aceptar" name="btnAceptar">
            </form>
            
        </div>
        </div>
</body>
</html>