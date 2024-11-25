<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pagar Prestamos</title>
<style>
<%@include file="../Styles/StyleCliente.css" %>

</style>
</head>
<body>

  <div class="container">
    
        <div class="section" >
            <h2>Prestamos activos</h2>
            <table>
                <thead>
                    <tr>
                    	<th>Numero</th>
                        <th>Fecha Préstamo</th>
                        <th>Total</th>
                        <th>Próximo vencimiento</th>
                        <th>Total Adeudado</th>
                        <th>Cuota a pagar</th>
                        <th>Cuotas restantes</th>
                        <th>Fecha Finalización</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                  
                <tr>
                    <td>1</td>
                    <td>16/05/2023</td>
                    <td>$500.000</td>
                    <td>10/11/2024</td>
                    <td>$65.600</td>
                    <td>18</td>
                    <td>6</td>
                    <td>10/05/2025</td>
                    <td>
                       <form action="pagarPrestamo" method="post">
                            <button type="submit" name="accion" value="Pagar">Pagar</button>
                       </form>
                    </td> 
                </tr>
               	<tr>
                    <td>2</td>
                    <td>05/10/2024</td>
                    <td>$800.000</td>
                    <td>10/11/2024</td>
                    <td>$20.000</td>
                    <td>1</td>
                    <td>5</td>
                    <td>10/04/2025</td>
                                           	<td>
                        <form action="pagarPrestamo" method="post">
                            <button type="submit" name="accion" value="Pagar">Pagar</button>
                        </form>
                    </td> 
                </tr>

                </tbody>
            </table>
        </div>
        
       </div> 
       

</body>
</html>