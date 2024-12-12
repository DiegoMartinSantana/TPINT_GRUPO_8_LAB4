<%@ page import="Dominio.Cuota" %> 
<%@ page import="Dominio.Cuenta" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>Pagar Prestamos</title>
<style>
<%@include file="../Styles/StyleCliente.css" %>
      body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f8f9fa;
            margin: 0;
        }
        .form-container {
            background: #fff;
            border-radius: 10px;
            padding: 2.5rem;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 600px;
        }
        .form-title {
            margin-bottom: 2rem;
            text-align: center;
            font-weight: bold;
            color: #333;
            font-size: 1.5rem;
        }
        .details-card {
            background: #e7f1ff;
            border: 1px solid #007bff;
            border-radius: 8px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            color: #00376b;
        }
        .details-card strong {
            font-size: 1.25rem;
        }
        .details-card p {
            margin: 0.5rem 0 0;
            font-size: 1rem;
        }
        select.form-select {
            font-size: 1.1rem;
            height: calc(3rem + 2px);
        }
        .btn-primary, .btn-danger {
            font-size: 1.2rem;
            padding: 0.75rem;
        }
        .button-group {
            display: flex;
            gap: 1rem;
        }
        .button-group .btn {
            flex: 1;
        }
    </style>

 
</head>
<% 
   
   
    ArrayList<Cuota> Cuotas = session.getAttribute("Cuotas") != null 
    ? (ArrayList<Cuota>) session.getAttribute("Cuotas")
    : null;
    
    ArrayList<Cuenta> Cuentas = session.getAttribute("cuentasDesplegable") != null 
    	    ? (ArrayList<Cuenta>) session.getAttribute("cuentasDesplegable")
    	    : null;

 
    %>
<body>

	<% 
    int idCuota = Integer.parseInt(request.getParameter("idCuota"));
	Cuota cuotaSeleccionada = new Cuota();
	if (Cuotas != null) {
        for (Cuota cuota : Cuotas) {
            if (cuota.getId() == idCuota) { 
                cuotaSeleccionada = cuota; 
                break; 
            }
        }
    }
   
%>
      <div class="form-container">
        <h2 class="form-title">Pago de Cuota</h2>
        <form action="PagarCuota" method="post">
            <input type="hidden" id="id" name="idCuota" value="<%=idCuota%>"> 

            <div class="mb-4">
                <label for="id_cuenta_origen" class="form-label">Cuenta a debitar:</label>
                <select name="id_cuenta_pago" class="form-select">
                    <% for (Cuenta cuenta : Cuentas) { 
                        String tipoCuenta = "";
                        if (cuenta.getTipo() == 1) {
                            tipoCuenta = "Caja de Ahorro";
                        } else if (cuenta.getTipo() == 2) {
                            tipoCuenta = "Cuenta Corriente";
                        }
                    %>
                        <option value="<%= cuenta.getIdCuenta() %>">
                            <%= tipoCuenta %> - CBU: <%= cuenta.getCbu() %> - Saldo: $<%= String.format("%,.2f",cuenta.getSaldo())%>
                        </option>
                    <% } %>
                </select>
            </div>

          
            <div class="details-card">
                <strong>Cuota: <%= cuotaSeleccionada.getNumeroCuota() %></strong>
                <p>Importe: <span style="font-weight: bold; color: #007bff;">$<%= String.format("%,.2f", cuotaSeleccionada.getImporte()) %></span></p>
                <p>Vencimiento: <span style="font-weight: bold; color: #d9534f;"><%= cuotaSeleccionada.getVencimento() %></span></p>
            </div>

           
            <div class="button-group">
                <a href="HomeServlet" class="btn btn-danger">Cancelar</a>
                <button type="submit" class="btn btn-primary" name="btnPagarCuota" style="margin-top:0px">Pagar Cuota</button>
            </div>
        </form>

        <% String mensaje = "Pago realizado con éxito"; %>
        <% if (request.getAttribute("pagoRealizado") != null) { %>
            <div class="alert alert-success mt-4"><%= mensaje %></div>
        <% } %>
        
        <% String mensajeError = "Saldo insuficiente"; %>
        <% if (request.getAttribute("saldoInsuficiente") != null) { %>
            <div class="alert alert-danger mt-4"><%= mensajeError %></div>
        <% } %>
    </div>

</body>
</html>