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
            <h2>Iniciar Sesión</h2>
            <form action="loginServlet" method="post">
                <label for="username">Nombre de Usuario:</label>
                <input type="text" id="username" name="username" required>
                
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
                
                <div style="margin-top: 15px;">
                    <button type="submit">Aceptar</button>
                </div>
            </form>
        </div>
      
    </div>

</body>
</html>