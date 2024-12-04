<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
        <div <% if(request.getAttribute("UsuarioNulo") == null) { %>style="display:none;"<% } %>>
    <%= request.getAttribute("UsuarioNulo") %>
</div>
    </div>
    

</body>
</html>