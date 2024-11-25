<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style>
      
       <%@include file="../Styles/StyleLogin.css" %>
    </style>
</head>
<body>
    <div class="row">
        <h2>Iniciar Sesión</h2>
        <form action="LoginServlet" method="get">
            <label for="username">Nombre de Usuario:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>
            
            <div class="button-container">
                <input type="submit" value="Aceptar">
            </div>
        </form>
    </div>

</body>
</html>