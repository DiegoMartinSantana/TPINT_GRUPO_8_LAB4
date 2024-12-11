<%@ page import="Dominio.Cuota" %> 
<%@ page import="java.util.ArrayList" %>
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
<% 
   
   
    ArrayList<Cuota> Cuotas = session.getAttribute("Cuotas") != null 
    ? (ArrayList<Cuota>) session.getAttribute("Cuotas")
    : null;

 
    %>
<body>

	<% 
    int idCuota = (int) request.getAttribute("idCuota"); // Obtén el id de la cuota desde los atributos de la solicitud.
    Cuota cuotaSeleccionada = null;

    // Si tienes una lista de Cuotas llamada "Cuotas" en el request, filtra la cuota correspondiente.
    if (Cuotas != null) {
        for (Cuota cuota : Cuotas) {
            if (cuota.getId() == idCuota) {  // Compara los valores de tipo int
                cuotaSeleccionada = cuota; // Asignamos la cuota seleccionada
                break; // Salimos del loop una vez encontrada la cuota
            }
        }
    }
%>

<% if (cuotaSeleccionada != null) { %>
    <li class="list-group-item d-flex align-items-center justify-content-between">
        <div>
            <i class="bi bi-credit-card"></i> <strong><%= cuotaSeleccionada.getNumeroCuota() %></strong>:
            $<%= cuotaSeleccionada.getImporte() %>
            <p>
                Vencimiento: <%= cuotaSeleccionada.getVencimento() %>
            </p>
        </div>
    </li>
<% } else { %>
    <li class="list-group-item d-flex align-items-center justify-content-between">
        <div>
            <strong>No se encuentra la cuota correspondiente a este préstamo.</strong>
        </div>
    </li>
<% } %>
	



</body>
</html>