<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dominio.Movimiento" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
 <%@include file="NavegacionComponenteUsuario.jsp" %>
    <div class="container py-5">
        <h3>Últimas Transferencias</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Monto</th>
                    <th>Destino</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    ArrayList<Movimiento> transferencias = (ArrayList<Movimiento>) request.getAttribute("transferencias");
                    if (transferencias != null && !transferencias.isEmpty()) {
                        for (Movimiento transferencia : transferencias) {
                %>
                <tr>
                    <td><%= transferencia.getFecha() %></td>
                    <td><%= transferencia.getImporte() %></td>
                    <td><%= transferencia.getId_destino() %></td>
                </tr>
                <% 
                        }
                    } else { 
                %>
                <tr>
                    <td colspan="3" class="text-center">No se encontraron transferencias.</td>
                </tr>
                <% 
                    } 
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
