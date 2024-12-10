
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
    
        <h3 class="mb-4">Historial </h3>

     	<% if(prestamos != null){ %>
	
        <div class="row">
            <div class="col-12"><div>
            <%if(session.getAttribute("PrestamoAceptado")!=null){ %>
<div class="alert alert-primary alert-dismissible fade show" role="alert">
  <strong>Prestamo Solicitado</strong>		 El banco analizara su solicitud.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<div>
</div>
<%} %>
               
                <table class="table table-bordered table-hover" style="justify-content: center" id="prestamosTable">
                    <thead class="table">
                        <tr>
                          
                            <th>Cbu</th>
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
                             <%for(PrestamoDto prestamo : prestamos ){ %>
                            <tr>
                              
                                <td><%=prestamo.cbu%></td>
                                <td><%=prestamo.montoCuota %></td>
                                <td><%=String.format("%.0f", prestamo.importeSolicitado) %></td>
                                <td><%=prestamo.plazoCuotas %></td>
                                <td><%=prestamo.interes %></td>
                                <td style="padding:20px ;padding-rigth:20px"><%=String.format("%.0f", prestamo.importePagar) %> </td>
                                
                                <%if(prestamo.estado==1) {%>
                                	<td>En curso</td>
                               <%} %>
                           
                                 <%if(prestamo.estado==2) {%>
                                	<td>Finalizado</td>
                                	
                                	 
                               <%} %> 
                                
                                <td><%=prestamo.fechaPrestamo %></td>
                           <%} %>
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
    <script>
$(document).ready(function() {
    // Eliminar filas ignoradas antes de inicializar DataTables
    $('#prestamosTable tbody .datatable-ignore').remove();

    // Inicializar DataTables
    $('#prestamosTable').DataTable({
        // Configuración opcional si necesitas personalizar algo
        language: {
        	url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
        }
    });
});
</script>
</body>
</html>
