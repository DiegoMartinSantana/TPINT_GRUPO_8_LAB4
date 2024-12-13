<%@ page import="Dominio.Cuenta" %>
<%@ page import="Dominio.Movimiento" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />

  <style>
		<%@include file="../Styles/StyleHome.css" %>
	</style>


</head>

<body>
<%
	ArrayList<Cuenta> Cuentas = (ArrayList<Cuenta> )  request.getSession().getAttribute("Cuentas") ;
	ArrayList<Movimiento> Transferencias = (ArrayList<Movimiento> )  request.getSession().getAttribute("Transferencias") ;

%>
    <%@include file="NavegacionComponenteUsuario.jsp" %>
    
    <div class="container py-5">
   
    <h4 class="section-title mb-4"><i class="fas fa-wallet"></i> Tus Cuentas</h4>
    <div class="row">
        <% for (Cuenta cuenta : Cuentas) { %>
          <div class="col-lg-4 col-md-6 mb-4">
    <div class="card cuenta-card shadow-sm">
        <div class="card-body">
            <h6 class="text-primary fw-bold">CBU: <%= cuenta.getCbu() %></h6>
            <p class="text-muted mb-1">Saldo Disponible:</p>
            <h5 class="saldo">$<%= String.format("%,.2f",cuenta.getSaldo()) %></h5>
            <a href="HomeServlet?cuentaId=<%= cuenta.getIdCuenta() %>" class="btn btn-outline-primary btn-block mt-3">
               Ver Movimientos <i class="fas fa-chevron-right"></i>
            </a>
        </div>
        
        <div class="card-footer text-center">
            <a href="Transferencias.jsp" class="btn text-warning" title="Añadir nueva transferencia">
                <i class="fas fa-plus fa-2x"></i>
            </a>
        </div>
    </div>
</div>

        <% } %>
    </div>

    
    <h4 class="section-title mt-5 mb-4"><i class="fas fa-history"></i> Historial Movimientos</h4>
    <div class="card transfer-card shadow-sm">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover" id="transferenciasTable">
                    <thead class="table-primary">
                        <tr>
                            <th>Fecha</th>
                            <th>Importe</th>
                            <th>Detalle</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Movimiento transferencia : Transferencias) { %>
                            <tr>
                                <td><%= transferencia.getFecha() %></td>
                                <td>$<%=String.format("%,.2f",  transferencia.getImporte()) %></td>
                                <td><%= transferencia.getDetalle() %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function() {
    $('#transferenciasTable tbody .datatable-ignore').remove();

    $('#transferenciasTable').DataTable({
        language: {
        	url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
        }
    });
});
    </script>

</body>
</html>