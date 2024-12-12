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
    <form action="servletUsuario" method="post"   onsubmit="return validarContrasenas()">



				<%
					if(request.getParameter("Agregado") != null) {
				%>
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					<strong>Se agrego correctamente.</strong> El cliente esta en la
					lista de clientes.
					<button type="button" class="btn-close m-0" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>

				<%
					}
				%>

				<%
					if (request.getParameter("NoAgregado") != null) {
				%>
				<div class="alert alert-danger alert-dismissible fade show "
					role="alert">
					<strong>No se pudo agregar el cliente.</strong> El NOMBRE DE
					USUARIO EXISTE.
					<button type="button" class="btn-close m-0" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>

				<%
					}
				%>
				<%
					if (request.getParameter("NoAgregadoPorOtro") != null) {
				%>
				<div class="alert alert-danger alert-dismissible fade show "
					role="alert">
					<strong>No se pudo agregar el cliente.</strong> Ingresaste mal algun dato
					<button type="button" class="btn-close m-0" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>

				<%} %>

				<div class="form-group">
     
     
   <label for="usuario">Usuario:</label>
<input type="text" id="usuario" name="usuario" placeholder="Ingrese su usuario" required  pattern="^[a-zA-Z0-9]+$" title="El usuario solo debe contener letras y números.">


     
     
            
    <label for="contrasena">Contraseña:</label>
    <div class="password-wrapper">
        <input type="password" id="contrasena" name="contrasena" placeholder="Ingrese su contraseña" required>
        <span class="material-icons toggle-password" id="togglePassword1" onclick="toggleVisibility('contrasena')">visibility</span>
    </div>

    <label for="repetirContrasena">Repetir Contraseña:</label>
    <div class="password-wrapper">
        <input type="password" id="repetirContrasena" name="repetirContrasena" placeholder="Repita la contraseña" required onblur="validarContrasenas()">
        <span class="material-icons toggle-password" id="togglePassword2" onclick="toggleVisibility('repetirContrasena')">visibility</span>
    </div>
     
         <div id="errorMensaje" style="color: red; display: none;">Las contraseñas no coinciden.</div>



		    <label for="dni">DNI:</label> 
		    <input type="text" id="dni"	name="dni" placeholder="Ingrese su DNI" required pattern="^\d{1,8}$" title="El DNI debe contener entre 1 y 8 dígitos (solo números del 0 al 9).">

			<label for="cuil">CUIL:</label>
            <input type="text" id="cuil" name="cuil" placeholder="Ingrese su CUIL" required pattern="^\d+$" title="El CUIL solo debe contener números.">

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" placeholder="Ingrese su nombre" required pattern="^[a-zA-Z]+$" title="El nombre solo debe contener letras.">

            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" placeholder="Ingrese su apellido" required pattern="^[a-zA-Z]+$" title="El apellido solo debe contener letras.">

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
            <input type="text" id="nacionalidad" name="nacionalidad" placeholder="Ingrese su nacionalidad" required pattern="^[a-zA-Z]+$" title="La nacionalidad solo debe contener letras.">
        
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
            <input type="text" id="localidad" name="localidad" placeholder="Ingrese su localidad" required pattern="^[a-zA-Z]+$" title="La localidad solo debe contener letras.">

            <label for="domicilio">Domicilio:</label>
            <input type="text" id="domicilio" name="domicilio" placeholder="Ingrese su domicilio" required pattern="^[a-zA-Z0-9 ]+$" title="El domicilio solo debe contener letras, números y espacios.">


            <label for="correoElectronico">Correo Electrónico:</label>
            <input type="email" id="correoElectronico" name="correoElectronico" placeholder="Ingrese su correo electrónico" required>

            <label for="telefono">Teléfono:</label>
            <input type="tel" id="telefono" name="telefono" placeholder="Ingrese su número de teléfono" required pattern="^[+]?[\d ]+$" title="El teléfono solo debe contener números, espacios y el signo '+'.">


           
        </div>
<div>
    <input type="submit" style="width:100%" value="Aceptar" name="btnAceptar" onclick="return validarContrasenas()">
</div>

    </form>
    
</div>

    </div>
<script>
document.getElementById("togglePassword1").addEventListener("click", function () {
    const passwordInput = document.getElementById("contrasena");
    const isPassword = passwordInput.type === "password";
    passwordInput.type = isPassword ? "text" : "password";
 
});
document.getElementById("togglePassword2").addEventListener("click", function () {
    const passwordInput = document.getElementById("repetirContrasena");
    const isPassword = passwordInput.type === "password";
    passwordInput.type = isPassword ? "text" : "password";
 
});
function validarContrasenas() {
    const contrasena = document.getElementById("contrasena").value.trim();
    const repetirContrasena = document.getElementById("repetirContrasena").value.trim();
    const errorMensaje = document.getElementById("errorMensaje");

    if (contrasena !== repetirContrasena) {
        errorMensaje.style.display = "block"; 
        document.getElementById("repetirContrasena").classList.add("input-error");
    } else {
        errorMensaje.style.display = "none"; 
        document.getElementById("repetirContrasena").classList.remove("input-error");
    }
}

    document.getElementById("togglePassword").addEventListener("click", function () {
        const passwordInput = document.getElementById("contrasena");
        const isPassword = passwordInput.type === "password";
        passwordInput.type = isPassword ? "text" : "password";
     
    });
    document.getElementById("togglePassword2").addEventListener("click", function () {
        const passwordInput = document.getElementById("contrasena2");
        const isPassword = passwordInput.type === "password";
        passwordInput.type = isPassword ? "text" : "password";
     
    });
</script>

</body>
</html>