<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Baja Cliente</title>

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
        <div class="section col-6">
            <h2>Baja de Cliente</h2>
            <form action="bajaClienteServlet" method="post">
                <label for="dniBaja">DNI del Cliente:</label>
                <input type="text" id="dniBaja" name="dni" required>
                
                <div style="margin-top: 15px;">
                    <button type="submit" style="background-color: red; color: white; border: none; padding: 10px; cursor: pointer;">Eliminar</button>
                </div>
                
                
            </form>
        </div>
    </div>

</body>
</html>