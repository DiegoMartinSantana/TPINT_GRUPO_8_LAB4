<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<div class="container">
        <div class="section">
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