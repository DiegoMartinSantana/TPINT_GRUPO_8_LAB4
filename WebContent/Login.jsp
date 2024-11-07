<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style>
<%@include file="Styles/StyleCliente.css" %>
</style>
</head>
<body>

<div class="container">
        <div class="section">
            <h2>Iniciar Sesi�n</h2>
            <form action="LoginServlet" method="get">
                <label for="username">Nombre de Usuario:</label>
                <input type="text" id="username" name="username" required>
                
                <label for="password">Contrase�a:</label>
                <input type="password" id="password" name="password" required>
                
                <div style="margin-top: 15px;">
                    
                    <input type="submit" value="Aceptar">
                </div>
            </form>
        </div>
        <%if(request.getAttribute("UsuarioValido")!=null){ %>
        	<p style="color:red; "> Usuario o Contrase�a invalidos. </p>
        <%} %>
    </div>

</body>
</html>