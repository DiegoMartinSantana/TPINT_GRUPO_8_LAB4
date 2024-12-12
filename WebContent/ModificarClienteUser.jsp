<%@ page import="java.util.ArrayList" %>
<%@ page import="Dominio.Provincia" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Dominio.Cliente" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Modificar Cliente</title>
<style>

<%@include file="../Styles/StyleCliente.css" %>
</style>
</head>
<body>
<%
    Cliente cliente = (Cliente) request.getAttribute("Cliente");
%>
<% if(cliente ==null){
	request.getRequestDispatcher("ClienteServlet").forward(request, response);
}	
	%>
	
	<%
					if(request.getAttribute("modificado") != null) {
				%>
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					<strong>Se modifico el cliente.</strong> Cliente modificado.
					<button type="button" class="btn-close m-0" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>

				<%
					}
				%>

<div class="row">
       <div class="col-2"> 
       <%@include file="NavegacionComponente.jsp" %>
       	</div>
        <div class="section col-9">
           
            <h4>Edición de Datos del Cliente</h4>
            <form action="ClienteServlet" method="post">
                 <input type="hidden" name="dni" value="<%= cliente.getDni() %>" id="dni">
		


        <input type="hidden" id="id" name="id" value="<%=cliente.getId()%>"> 
    <label for="cuil">CUIL :</label>
    <input type="text" id="cuil" style="background-color: lightblue;border:none" name="cuil" value="<%=cliente.getCuil()%> " readonly="readonly">
    
    <label for="nombreUsuario">Nombre de Usuario:</label>
    <input type="text" id="nombreUsuario" style="background-color: lightblue;border:none" name="nombreUsuario" value="<%= cliente.getNombreUsuario() %>" readonly="readonly">

    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" value="<%= cliente.getNombre() %>" required>

    <label for="apellido">Apellido:</label>
    <input type="text" id="apellido" name="apellido" value="<%= cliente.getApellido() %>" required>

    <label for="sexo">Sexo:</label>
    
    <select id="sexo" name="sexo" required>
        <option value="1" <%= cliente.getSexo() == 1 ? "selected" : "" %>>Masculino</option>
        <option value="2" <%= cliente.getSexo() == 2 ? "selected" : "" %>>Femenino</option>
        <option value="3" <%= cliente.getSexo() == 3 ? "selected" : "" %>>Otro</option>
    </select>

    <label for="fechaNacimiento">Fecha de Nacimiento:</label>
    <input type="date" id="fechaNacimiento" name="fechaNacimiento" value="<%=cliente.getNacimiento() %>" required>
    <label for="nacionalidad">Nacionalidad:</label>
    <input type="text" id="nacionalidad" name="nacionalidad" value="<%= cliente.getNacionalidad() %>" required>

<label for="provincia">Provincia:</label>
			<select id="DdlProvincia" name="DdlProvincia" required>
		                <option value="">Seleccione...</option>
			<%
                        ArrayList<Provincia> provincias = (ArrayList<Provincia>) request.getAttribute("Provincias");
					if(provincias!=null ){
					for(Provincia provincia : provincias){
						
				%>
		 <option value="<%= provincia.getId_provincia() %>" <%= cliente.getProvincia().getId_provincia() == provincia.getId_provincia() ? "selected" : "" %>> <%= provincia.getNombre() %> </option>

				<%}}else { %>
				<option value"" >No hay provincias disponibles </option>
				<%} %>
				</select>
    <label for="direccion">Domicilio:</label>
    <input type="text" id="direccion" name="direccion" value="<%= cliente.getDomicilio() %>" required>
	

    <label for="localidad">Localidad:</label>
    <input type="text" id="localidad" name="localidad" value="<%= cliente.getLocalidad() %>" required>

    <label for="email">Correo Electrónico:</label>
    <input type="email" id="email" name="email" value="<%= cliente.getEmail() %>" required >

    <label for="telefono">Teléfono:</label>
    <input type="tel" id="telefono" name="telefono" value="<%= cliente.getTelefono() %>" required>


    <div style="margin-top: 15px;">
        <button type="submit" style="padding:10px;border-radius:5px">Guardar Cambios</button>
    </div>
           
            
            </form>
            
        </div>
    </div>


</body>
</html>