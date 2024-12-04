<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Dominio.Cuenta"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />
	<style>
		<%@include file="../Styles/StyleTablas.css" %>
	</style>
<title>Cuentas</title>


</head>
<body>

	<div class="row">
    <div class="col-2">
        <%@include file="NavegacionComponente.jsp"%>
    </div>
    <div class="col-9 section " style="margin-top:50px;">
    <h2 class="text-center mb-4" style="font-size: 36px; font-weight: bold; color: #333;">Listado de Cuentas</h2>

    <div>
        <table id="cuentasTable" class="table table-hover align-middle" style="border-radius: 16px; overflow: hidden; background: #fff; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            <thead style="background: #007bff; color: #fff; text-align: center;">
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>DNI</th>
                    <th>Fecha Creación</th>
                    <th>CBU</th>
                    <th>Tipo de Cuenta</th>
                    <th>Saldo</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<Cuenta> cuentas = (List<Cuenta>) request.getAttribute("cuentas");
                if (cuentas != null && !cuentas.isEmpty()) {
                    for (Cuenta cuenta : cuentas) {
                %>
                <tr style="border-bottom: 1px solid #e0e0e0;">
                    <td style="text-align: center;"><%= cuenta.getCliente().getNombre() %></td>
                    <td style="text-align: center;"><%= cuenta.getCliente().getApellido() %></td>
                    <td style="text-align: center;"><%= cuenta.getCliente().getDni() %></td>
                    <td style="text-align: center;"><%= cuenta.getCreacion() %></td>
                    <td style="text-align: center;"><%= cuenta.getCbu() %></td>
                    <td style="text-align: center;">
                        <%= cuenta.getTipo() == 1 ? "Caja de ahorro" : 
                            cuenta.getTipo() == 2 ? "Cuenta Corriente" : "N/A" %>
                    </td>
                    <td style="text-align: center;"><%= cuenta.getSaldo() %></td>
                    <td style="text-align: center;">
                     
                        <a href="CuentaServlet?EliminarIdCuenta=<%=cuenta.getIdCuenta()%>" 
                           class="btn btn-danger btn-sm">
                            <i class="bi bi-trash-fill"></i> Eliminar
                        </a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="8" style="text-align: center;">No hay cuentas disponibles.</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
</div>

</div>
<script>
        $(document).ready(function() {
            console.log("jQuery version:", $.fn.jquery);
            console.log("DataTables disponible:", typeof $.fn.DataTable);
            $('#cuentasTable').DataTable();
        });
    </script>

</body>
</html>