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

body {
    background-color: #f9f9f9;
    font-family: Arial, sans-serif;
}

.section-title {
    font-weight: bold;
    border-left: 4px solid #007bff;
    padding-left: 10px;
}

.card {
    border-radius: 12px;
    border: none;
    transition: transform 0.2s, box-shadow 0.2s;
}

.card:hover {
    transform: scale(1.02);
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.highlight {
    color: #007bff;
    font-size: 1.2rem;
    font-weight: bold;
}

.btn-outline-primary {
    border: 2px solid #007bff;
    font-weight: bold;
    transition: background-color 0.3s, color 0.3s;
}

.btn-outline-primary:hover {
    background-color: #007bff;
    color: #fff;
}


.cuenta-card {
    background: #ffffff;
}

.cuenta-card .card-body {
    text-align: center;
}

.cuenta-card .saldo {
    font-size: 1.5rem;
    margin-top: 10px;
}


.transfer-card {
    margin-top: 20px;
}

.table {
    font-size: 0.9rem;
}

.table-hover tbody tr:hover {
    background-color: #f1f5ff;
}

.table-primary {
    background-color: #007bff;
    color: white;
}
 
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
            <h5 class="saldo">$<%= cuenta.getSaldo() %></h5>
            <a href="HomeServlet?cuentaId=<%= cuenta.getIdCuenta() %>" class="btn btn-outline-primary btn-block mt-3">
               Ver Transferencias <i class="fas fa-chevron-right"></i>
            </a>
        </div>
        
        <div class="card-footer text-center">
            <a href="Transferencias.jsp" class="btn text-warning" title="A�adir nueva transferencia">
                <i class="fas fa-plus fa-2x"></i>
            </a>
        </div>
    </div>
</div>

        <% } %>
    </div>

    
    <h4 class="section-title mt-5 mb-4"><i class="fas fa-history"></i> Historial Transferencias</h4>
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
                                <td>$<%= transferencia.getImporte() %></td>
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
    // Eliminar filas ignoradas antes de inicializar DataTables
    $('#transferenciasTable tbody .datatable-ignore').remove();

    // Inicializar DataTables
    $('#transferenciasTable').DataTable({
        // Configuraci�n opcional si necesitas personalizar algo
        language: {
        	url: 'https://cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
        }
    });
});
    </script>

</body>
</html>