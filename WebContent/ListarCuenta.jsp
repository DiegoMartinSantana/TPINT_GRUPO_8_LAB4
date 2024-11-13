<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Dominio.Cuenta"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="row">
		<div class="col-2">
			<%@include file="NavegacionComponente.jsp"%>
		</div>
		<div class="section col-9">
			<h2>Listado de Cuentas</h2>

			<table class="table table-striped">
				<thead>
					<tr>
						<th>IdCuenta</th>
						<th>IdCliente</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<Cuenta> cuentas = (List<Cuenta>) request.getAttribute("cuentas");
					if (cuentas != null && !cuentas.isEmpty()) {
						for (Cuenta cuenta : cuentas) {
					%>
					<tr>
						<td><%=cuenta.getIdCuenta()%></td>
						<td><%=cuenta.getIdCliente()%></td>

						<td><a
							href="CuentaServlet?accion=editar&dni=<%=cuenta.getIdCuenta()%>"
							class="btn btn-warning btn-sm">Editar</a> <a
							href="CuentaServlet?accion=eliminar&dni=<%=cuenta.getIdCuenta()%>"
							class="btn btn-danger btn-sm">Eliminar</a></td>
					</tr>
					<%
    }
}
%>
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>