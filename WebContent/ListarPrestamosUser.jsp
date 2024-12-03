<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Dominio.Dto.PrestamoDto" %> 
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Prestamos</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="NavegacionComponenteUsuario.jsp" %>
    
    <% 
    ArrayList<PrestamoDto> prestamos = session.getAttribute("AllPrestamos") != null 
    ? (ArrayList<PrestamoDto>) session.getAttribute("AllPrestamos") 
    : null;

    	
    %>
    <div class="container mt-5">
    
        <h1 class="mb-4">Loans Overview</h1>

     	<% if(prestamos != null){ %>
        <div class="row">
            <div class="col-12">
                <h3>Accepted Loans</h3>
                <table class="table table-bordered table-hover">
                    <thead class="table">
                        <tr>
                            <th>ID Prestamo</th>
                            <th>ID Cuenta</th>
                            <th>Monto Cuota</th>
                            <th>Importe Solicitado</th>
                            <th>Plazo Cuotas</th>
                            <th>Interés</th>
                            <th>Importe Pagar</th>
                            <th>Estado</th>
                            <th>Fecha Prestamo</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                            <tr>
                            <%for(PrestamoDto prestamo : prestamos ){ %>
                                <td><%=prestamo.idPrestamo %>}</td>
                                <td><%=prestamo.idCuenta %></td>
                                <td><%=prestamo.montoCuota %></td>
                                <td><%=prestamo.importeSolicitado %></td>
                                <td><%=prestamo.plazoCuotas %></td>
                                <td><%=prestamo.interes %></td>
                                <td><%=prestamo.importePagar %></td>
                                <td><%=prestamo.estado %></td>
                                <td><%=prestamo.fechaPrestamo %></td>
                           <%} %>
                            </tr>
                   
                    </tbody>
                </table>
            </div>
        </div>

        
        <div class="row mt-5">
            <div class="col-12">
                <h3>Requested Loans</h3>
                <table class="table table-bordered table-hover">
                    <thead class="table">
                        <tr>
                            <th>ID Prestamo Solicitado</th>
                            <th>ID Cuenta</th>
                            <th>Monto Cuota</th>
                            <th>Importe Solicitado</th>
                            <th>Plazo Cuotas</th>
                            <th>Interés</th>
                            <th>Importe Pagar</th>
                            <th>Estado</th>
                            <th>Fecha Prestamo</th>
                        </tr>
                    </thead>
                    <tbody>
                       
                            <tr>
                                <td>${prestamoSolicitado.IdPrestamoSolicitado}</td>
                                <td>${prestamoSolicitado.IdCuenta}</td>
                                <td>${prestamoSolicitado.MontoCuota}</td>
                                <td>${prestamoSolicitado.ImporteSolicitado}</td>
                                <td>${prestamoSolicitado.PlazoCuotas}</td>
                                <td>${prestamoSolicitado.Interes}</td>
                                <td>${prestamoSolicitado.ImportePagar}</td>
                                <td>${prestamoSolicitado.Estado}</td>
                                <td>${prestamoSolicitado.FechaPrestamo}</td>
                            </tr>
                   
                    </tbody>
                </table>
            </div>
        </div>
        <%}else{ %>
        <p>sin prestamos.</p>	
        <%} %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
