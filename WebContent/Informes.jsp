<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Informes</title>
<style>
<%@include file="../Styles/StyleCliente.css" %>
</style>
</head>
<body>

 <div class="row">
       <div class="col-2"> 
       <%@include file="NavegacionComponente.jsp" %>
       	</div>
       	<div class="col-8">
       
        <div class="section ">
            <h2>Fecha desde</h2>
            <input type="date" name="fecha" required>
            <h2>Fecha hasta</h2>
            <input type="date" name="fecha" required>
        </div>
    
        <div class="section" >
            <h2>Prestamos aprobados</h2>
            <table>
                <thead>
                    <tr>
                        <th>Cantidad</th>
                        <th>Total</th>
                        <th>Cliente Lider</th>
                    </tr>
                </thead>
                <tbody>
                  
                <tr>
                    <td>47 préstamos</td>
                    <td>$65.950.000</td>
                    <td>Matilde Gonzalez</td>
                </tr>

                </tbody>
            </table>
        </div>
        
        
        
         <div class="section" >
            <h2>Tasa de cumplimiento: 86%</h2>
            <h5>*Registro de pagos concretados de préstamos otorgados en el rango seleccionado*</h5>   
    	</div>
    	
    	<div class="section" >
            <h2>Clientes VIP</h2>
            <table>
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>CUIT/CUIL</th>
                        <th>Total prestado</th>
                    </tr>
                </thead>
                <tbody>
                  
                <tr>
                    <td>Marta Garcia</td>
                    <td>21-34386525-7</td>
                    <td>$5.600.000</td>
                </tr>
                <tr>
                    <td>Jose Artigas</td>
                    <td>20-98534625-9</td>
                    <td>$5.350.000</td>
                </tr>
				<tr>
                    <td>Pepe Argento</td>
                    <td>20-35689426-9</td>
                    <td>$3.900.000</td>
                </tr>
                
                </tbody>
            </table>
    	</div>
  
    </div>
	</div>
</body>
</html>