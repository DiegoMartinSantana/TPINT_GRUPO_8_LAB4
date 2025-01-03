
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />
</head>
<body>

<%@include file="NavegacionComponenteUsuario.jsp" %>
    
    <% 
    ArrayList<PrestamoDto> prestamos = session.getAttribute("AllPrestamos") != null 
    ? (ArrayList<PrestamoDto>) session.getAttribute("AllPrestamos") 
    : null;

    	
    %>
 <div class="container mt-5">
    <h3 class="mb-4">Historial</h3>

    <% if(prestamos != null){ %>

    <div class="row">
        <div class="col-12">
            <%if(session.getAttribute("PrestamoAceptado")!=null){ %>
            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                <strong>Préstamo Solicitado</strong> El banco analizará su solicitud.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% } %>

            <table class="table table-bordered table-hover text-center" id="prestamosTable">
                <thead class="table-primary">
                    <tr>
                        <th>Cbu</th>
                        <th>Monto Cuota</th>
                        <th>Importe Solicitado</th>
                        <th>Plazo Cuotas</th>
                        <th>Interés</th>
                        <th>Importe a Pagar</th>
                        <th>Estado</th>
                        <th>Fecha Préstamo</th>
                         
                    </tr>
                </thead>
                <tbody>
                    <% for(PrestamoDto prestamo : prestamos) { %>
                    <tr>
                        <td><%= prestamo.cbu %></td>
                        <td><%= String.format("%,.2f",prestamo.montoCuota) %></td>
                        <td><%= String.format("%,.2f", prestamo.importeSolicitado) %></td>
                        <td><%= prestamo.plazoCuotas %></td>
                        <td><%= prestamo.interes %></td>
                        <td><%= String.format("%,.2f", prestamo.importePagar) %></td>
                        <td>
                            <% if(prestamo.estado == 1) { %>
                            En curso
                            <% } else if(prestamo.estado == 2) { %>
                            Finalizado
                            <% } %>
                        </td>
                        <td><%= prestamo.fechaPrestamo %></td>
                      
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <% } else { %>
    <p class="text-muted">Sin préstamos.</p>
    <% } %>
</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
$(document).ready(function() {
    $('#prestamosTable tbody .datatable-ignore').remove();

    $('#prestamosTable').DataTable({
        language: {
        	url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
        }
    });
});
</script>
</body>
</html>
