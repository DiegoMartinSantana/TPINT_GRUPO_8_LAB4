<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Autorizaciones</title>
<style>
<%@include file="../Styles/StyleCliente.css" %>
<%@include file="../Styles/StyleTablas.css" %>

      table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        button {
            margin: 2px;
            padding: 8px 12px;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-aceptar {
            background-color: #28a745;
        }
        .btn-aceptar:hover {
            background-color: #218838;
        }
        .btn-rechazar {
            background-color: #dc3545;
        }
        .btn-rechazar:hover {
            background-color: #c82333;
        }
        .btn-filtrar {
            margin: 10px 5px;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-filtrar:hover {
            background-color: #0056b3;
        }
</style>
</head>

<body>
<div class="row">
       <div class="col-2"> 
       <%@include file="NavegacionComponente.jsp" %>
       	</div>
  <div class="col-9 section">
    <h2 class="text-center mb-4">Prestamos</h2>
<div>
        <button class="btn-filtrar" onclick="filtrarEstado(1)">Autorizados</button>
        <button class="btn-filtrar" onclick="filtrarEstado(2)">Denegados</button>
        <button class="btn-filtrar" onclick="filtrarEstado(3)">Pendientes</button>
    </div>
    
    <%
        // Obtén la lista de préstamos de la sesión
        ArrayList<Prestamo> prestamos = (ArrayList<Prestamo>) session.getAttribute("prestamos");

        if (prestamos == null || prestamos.isEmpty()) {
    %>
        <p>No hay préstamos disponibles.</p>
    <%
        } else {
    %>
        <table>
            <thead>
                <tr>
                    <th>ID Préstamo</th>
                    <th>ID Movimiento</th>
                    <th>Monto Cuota</th>
                    <th>Importe Solicitado</th>
                    <th>Plazo Cuotas</th>
                    <th>Interés (%)</th>
                    <th>Importe a Pagar</th>
                    <th>Estado</th>
                    <th>Fecha del Préstamo</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Formato para la fecha
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

                    for (Prestamo prestamo : prestamos) {
                %>
                <tr>
                    <td><%= prestamo.getIdPrestamo() %></td>
                    <td><%= prestamo.getIdMovimiento() %></td>
                    <td><%= prestamo.getMontoCuota() %></td>
                    <td><%= prestamo.getImporteSolicitado() %></td>
                    <td><%= prestamo.getPlazoCuotas() %></td>
                    <td><%= prestamo.getInteres() %></td>
                    <td><%= prestamo.getImportePagar() %></td>
                    <td>
                        <%
                            switch (prestamo.getEstado()) {
                                case 1: out.print("Autorizado"); break;
                                case 2: out.print("Denegado"); break;
                                case 3: out.print("Pendiente"); break;
                                default: out.print("Desconocido");
                            }
                        %>
                    </td>
                    <td><%= prestamo.getFechaPrestamo().format(formatter) %></td>
                    <td>
                        <button class="btn-aceptar" onclick="accionPrestamo(<%= prestamo.getIdPrestamo() %>, 'aceptar')">Aceptar</button>
                        <button class="btn-rechazar" onclick="accionPrestamo(<%= prestamo.getIdPrestamo() %>, 'rechazar')">Rechazar</button>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    <%
        }
    %>

</div>
   

</body>
</html>