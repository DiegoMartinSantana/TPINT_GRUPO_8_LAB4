  <%@ page import="Dominio.Dto.PrestamoDto" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Dominio.Dto.PrestamoDto" %> 
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pendientes Pago</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>
<style>
        .list-group-item {
            border: none;
            background: linear-gradient(135deg, #f3f4f6, #e3e8ee);
            border-radius: 8px;
            margin-bottom: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .list-group-item:hover {
            transform: scale(1.02);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
        }
        .list-group-item .badge {
            font-size: 0.9rem;
            padding: 0.5em 0.7em;
            border-radius: 12px;
        }
        .list-group-item i {
            color: #6c63ff;
            font-size: 1.5rem;
            margin-right: 10px;
        }
    </style>
 <% 
    ArrayList<PrestamoDto> prestamos = session.getAttribute("PrestamosPendientesPago") != null 
    ? (ArrayList<PrestamoDto>) session.getAttribute("PrestamosPendientesPago") 
    : null;    	
    %>
<%@include file="NavegacionComponenteUsuario.jsp" %>

<div class="container mt-5 ">

<div class="row">
<div class="col-3">

<div class="list-group "> 

	<!-- VALIDAR QUE NO DIBUJE AL RECARGAR -->
     	<% if(prestamos != null){ %>
     	  <%for(PrestamoDto prestamo : prestamos ){ %>
  
  
  		<a href="CuotasServlet?id:<%=prestamo.idPrestamo %>" class="list-group-item list-group-item-action" style="padding:30px 40px">
  		
  		Solicitado :<%=prestamo.importeSolicitado %>
  		<br>
  		Cuotas:<%=prestamo.plazoCuotas %>
  		<br>
  		Monto por cuota :<%=prestamo.montoCuota %>
  		<br>
  		Fecha : <%=prestamo.fechaPrestamo %>
  		</a>

 				 <%} %>
</div>

<%} %>
</div>
	<div class="col-9">
	  <h3 class="mb-4 text-center">Ejemplos de Cuotas</h3>
        <ul class="list-group">
            <li class="list-group-item d-flex align-items-center justify-content-between">
                <div>
                    <i class="bi bi-credit-card"></i>
                    <strong>Cuota 1</strong>: $500.00
                </div>
                <span class="badge bg-primary">Pagada</span>
            </li>
            <li class="list-group-item d-flex align-items-center justify-content-between">
                <div>
                    <i class="bi bi-wallet2"></i>
                    <strong>Cuota 2</strong>: $450.00
                </div>
                <span class="badge bg-success">Pendiente</span>
            </li>
            <li class="list-group-item d-flex align-items-center justify-content-between">
                <div>
                    <i class="bi bi-cash-stack"></i>
                    <strong>Cuota 3</strong>: $480.00
                </div>
                <span class="badge bg-warning">Próxima</span>
            </li>
            <li class="list-group-item d-flex align-items-center justify-content-between">
                <div>
                    <i class="bi bi-bank"></i>
                    <strong>Cuota 4</strong>: $520.00
                </div>
                <span class="badge bg-danger">Pagar</span>
            </li>
            <li class="list-group-item d-flex align-items-center justify-content-between">
                <div>
                    <i class="bi bi-coin"></i>
                    <strong>Cuota 5</strong>: $600.00
                </div>
                <span class="badge bg-secondary">Reprogramada</span>
            </li>
        </ul>
	</div>
</div>
</div>
</body>
</html>