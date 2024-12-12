  <%@ page import="Dominio.Cuota" %> 
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
   
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

<style>
		<%@include file="../Styles/StyleAbonarPrestamo.css" %>

     
	</style>

</head>
<body>

  
 <% 
    ArrayList<PrestamoDto> prestamos = session.getAttribute("PrestamosPendientesPago") != null 
    ? (ArrayList<PrestamoDto>) session.getAttribute("PrestamosPendientesPago") 
    : null;    	
    
   
    ArrayList<Cuota> Cuotas = session.getAttribute("Cuotas") != null 
    ? (ArrayList<Cuota>) session.getAttribute("Cuotas")
    : null;

 
    %>
<%@include file="NavegacionComponenteUsuario.jsp" %>

 <div class="container">
        <div class="dashboard-container">
            <div class="row">
               
                <div class="col-12 col-md-4 mb-4">
                    <div class="section-header">
                        <h3><i class="fas fa-money-bill-wave"></i> Préstamos</h3>
                    </div>
                    <% if (prestamos != null && !prestamos.isEmpty()) { %>
                        <% for (PrestamoDto prestamo : prestamos) { %>
                        
                            <div class="prestamo-item">
                                <div class="prestamo-details">
                                    <div class="prestamo-icon">
                                        <i class="fas fa-file-invoice-dollar"></i>
                                    </div>
                                    <div>
                                    
                                        <h6 class="mb-1">Préstamo </h6>
                                        <p class="text-muted mb-0">
                                            <strong>Importe:</strong> $<%=String.format("%.2f", prestamo.importeSolicitado) %> 
                                            <br>
                                            <strong>Cuotas:</strong> <%= prestamo.plazoCuotas %>
                                            <br>
                                            <strong>Depositado en  : </strong><%=prestamo.cbu %>
                           
                                       
                                    </div>
                                </div>
                              
                                    <a href="CuotasServlet?id=<%= prestamo.idPrestamo %>" class="btn btn-sm btn-secondary btn-details" style="width: 120px; min-width: 120px;">
                        Ver Detalles
                    </a>
                                
                            </div>
                            
                        <% } %>
                    <% } else { %>
                        <div class="empty-state">
                            <i class="fas fa-scroll fa-3x text-muted mb-3"></i>
                            <h5>Sin Préstamos</h5>
                            <p class="text-muted">No hay préstamos registrados.</p>
                        </div>
                    <% } %>
                </div>

              
                <div class="col-12 col-md-8">
                    <div class="section-header">
                        <h3><i class="fas fa-receipt"></i> Cuotas</h3>
                    </div>
                    <% if (Cuotas != null && !Cuotas.isEmpty()) { %>
                        <% for (Cuota cuota : Cuotas) { %>
                            <div class="installment-item">
                                <div class="installment-details">
                                    <div class="installment-icon">
                                        <i class="fas fa-credit-card"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-1">Cuota <%= cuota.getNumeroCuota() %></h6>
                                        <p class="text-muted mb-0">
                                            <strong>Importe:</strong> $<%= String.format("%.2f",cuota.getImporte()) %> 
                                                                                    </p>
                                                                                    <p class="text-muted mb-0">
                                             <strong>Vencimiento:</strong> <%= cuota.getVencimento() %>
</p>
                                    </div>
                                </div>
                                
                                    <% if (cuota.getEstado() == 1) { %>
                                    <span class="badge bg-primary status-badge">Pendiente</span>
                                   <div class="installment-actions">
                                        <a href="PagarCuota.jsp?idCuota=<%=cuota.getId()%>"  class="btn btn-primary">Pagar cuota </a>
                                         </div>
                                    <% } %>
                                    
                                    <% if (cuota.getEstado() == 2) { %>
                                  
                                        <span class="badge bg-success status-badge">Pagado</span>
                                        
                                    <% } else if (cuota.getEstado() == 3) { %>
                                    
                                        <span class="badge bg-danger status-badge">Vencida</span>
                                         <div class="installment-actions">
                                    <a href="PagarCuota.jsp?idCuota=<%=cuota.getId()%>"  class="btn btn-primary">Pagar cuota </a>
                                    </div>
                                    <% } %>
                               
                            </div>
                        <% } %>
                    <% } else { %>
                        <div class="empty-state">
                            <i class="fas fa-file-invoice fa-3x text-muted mb-3"></i>
                            <h5>Sin Cuotas</h5>
                            <p class="text-muted">No hay cuotas registradas para este préstamo.</p>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>


</body>




</html>





























